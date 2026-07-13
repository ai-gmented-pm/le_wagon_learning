# Livecode (20260709) : pierre-feuille-ciseaux en boucle
# Boucle de jeu : l'ordinateur tire un coup au hasard, le joueur choisit le sien,
# on compare les deux et on affiche le résultat, jusqu'à ce que le joueur quitte.

# %w[...] : raccourci Ruby pour créer un Array de Strings, équivalent à ["Rock", "Paper", "Scissors"]
# Nom TOUT EN MAJUSCULES : convention Ruby pour une CONSTANTE (valeur qui ne doit pas changer)
MOVES = %w[Rock Paper Scissors]

# On initialise player_index à nil AVANT la boucle : la variable doit exister pour que
# la condition du `until` puisse être évaluée au premier tour (nil == 4 est faux, donc on entre dans la boucle)
player_index = nil

# `until` : boucle "jusqu'à ce que la condition soit vraie" (l'inverse de `while`)
# On rejoue tant que player_index ne vaut pas 4 ; le joueur tape 5 pour quitter,
# et 5 - 1 = 4 (voir le calcul de player_index plus bas)
until player_index == 4
  # .sample : pioche un élément AU HASARD dans l'Array -> le coup de l'ordinateur
  computer_move = MOVES.sample
  # On affiche le menu pour que le joueur choisisse son coup
  # puts : affiche la consigne à l'écran (et renvoie nil, il ne transmet aucune valeur)
  puts "Choose your move: (Type 5 to quit)"
  # .each_with_index : itère sur l'Array en donnant au bloc CHAQUE élément ET sa position (index)
  MOVES.each_with_index do |move, index|
    # index + 1 : les index Ruby commencent à 0, mais on affiche un menu qui commence à 1 (plus naturel pour l'humain)
    # #{...} : interpolation, insère la valeur d'une expression Ruby dans la String
    puts "#{index + 1} - #{move}"
  end
  # print : comme puts mais SANS retour à la ligne, le curseur reste après le ">" (effet "invite de saisie")
  print "> "
  # gets   : lit la saisie clavier (renvoie une String, avec le retour à la ligne "\n" à la fin)
  # .chomp : retire ce "\n" final
  # .to_i  : convertit la String en Integer ("1" -> 1 ; un texte non numérique donne 0)
  # - 1    : on repasse du numéro affiché (1 à 3) à l'index réel de l'Array (0 à 2)
  player_index = gets.chomp.to_i - 1
  # On récupère le coup choisi dans l'Array grâce à l'index
  # (si le joueur a tapé 5, MOVES[4] n'existe pas : player_move vaut alors nil et la boucle s'arrêtera)
  player_move = MOVES[player_index]

  # On compare les deux coups pour décider de l'issue de la manche

  # == : COMPARAISON d'égalité (à ne pas confondre avec =, qui est une AFFECTATION)
  if player_move == computer_move
    # Interpolation des deux coups dans le message : mêmes coups -> manche nulle
    puts "#{player_move} against #{computer_move}: it's a tie!"
  else
    # `case/when` : alternative au if/elsif en cascade, plus lisible quand on teste UNE variable contre plusieurs valeurs
    case player_move
    when "Rock"
      # Opérateur ternaire : condition ? valeur_si_vrai : valeur_si_faux (un if/else compact sur une ligne)
      # Pierre perd contre Feuille, gagne contre le reste (Ciseaux)
      outcome = computer_move == "Paper" ? "Defeat..." : "Victory!"
    when "Paper"
      # Feuille perd contre Ciseaux, gagne contre Pierre
      outcome = computer_move == "Scissors" ? "Defeat..." : "Victory!"
    when "Scissors"
      # Ciseaux perdent contre Pierre, gagnent contre Feuille
      outcome = computer_move == "Rock" ? "Defeat..." : "Victory!"
    end
  end

  # Affiche le résultat construit dans le case ci-dessus
  # (remarque : en cas d'égalité, outcome n'est pas réaffecté ce tour-ci,
  #  cette ligne réaffiche donc le résultat du tour précédent, ou une ligne vide au premier tour)
  puts outcome
end
# Fin de partie : le joueur a choisi de quitter
