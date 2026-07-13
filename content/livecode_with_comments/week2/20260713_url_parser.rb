# Livecode (20260713) : URL Parser — Regular Expressions
# (implémentation de référence, exemples personnels)
# Objectif : écrire parse_url(url) qui décompose une URL en un Hash de propriétés :
#   parse_url("https://forge.ai-gmented.pm/skills?level=debutant&lang=fr")
#   => { scheme: "https", subdomain: "forge", domain: "ai-gmented",
#        top_level_domain: ".pm", path: ["skills"], params: { level: "debutant", lang: "fr" } }

def parse_url(url)
  # %r{...}x : littéral de Regexp alternatif à /.../, pratique quand le motif contient des "/"
  # Le modificateur x (mode étendu) autorise les espaces et les commentaires DANS la regex
  pattern = %r{
    ^(?<scheme>[a-z]+)               # ^ ancre le début ; groupe nommé "scheme" : http ou https
    ://                              # séparateur littéral entre le scheme et l'hôte
    (?<subdomain>[\w-]+)\.           # le sous-domaine : lettres/chiffres/tirets, suivi d'un point (\. échappé, sinon . = n'importe quel caractère)
    (?<domain>[\w-]+)                # le domaine : même famille de caractères
    (?<tld>(?:\.[a-z]{2,})+)         # le TLD : un ou plusieurs blocs ".xx" (.com, .pm, .co.uk) ; (?:...) groupe SANS capture
    (?<path>(?:/[^/?]+)*)            # le chemin : zéro ou plusieurs segments "/xxx" (tout sauf / et ?)
    /?                               # tolère un éventuel / final ("http://site.com/")
    (?:\?(?<query>.*))?              # la query string optionnelle : tout ce qui suit le "?"
    $                                # $ ancre la fin : rien ne doit traîner après
  }x

  # String#match confronte l'URL au motif : renvoie un MatchData si ça matche, nil sinon
  match_data = url.match(pattern)
  # Garde-fou : URL non reconnue -> on renvoie nil plutôt que de planter sur match_data[:scheme]
  return nil if match_data.nil?

  # On accède aux groupes nommés du MatchData comme aux clés d'un Hash : match_data[:scheme]
  {
    scheme: match_data[:scheme],
    subdomain: match_data[:subdomain],
    domain: match_data[:domain],
    top_level_domain: match_data[:tld],
    # Le chemin "/skills/ruby" devient ["skills", "ruby"] :
    # split("/") produit un premier élément vide (la chaîne commence par /), reject(&:empty?) l'élimine
    path: match_data[:path].split("/").reject(&:empty?),
    # La query "level=debutant&lang=fr" devient { level: "debutant", lang: "fr" } :
    params: parse_params(match_data[:query])
  }
end

def parse_params(query)
  # Pas de query string -> Hash vide (l'opérateur to_s transforme nil en "" pour éviter un crash)
  return {} if query.to_s.empty?

  # split("&")            : découpe en paires "clé=valeur"
  # each_with_object({})  : itère en transportant un Hash accumulateur (évite la variable externe du pattern each)
  query.split("&").each_with_object({}) do |pair, params|
    key, value = pair.split("=")     # affectation multiple : "lang=fr" -> key = "lang", value = "fr"
    params[key.to_sym] = value       # to_sym : la clé String devient un Symbol (convention Ruby pour les Hash)
  end
end

# Tests manuels : p (contrairement à puts) affiche la structure complète du Hash, avec les guillemets
p parse_url("https://forge.ai-gmented.pm/skills?level=debutant&lang=fr")
p parse_url("http://www.exemple.org/")                          # cas limite : pas de path, pas de params
p parse_url("https://blog.exemple.io/articles/ruby")            # path à deux segments, pas de query
p parse_url("https://shop.exemple.co.uk/panier?promo=ete&qty=2") # TLD composé (.co.uk) + deux paramètres
p parse_url("pas une url")                                      # ne matche pas -> nil
