# Livecode (20260709) : « le retour du sigle » — Iterators & Blocks
# Objectif : transformer une phrase en son acronyme ("DO IT YOURSELF" -> "DIY"),
# cette fois en une seule ligne grâce à map (la veille : each + accumulateur).

# `def` définit une méthode nommée acronymize ; elle reçoit un paramètre `sentence` (une String)
def acronymize(sentence)
  # --- Trame de pseudo-code écrite AVANT le code (la logique d'abord, la syntaxe ensuite) ---
  # "DO IT YOURSELF"
  # 1. découper la phrase en un array de mots (#split)
  # words = sentence.split
  # acronym = []
  # # ["DO", "IT", "YOURSELF"]
  # # 2. itérer sur l'array de mots
  # words.each do |word|
  #   # 3. sur chaque mot je récupère la première lettre que je passe en majuscule
  #   # 4. cette lettre je pousse dans un nouvel array
  #   acronym << word[0].upcase
  # end
  # # ["D", "I", "Y"]
  # acronym.join
  # le dernier array je le join avec la méthode (#join)
  # "DIY"
  # --- Version finale : la même logique en une seule ligne, par chaînage de méthodes ---
  # sentence.split          : découpe la String en un Array de mots (par défaut, coupe sur les espaces)
  # .map { |word| ... }     : itère sur chaque mot et construit un NOUVEL Array avec le résultat du bloc
  #                           (différence avec .each, qui renvoie l'array de départ sans collecter les résultats)
  # word[0]                 : la première lettre du mot (l'index 0 d'une String renvoie son 1er caractère)
  # .upcase                 : passe cette lettre en majuscule (renvoie une nouvelle String, ne modifie pas l'originale)
  # .join                   : recolle tous les éléments de l'Array en une seule String, sans séparateur
  # string|               Array               | String
  sentence.split.map { |word| word[0].upcase }.join
              #      |          String        |
  # Pas de `return` : retour implicite, Ruby renvoie la dernière expression évaluée de la méthode
end

# Tests manuels : chaque appel exécute la méthode, et `puts` affiche sa valeur de retour dans le terminal
puts acronymize("")                       # cas limite : phrase vide -> split donne [], join donne "" (ligne vide affichée)
puts acronymize("DO IT YOURSELF")         # -> "DIY" (fonctionne aussi si la phrase est déjà en majuscules)
puts acronymize("in my humble opinion")   # -> "IMHO" (upcase force la majuscule sur chaque initiale)
puts acronymize("as far as i know")       # -> "AFAIK"
puts acronymize("for your information")   # -> "FYI"
