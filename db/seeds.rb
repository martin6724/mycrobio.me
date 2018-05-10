require 'json'

html = File.read('db/bugs.html')
require 'nokogiri'

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

base_data.each do |item|
    puts Organism.create name: item[:organism_name]
end

