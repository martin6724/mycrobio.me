require 'json'

html = File.read('db/bugs.html')
require 'nokogiri'
#condense locations to 8 systems
dom = Nokogiri::HTML(html)
values = {
    'nasopharynx' => [
        "mouth",
        "nasopharynx",
        "nose",
        "oropharynx",
        "pharynx",
        "pharynx[citation needed]",
        "saliva",
        "teeth: dental plaque",
        "throat",
    ],
    'respiratory' => [
        "lung", 
        "respiratory epithelium",
        "sputum",
        "upper respiratory tract",
    ],
    'stomach' => [
        "stomach",
    ],
    'small intestine' => [
        "gi tract",
        "intestines",
        "small and large intestine",
        "small intestine",
        "small intestine (ileon)",
    ],
    'large intestine' => [
        "anus channel",
        "cecum",
        "gi tract (known probiotic)",
        "large intestine",
        "rectus",
    ],
    'urethra' => [
        "anterior urethra",
        "t",
    ],
    'genitalia' => [
        "external genitalia",
        "external genitalia,",
        "perineum",
    ],
    'skin' => [
        "general distribution",
    ],
}
lookup = Hash[values.values.zip(values.keys)]
#sanitize locations
base_data = dom.css('tr').map do |row|
    row.text.strip
end
    .select do |item|
        item.include? "\n"
    end
    .map do |item|
        item.split("\n")
    end
    .reject do |item|
        item.first.include? "name" or item.first == "v"
    end
    .reject do |bug, location|
        location.include?("1983")
    end
    .map do |bug, locations|
        [bug.downcase, locations.split(', ').map{|item| item.downcase}]
    end
    .reject do |bug, locations|
        locations.include? "feces"
    end
    .map do |bug, locations|
        locations.product([bug])
    end.flatten(1).map do |location, bug|
        # {flora: {bug: bug, organ_system: location}}
        lookup.map do |locations, body_spot|
            if locations.include?(location)
                {
		    		wiki_organ_system_name: location, 
                    organ_system_name: body_spot, 
                    organism_name: bug
                }
            end
        end.compact
    end.flatten(1)

#populate the db tables:
base_data.each do |item|
    organism = Organism.find_or_create_by name: item[:organism_name]
    organ_system = OrganSystem.find_or_create_by name: item[:organ_system_name]
    puts Flora.find_or_create_by organism: organism, organ_system: organ_system
end
#sanitize organism and antibiotic list; took out deprecated antibiotics
exclusions = [
	'[hide]',
	'Others',
	'Generic',
	'Social',
	'Unclassified',
	"arsphenamine",
	"azlocillin",
	"carbacephem",
	"ceftobiprole",
	"flucloxacillin",
	"fusidic",
	"geldanamycin",
	"grepafloxacin",
	"herbimycin",
	"lipopeptide",
	"lomefloxacin",
	"loracarbef",
	"metacycline",
	"methicillin",
	"mezlocillin",
	"nadifloxacin",
	"pharmacology",
	"piperacillin",
	"platensimycin",
	"posizolid",
	"radezolid",
    "silver",
	"spiramycin",
	"sulfamethizole",
	"sulfadimethoxine",
	"sulfonamidochrysoidine",
	"teixobactin",
	"temafloxacin",
	"trovafloxacin",
	"temocillin",
	"thiamphenicol",
	"ticarcillin",
    "ticarcillin/clavulanate",
    "trimethoprim",
].map{|item| item.downcase}

#populate the antibiotics table
html1 = File.read "db/antibiotics.html"
dom1 = Nokogiri::HTML html1

antibiotic_list = dom1.css('tr').map do |row|
	row.text.strip.split.first
end.compact.sort.uniq #alphabetize and remove repeats
.reject do |item|
	exclusions.include?(item.downcase)
end
.map{|item| item.downcase } #take all caps out
.map{|item| item.sub('(bs)', '') } #remove junk at the end of some entries
.reject{|item| item.end_with?('s')} #remove Abx classes

antibiotic_list.each do |item|
	puts Antibiotic.find_or_create_by name: item
end

abx_families = {
    'aminoglycoside' => 
                    ['amikacin', 'capreomycin', 'gentamicin', 'kanamycin', 'neomycin', 'netilmicin', 'paromomycin', 'spectinomycin', 'streptomycin', 'tobramycin'],
    'antimycobacterial' => 
                    ['clofazimine', 'cycloserine', 'dapsone', 'ethambutol', 'ethionamide', 'isoniazid', 'pyrazinamide', 'rifabutin', 'rifampin'],
    'beta-lactam' => [
                    'cephalosporin': ['cefaclor', 'cefadroxil', 'cefalexin', 'cefazolin', 'cefdinir', 'cefditoren', 'cefepime', 
'cefixime', 'cefoperazone', 'cefotaxime', 'cefpodoxime', 'cefprozil', 'ceftaroline', 'ceftazidime', 'ceftibuten', 'ceftriaxone', 'cefuroxime'], 
                    'carbapenem': ['doripenem', 'ertapenem', 'imipenem/cilastatin', 'meropenem'], 
                    'monobactam': 'aztreonam', 
                    'penicillin': ['amoxicillin', 'amoxicillin/clavulanate', 'ampicillin', 'ampicillin/sulbactam', 'dicloxacillin', 'nafcillin', 'oxacillin', 'penicillin', 'piperacillin/tazobactam']], 
    'fluoroquinolone' => 
                    ['ciprofloxacin', 'enoxacin', 'gatifloxacin', 'gemifloxacin', 'levofloxacin', 'moxifloxacin', 'nalidixic acid', 'norfloxacin', 
'ofloxacin', 'sparfloxacin'],
    'lincosamide' => 
                    ['clindamycin', 'lincomycin'],
    'macrolide' => 
                    ['azithromycin', 'clarithromycin', 'roxithromycin', 'telithromycin'],
    'nitrofuran' => 
                    ['furazolidone', 'nitrofurantoin'],
    'nitroimidazole' => 
                    ['metronidazole', 'tinidazole'],
    'other' => 
                    ['fosfomycin', 'mupirocin', 'rifaximin'],
    'oxazolidinone' => 
                    ['linezolid', 'tedizolid'],
    'polypeptide' => 
                    ['cyclic polypeptide': ['bacitracin', 'colistin', 'polymyxin'],
                    'cyclic lipopeptide': 'daptomycin'],
                    'glycopeptide': ['dalbavancin', 'oritavancin', 'teicoplanin', 'telavancin', 'vancomycin'],
    'streptogramin' => 
                    ['quinupristin/dalfopristin'],
    'sulfonamide' => 
                    ['mafenide', 'sulfadiazine', 'sulfanilamide', 'sulfisoxazole', 'trimethoprim-sulfamethoxazole'],
    'tetracycline' => 
                    ['demeclocycline', 'minocycline', 'doxycycline', 'oxytetracycline', 'tetracycline', 'tigecycline'],
    }