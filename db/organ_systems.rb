require 'json'
organ_systems = [

"Anterior urethra",
"Anterior urethra, external genitalia,",
"External genitalia",
"General distribution",
"Large intestine",
"Large intestine, small intestine",
"Mouth",
"Mouth, Saliva, GI tract",
"Mouth, large intestine",
"Mouth, large intestine, small intestine",
"Nasopharynx",
"Nose",
"Perineum",
"Pharynx",
"Saliva, sputum",
"Sputum",
"Stomach, small intestine, large intestine, rectum, anus",
"Teeth: Dental plaque",
"Throat",
"Throat, nasopharynx",
"Upper respiratory tract",
"Vagina",

].to_json

File.write('organ_systems.json', organ_systems)
