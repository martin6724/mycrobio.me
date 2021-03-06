# require 'json'

# html = File.read('db/bugs.html')
# require 'nokogiri'
# #condense locations to 8 systems
# dom = Nokogiri::HTML(html)
# values = {
#     'nasopharynx' => [
#         "mouth",
#         "nasopharynx",
#         "nose",
#         "oropharynx",
#         "pharynx",
#         "pharynx[citation needed]",
#         "saliva",
#         "teeth: dental plaque",
#         "throat",
#     ],
#     'respiratory' => [
#         "lung", 
#         "respiratory epithelium",
#         "sputum",
#         "upper respiratory tract",
#     ],
#     'stomach' => [
#         "stomach",
#     ],
#     'small intestine' => [
#         "gi tract",
#         "intestines",
#         "small and large intestine",
#         "small intestine",
#         "small intestine (ileon)",
#     ],
#     'large intestine' => [
#         "anus channel",
#         "cecum",
#         "gi tract (known probiotic)",
#         "large intestine",
#         "rectus",
#     ],
#     'urethra' => [
#         "anterior urethra",
#         "t",
#     ],
#     'genitalia' => [
#         "external genitalia",
#         "external genitalia,",
#         "perineum",
#     ],
#     'skin' => [
#         "general distribution",
#     ],
# }
# lookup = Hash[values.values.zip(values.keys)]
# #sanitize locations
# base_data = dom.css('tr').map do |row|
#     row.text.strip
# end
#     .select do |item|
#         item.include? "\n"
#     end
#     .map do |item|
#         item.split("\n")
#     end
#     .reject do |item|
#         item.first.include? "name" or item.first == "v"
#     end
#     .reject do |bug, location|
#         location.include?("1983")
#     end
#     .map do |bug, locations|
#         [bug.downcase, locations.split(', ').map{|item| item.downcase}]
#     end
#     .reject do |bug, locations|
#         locations.include? "feces"
#     end
#     .map do |bug, locations|
#         locations.product([bug])
#     end.flatten(1).map do |location, bug|
#         # {flora: {bug: bug, organ_system: location}}
#         lookup.map do |locations, body_spot|
#             if locations.include?(location)
#                 {
#             wiki_organ_system_name: location, 
#                     organ_system_name: body_spot, 
#                     organism_name: bug
#                 }
#             end
#         end.compact
#     end.flatten(1)

# #populate the db tables:
# base_data.each do |item|
#     organism = Organism.find_or_create_by name: item[:organism_name]
#     organ_system = OrganSystem.find_or_create_by name: item[:organ_system_name]
#     puts Flora.find_or_create_by organism: organism, organ_system: organ_system
# end
# #reject deprecated antibiotics
# exclusions = [
#   '[hide]',
#   'Others',
#   'Generic',
#   'Social',
#   'Unclassified',
#   "arsphenamine",
#   "azlocillin",
#   "carbacephem",
#   "ceftobiprole",
#   "clofazimine",
#   "flucloxacillin",
#   "furazolidone",
#   "fusidic",
#   "geldanamycin",
#   "grepafloxacin",
#   "herbimycin",
#   "lipopeptide",
#   "lomefloxacin",
#   "loracarbef",
#   "metacycline",
#   "methicillin",
#   "mezlocillin",
#   "nadifloxacin",
#   "nalidixic",
#   "pharmacology",
#   "piperacillin",
#   "platensimycin",
#   "posizolid",
#   "radezolid",
#   "roxithromycin",
#   "silver",
#   "sparfloxacin",
#   "spiramycin",
#   "sulfamethizole",
#   "sulfadimethoxine",
#   "sulfonamidochrysoidine",
#   "teicoplanin",
#   "teixobactin",
#   "temafloxacin",
#   "trimethoprim(bs)",
#   "trovafloxacin",
#   "temocillin",
#   "thiamphenicol",
#   "ticarcillin",
#   "ticarcillin/clavulanate"
# ].map{|item| item.downcase}

# html1 = File.read "db/antibiotics.html"
# dom1 = Nokogiri::HTML(html1)
# antibiotic_list = dom1.css('tr').map do |row|
#   row.text.strip.split.first
# end.compact
# .push(
#     "fidaxomicin", 
#     "clotrimazole", 
#     "fluconazole", 
#     "ketoconazole", 
#     "miconazole", 
#     "nystatin"
# ).sort
# .uniq #alphabetize and remove repeats
# .reject do |item|
#   exclusions.include?(item.downcase)
# end.sort
# .map{|item| item.downcase }
# .map{|item| item.sub(/(.*)\(bs\)$/, '\1')}
# .map{|item| item.sub('torezolid', 'tedizolid')}
# .map{|item| item.sub('sulfanilimide', 'sulfanilamide')}
# .map{|item| item.sub('rifampicin', 'rifampin')}
# .map{|item| item.sub('sulfasalazine', 'sulfadiazine')}
# .map{|item| item.sub('trimethoprim-sulfamethoxazole', 'sulfamethoxazole-trimethoprim')}
# .reject{|item| item.end_with?('s')}

# locations = values # reassign because two copies, don't want to change below

# #populate the antibiotics into table
# antibiotic_objects = antibiotic_list.map do |item|
#   Antibiotic.find_or_create_by name: item
# end

# floras = [
#   ["achromobacter spp", "large intestine"],
#   ["acidaminococcus fermentans", "large intestine"],
#   ["acinetobacter calcoaceticus", "large intestine"],
#   ["aeromonas spp", "large intestine"],
#   ["alcaligenes faecalis", "large intestine"],
#   ["bacillus spp", "large intestine"],
#   ["butyriviberio fibrosolvens", "large intestine"],
#   ["campylobacter spp", "large intestine"],
#   ["clostridium spp", "large intestine"],
#   ["clostridium difficile", "large intestine"],
#   ["clostridium sordellii", "large intestine"],
#   ["flavobacterium spp", "large intestine"],
#   ["lactobacillus spp", "large intestine"],
#   ["mycobacteria spp", "large intestine"],
#   ["mycoplasma spp", "large intestine"],
#   ["peptococcus spp", "large intestine"],
#   ["propionibacterium spp", "large intestine"],
#   ["pseudomonas aeruginosa", "large intestine"],
#   ["ruminococcus bromii", "large intestine"],
#   ["ruminococcus spp", "large intestine"],
#   ["sarcina spp", "large intestine"],
#   ["staphylococcus aureus", "large intestine"],
#   ["streptococcus viridans", "large intestine"],
#   ["veillonella spp", "large intestine"],
#   ["vibrio spp", "large intestine"],
#   ["yersinia enterocolitica", "large intestine"],
#   ["achromobacter spp", "small intestine"],
#   ["actinomyces spp", "small intestine"],
#   ["aeromonas spp", "small intestine"],
#   ["alcaligenes faecalis", "small intestine"],
#   ["bacteroides spp", "small intestine"],
#   ["clostridium spp", "small intestine"],
#   ["clostridium sordellii", "small intestine"],
#   ["enterococcus spp", "small intestine"],
#   ["eubacterium spp", "small intestine"],
#   ["flavobacterium spp", "small intestine"],
#   ["fusobacterium spp", "small intestine"],
#   ["methanobrevibacter smithii", "small intestine"],
#   ["mycobacteria spp", "small intestine"],
#   ["mycoplasma spp", "small intestine"],
#   ["peptostreptococcus spp", "small intestine"],
#   ["pseudomonas aeruginosa", "small intestine"],
#   ["staphylococcus aureus", "small intestine"],
#   ["streptococcus viridans", "small intestine"],
#   ["vibrio spp", "small intestine"],
#   ["actinomyces spp", "nasopharynx"],
#   ["actinomyces viscosus", "nasopharynx"],
#   ["actinomyces naeslundii", "nasopharynx"],
#   ["aggregatibacter actinomycetemcomitans", "nasopharynx"],
#   ["arachnia propionica", "nasopharynx"],
#   ["bacteroides spp", "nasopharynx"],
#   ["bacteroides gingivalis", "nasopharynx"],
#   ["bacteroides intermedius", "nasopharynx"],
#   ["bacteroides pneumosintes", "nasopharynx"],
#   ["buchnera aphidicola", "nasopharynx"],
#   ["campylobacter sputorum", "nasopharynx"],
#   ["campylobacter upsaliensis", "nasopharynx"],
#   ["candida albicans", "nasopharynx"],
#   ["capnocytophaga spp", "nasopharynx"],
#   ["corynebacterium spp", "nasopharynx"],
#   ["eikenella corrodens", "nasopharynx"],
#   ["enterococcus spp", "nasopharynx"],
#   ["eubacterium spp", "nasopharynx"],
#   ["fusobacterium spp", "nasopharynx"],
#   ["fusobacterium nucleatum", "nasopharynx"],
#   ["haemophilus parainfluenzae", "nasopharynx"],
#   ["haemophilus paraphrophilus", "nasopharynx"],
#   ["lactobacillus spp", "nasopharynx"],
#   ["leptotrichia buccalis", "nasopharynx"],
#   ["micrococcus spp", "nasopharynx"],
#   ["mycoplasma spp", "nasopharynx"],
#   ["neisseria spp", "nasopharynx"],
#   ["neisseria sicca", "nasopharynx"],
#   ["peptococcus spp", "nasopharynx"],
#   ["peptostreptococcus spp", "nasopharynx"],
#   ["porphyromonas gingivalis", "nasopharynx"],
#   ["rothia dentocariosa", "nasopharynx"],
#   ["staphylococcus aureus", "nasopharynx"],
#   ["staphylococcus epidermidis", "nasopharynx"],
#   ["streptococcus mutans", "nasopharynx"],
#   ["streptococcus oralis", "nasopharynx"],
#   ["streptococcus pneumoniae", "nasopharynx"],
#   ["streptococcus sobrinus", "nasopharynx"],
#   ["streptococcus viridans", "nasopharynx"],
#   ["candida glabrata", "nasopharynx"],
#   ["treponema denticola", "nasopharynx"],
#   ["treponema refringens", "nasopharynx"],
#   ["veillonella spp", "nasopharynx"],
#   ["vibrio sputorum", "nasopharynx"],
#   ["wolinella succinogenes", "nasopharynx"],
#   ["acinetobacter spp", "nasopharynx"],
#   ["cardiobacterium spp", "nasopharynx"],
#   ["citrobacter freundii", "nasopharynx"],
#   ["haemophilus spp", "nasopharynx"],
#   ["moraxella spp", "nasopharynx"],
#   ["moraxella catarrhalis", "nasopharynx"],
#   ["mycoplasma orale", "nasopharynx"],
#   ["neisseria cinerea", "nasopharynx"],
#   ["neisseria elongata", "nasopharynx"],
#   ["neisseria gonorrhoeae", "nasopharynx"],
#   ["neisseria lactamica", "nasopharynx"],
#   ["neisseria meningitidis", "nasopharynx"],
#   ["neisseria mucosa", "nasopharynx"],
#   ["selenomonas sputigena", "nasopharynx"],
#   ["streptobacillus spp", "nasopharynx"],
#   ["streptococcus constellatus", "nasopharynx"],
#   ["streptococcus intermedius", "nasopharynx"],
#   ["bacteroides fragilis", "skin"],
#   ["campylobacter coli", "skin"],
#   ["eikenella corrodens", "skin"],
#   ["enterobacter cloacae", "skin"],
#   ["enterococcus faecalis", "skin"],
#   ["enterococcus faecium", "skin"],
#   ["escherichia coli", "skin"],
#   ["plesiomonas shigelloides", "skin"],
#   ["propionibacterium acnes", "skin"],
#   ["streptococcus anginosus", "skin"],
#   ["streptococcus mitis", "skin"],
#   ["streptococcus pyogenes", "skin"],
#   ["citrobacter freundii", "respiratory"],
#   ["gordonia bacterium spp", "respiratory"],
#   ["mycobacterium chelonae", "respiratory"],
#   ["neisseria sicca", "respiratory"],
#   ["burkholderia cepacia complex", "respiratory"],
#   ["chlamydophila pneumoniae", "respiratory"],
#   ["kingella spp", "respiratory"],
#   ["kingella kingae", "respiratory"],
#   ["mycoplasma pneumoniae", "respiratory"],
#   ["peptococcus spp", "respiratory"],
#   ["pseudomonas aeruginosa", "respiratory"],
#   ["streptococcus pyogenes", "respiratory"],
#   ["clostridium sordellii", "stomach"],
#   ["acinetobacter spp", "urethra"],
#   ["candida albicans", "urethra"],
#   ["corynebacterium spp", "urethra"],
#   ["enterobacteriaceae", "urethra"],
#   ["streptococcus viridans", "urethra"],
#   ["bacteroides spp", "genitalia"],
#   ["candida albicans", "genitalia"],
#   ["corynebacterium spp", "genitalia"],
#   ["enterobacteriaceae", "genitalia"],
#   ["streptococcus viridans", "genitalia"],
#   ["staphylococcus aureus", "genitalia"],
# ].map do |bug, body|
#   [Organism.find_by(name: bug), OrganSystem.find_by(name: body)]
# end

# index = 0
# antibiotic_objects.product(floras).each do |antibiotic, pair|
#   organism, organ_system = pair
#   flora = Flora.find_by(organism: organism, organ_system: organ_system)
#   Efficacy.find_or_create_by(antibiotic: antibiotic, flora: flora)
#   puts index
#   index += 1
# end

[
  [13244, 1], #urinary
  [12542, 1],
  [5768, 1],
  [130 ,1],
  [13243 ,1],
  [12961 ,1],
  [136, 1], #bacteroides
  [6763, 1],
  [12967, 1],
  [7186, 1],
  [3661, 1]
].each do |efficacy_id,  rating|
  efficacy = Efficacy.find(efficacy_id)
  if efficacy.nil?
    raise RuntimeError.new "id #{efficacy_id} doesn't exist"
  end
  puts efficacy.update(rating: rating)
end

[
  [3938, 2], #acineto
  [6617, 2],
  [7322, 2],
  [8309, 2],
  [9155, 2],
  [5351, 2], #enterobac
  [7889, 2],
  [5774, 2],
  [6902, 2],
  [9017, 2],
  [5904, 2], #c. pneumo
  [8301, 2],
  [828, 2],
  [5906, 2],
  [12533, 2],
  [7316, 2],
  [5484, 2],
  [5345, 2],
  [12544, 2],
  [5917, 2],
  [841, 2],
  [3520, 2], #bacteroides
  [2251, 2],
  [3238, 2],
  [4084, 2]
].each do |efficacy_id,  rating|
  efficacy = Efficacy.find(efficacy_id)
  if efficacy.nil?
    raise RuntimeError.new "id #{efficacy_id} doesn't exist"
  end
  puts efficacy.update(rating: rating)
end

[
  [7886, 3], #acineto
  [5348, 3],
  [6899, 3],
  [695, 3],
  [131, 3],
  [6758, 3],
  [7181, 3],
  [11411, 3],
  [12539, 3],
  [12680, 3],
  [13244, 3],
  [4361, 3],
  [10283, 3],
  [13809, 3], #candida
  [13950, 3],
  [14232, 3],
  [8029, 3], #coryne
  [5914, 3],
  [10849, 3],
  [4222, 3],
  [12683, 3], #enterobac
  [6338, 3],
  [4364, 3],
  [6761, 3],
  [10005, 3], #strep v
  [12528, 3], #m. chelonae
  [4068, 3],
  [8157, 3],
  [5478, 3],
  [13233, 3],
  [3927, 3],
  [13235, 3], #burkhold
  [3224, 3],
  [5480, 3],
  [10133, 3],
  [3788, 3],
  [5481, 3], #chlamydophila
  [4071, 3],
  [7314, 3],
  [9995, 3],
  [10841, 3],
  [830, 3],
  [5907, 3], #m. pneu
  [4074, 3],
  [12534, 3],
  [7883, 3], #p.aerugi
  [6896, 3],
  [7319, 3],
  [974, 3],
  [4074, 3],
  [4358, 3],
  [10280, 3],
  [3935, 3],
  [10139, 3],
  [3230, 3],
  [2243, 3],
  [6755, 3],
  [128, 3],
  [12959, 3],
  [9999, 3], #s pyo
  [5910, 3],
  [1680, 3],
  [411, 3],
  [4218, 3], #enterobac
  [3236, 3],
  [134, 3],
  [980, 3],
  [2249, 3],
  [9158, 3],
  [8312, 3], 
  [3095, 3],
  [3232 ,3], #c sordellii
  [2245 ,3],
  [4219 ,3],
  [3796 ,3],
  [976 ,3],
  [3091 ,3],
  [4225 ,3], #bacteroides
  [13814 , 3], #c albicans
  [13955 , 3],
  [14237, 3],
  [13532, 3],
].each do |efficacy_id,  rating|
  efficacy = Efficacy.find(efficacy_id)
  if efficacy.nil?
    raise RuntimeError.new "id #{efficacy_id} doesn't exist"
  end
  puts efficacy.update(rating: rating)
end