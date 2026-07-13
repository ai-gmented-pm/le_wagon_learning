# Livecode (20260707) : « spring is coming » — Programming Basics
# Objectif : compter le nombre de jours restants avant le printemps.

require "date" # on importe la librairie Date pour manipuler les dates facilement

# La méthode reçoit une date de départ ; par DÉFAUT (paramètre = valeur), c'est aujourd'hui
def days_until_spring(date = Date.today)
  # on définit l'équinoxe de printemps de l'année 2027 (le prochain à venir)
  spring = Date.new(2027, 3, 20)

  # si la date donnée est après le printemps 2027,
  # on passe au printemps de l'année suivante
  spring = spring.next_year if date > spring

  # on calcule la différence entre les deux dates : elle s'exprime en jours,
  # et on la transforme en entier avec to_i (la soustraction de dates renvoie un Rational)
  return (spring - date).to_i
end

# test avec la date du jour (aucun argument : le paramètre par défaut prend le relais)
puts days_until_spring

# test avec une date après le printemps (25 mars 2027)
# -> ça va calculer jusqu'au printemps 2028
puts days_until_spring(Date.new(2027, 3, 25))
