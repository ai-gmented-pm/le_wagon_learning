# Livecode (20260714) : Films Scraper — Parsing (scraping + storing)
# (implémentation de référence, cible et exemples personnels)
# Objectif : scraper les 5 premiers films de la page Wikipédia
# « List of highest-grossing films » et stocker le résultat dans un fichier films.yml :
#   - title: "Avatar"
#     rank: 1
#     url: "https://en.wikipedia.org/wiki/Avatar_(2009_film)"
#
# Chaîne complète du jour : le web -> HTML -> objets Ruby (parsing) -> fichier YAML (storing)

# require charge une librairie AVANT de pouvoir l'utiliser :
require "open-uri"  # ajoute à URI la capacité d'OUVRIR une page web comme un fichier
require "nokogiri"  # le parseur HTML/XML : transforme du texte HTML en objets navigables
require "yaml"      # sérialisation YAML : passer d'objets Ruby à du texte structuré (et inversement)

# La page cible et le nombre de films à récupérer, en constantes (valeurs fixes du programme)
URL = "https://en.wikipedia.org/wiki/List_of_highest-grossing_films"
TOP_N = 5

# --- 1. PARSING : du HTML brut vers des objets Ruby ---

# URI.open(URL) télécharge la page ; .read renvoie tout le HTML sous forme de String
html_content = URI.open(URL).read

# Nokogiri::HTML.parse transforme cette String en un document interrogeable
# (l'équivalent de l'inspecteur du navigateur, mais pilotable en Ruby)
document = Nokogiri::HTML.parse(html_content)

# On prépare l'accumulateur : un Array de Hash, un Hash par film
films = []

# .search accepte un SÉLECTEUR CSS, comme en front :
# ici, les cellules d'en-tête (th) portant l'attribut scope="row" dans le premier tableau trié,
# c'est là que Wikipédia met le titre de chaque film (repéré via l'inspecteur du navigateur)
document.search(".wikitable.sortable tbody tr th[scope='row']").first(TOP_N).each_with_index do |cell, index|
  # Dans la cellule, le lien <a> contient le titre et l'URL de la fiche du film
  link = cell.search("a").first
  # .text : le texte visible du nœud ; .strip retire les espaces parasites autour
  title = link.text.strip
  # ["href"] : lit l'ATTRIBUT href du lien ; il est relatif ("/wiki/..."), on le préfixe du domaine
  url = "https://en.wikipedia.org#{link["href"]}"
  # On pousse un Hash par film dans l'accumulateur ; index + 1 : le rang lisible par un humain
  films << { "title" => title, "rank" => index + 1, "url" => url }
end

# --- 2. STORING : des objets Ruby vers un fichier YAML ---

# films.to_yaml : sérialise l'Array de Hash en texte YAML
# File.open en mode "wb" (write) + bloc : le fichier est refermé automatiquement à la fin du bloc
File.open("films.yml", "wb") do |file|
  file.write(films.to_yaml)
end

# Contrôle en console : relire ce qu'on vient d'écrire prouve que le cycle storing -> parsing est complet
puts "#{films.size} films écrits dans films.yml :"
# YAML.load_file : parse le fichier YAML et reconstruit les objets Ruby
YAML.load_file("films.yml").each do |film|
  puts "#{film['rank']}. #{film['title']}"
end

# NB : un scraper est FRAGILE par nature : si Wikipédia change la structure de sa page,
# le sélecteur CSS ne matchera plus et il faudra le réajuster (d'où la préférence pour une API
# JSON quand elle existe : données stables et structurées, pas de HTML à disséquer).
