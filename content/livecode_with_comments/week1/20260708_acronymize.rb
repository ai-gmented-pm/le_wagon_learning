# Livecode (20260708) : « la fabrique de sigles » — Flow & Array
# Objectif : transformer une phrase en son acronyme ("Lots Of Love" -> "LOL")
# avec les outils de la journée : boucle each et array accumulateur.
# (La version map en une ligne arrive le lendemain : voir 20260709_acronymize.rb)

# `def` définit la méthode acronymize ; elle reçoit un paramètre `sentence` (une String)
def acronymize(sentence)
  # 1. Découper la phrase en un Array de mots : split coupe sur les espaces par défaut
  #    "Lots Of Love" -> ["Lots", "Of", "Love"]
  word_list = sentence.split
  # 2. Préparer un Array VIDE qui servira d'accumulateur : on va y pousser les initiales une à une
  initials = []
  # 3. Itérer sur chaque mot : each parcourt l'Array et donne chaque élément au bloc via |word|
  word_list.each do |word|
    # 4. word[0] : la première lettre du mot (index 0 d'une String)
    #    << (shovel) : pousse cette lettre à la FIN de l'Array accumulateur
    initials << word[0]
  end
  # ["L", "O", "L"]
  # 5. join : recolle les lettres en une seule String, sans séparateur
  #    upcase : force le tout en majuscules (gère les phrases écrites en minuscules)
  #    Dernière expression évaluée = valeur renvoyée par la méthode (retour implicite, pas besoin de return)
  initials.join.upcase
end

# Tests manuels façon TDD : on compare le résultat au résultat attendu avec ==,
# et puts affiche true si la méthode est correcte, false sinon
puts acronymize("Lots Of Love") == "LOL"            # cas nominal
puts acronymize("").empty?                          # cas limite : phrase vide -> acronyme vide
puts acronymize("As Soon As Possible") == "ASAP"    # plusieurs mots
puts acronymize("talk to you later") == "TTYL"      # minuscules : upcase fait le travail
