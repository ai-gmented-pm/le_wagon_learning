---
name: wagon-recap-of-the-day
description: >
  Produit la fiche bristol HTML de fin de journée (ou de fin de
  semaine le vendredi) pour Romain, étudiant Le Wagon. La fiche
  synthétise les apprentissages clés à réviser, en plaçant en
  COLONNE VERTÉBRALE ses questions et ses incompréhensions du jour
  (ce qu'il a demandé, ce qui a coincé), puis les concepts, pièges,
  patterns et un auto-test. Déclencher dès que Romain dit « recap
  du jour », « fiche du jour », « recap of the day », « /recap »,
  « fais-moi le recap », ou clôture sa journée de code. Le vendredi,
  produire en plus la fiche de synthèse de la semaine qui consolide
  les fiches quotidiennes. Utiliser même sans mot-clé explicite dès
  que Romain signale qu'il a fini pour la journée et veut réviser.
---

# Recap of the day — fiche bristol Le Wagon

Fabrique un livrable HTML visuel et imprimable que Romain révise le
soir et le week-end. La fiche n'est pas un résumé passif : elle
part de CE QUI L'A FAIT BUTER pour ancrer la compréhension.

## Principe directeur

Les **questions et incompréhensions de Romain sont la colonne
vertébrale**. Tout part de là : ce qu'il a demandé pendant la
session, les points où il a hésité, les erreurs qu'il a rencontrées.
Le reste (concepts, méthodes) vient en support de ces points, pas
l'inverse. Si un concept n'a rien à voir avec une question ou un
blocage réel de la journée, il passe au second plan.

## Entrées à scanner

1. Le **cours du jour** collé par Romain (s'il l'a fourni).
2. La **session de chat en cours** : ses questions, ses
   incompréhensions, son code, les messages d'erreur, les allers-
   retours du mode coach.
3. Les **sticking points** connus de la mémoire projet (ex. `puts`
   vs `return`, `=` vs `==`, `sort` vs `sort!`), à réactiver s'ils
   sont revenus dans la journée.

Si le cours n'a pas été fourni, construire la fiche à partir du chat
et le signaler en tête de fiche (« cours non fourni, fiche bâtie sur
la session »).

## Deux modes

### Mode quotidien (défaut)
Une fiche par jour, sur la journée courante.

### Mode hebdo (le vendredi)
En plus de la fiche du jour, produire une fiche de synthèse de la
semaine qui :
- consolide les concepts vus lundi à vendredi ;
- met en avant les **sticking points récurrents** (ceux revenus
  plusieurs jours) : ce sont les priorités de révision du week-end ;
- propose un auto-test cumulatif couvrant toute la semaine.

## Structure de la fiche (ordre imposé)

Remplir la fiche dans cet ordre exact. La section 1 est la plus
importante et ne doit jamais être vide.

1. **🧠 Mes questions & incompréhensions** — la colonne vertébrale.
   Pour chaque point : la question ou le blocage tel qu'il s'est
   posé, puis la réponse claire. Formuler la question du point de
   vue de Romain (« pourquoi X renvoie nil ? »), pas de façon
   académique.
2. **🎯 Concepts clés** — 3 à 6 maximum. Toujours le QUOI **et** le
   POURQUOI, jamais une définition sèche.
3. **⚠️ Pièges du jour** — chaque piège en trois temps : l'erreur
   type, sa cause, le correctif. Réutiliser le format AS IS → TO BE
   quand un code concret est en jeu.
4. **🔧 Patterns & idiomes** — extraits Ruby **commentés en français
   ligne à ligne** (chaque ligne de code porte son commentaire).
   C'est un focus explicite de Romain.
5. **📖 Méthodes & vocabulaire** — tableau : méthode, ce qu'elle
   fait, sa valeur de retour.
6. **❓ Auto-test** — 3 à 5 questions de rappel actif, réponses
   repliées (`<details>`). Romain répond de mémoire avant de
   déplier. Piocher en priorité dans les points de la section 1.

Une section sans contenu réel du jour est retirée (ne pas remplir
avec du garnissage), SAUF la section 1 qui est obligatoire.

## Génération du HTML

Partir du gabarit `assets/fiche_template.html`. Il contient tout le
CSS (aspect fiche bristol, imprimable) et la structure. Remplacer
les zones balisées `<!-- ... -->` par le contenu du jour. Ne pas
réécrire le CSS : garder le gabarit, injecter le contenu.

Points de vigilance sur le contenu :
- Français grammaticalement correct, pas de calque de l'anglais.
- Code commenté ligne à ligne dans les blocs `<pre>`.
- Pas de tiret cadratin comme connecteur dans le texte des fiches ;
  articuler par deux-points, virgule ou parenthèses.

## Nommage et emplacement

Livrable récurrent, label fixe.

- Quotidien : `{YYYYMMDD} - Le Wagon - Recap du jour v{NN}.html`
- Hebdo : `{YYYYMMDD} - Le Wagon - Recap semaine v{NN}.html`

Date du jour en tête (YYYYMMDD sans tirets), séparateur ` - `,
version incrémentée à chaque update (v01 → v02), jamais d'écrasement
sans incrément.

- Historique dans `/home/claude/work/`.
- Seule la DERNIÈRE version dans `/mnt/user-data/outputs/` (nettoyer
  les versions antérieures avant de régénérer).

## Livraison

Après génération, `present_files` sur le fichier HTML et, dans le
message d'accompagnement, indiquer à Romain qu'il peut ouvrir la
fiche dans son navigateur et l'imprimer (Cmd+P) pour la réviser.

## Exemple de remplissage (section 1)

Input (extrait de session) : Romain a demandé pourquoi
`puts "coucou"` ne pouvait pas être réutilisé dans une variable.

Output (section 1 de la fiche) :
> **« Pourquoi je ne peux pas récupérer la valeur de `puts` ? »**
> `puts` a un seul job : afficher à l'écran. Une fois l'affichage
> fait, il renvoie `nil` (rien d'exploitable). Pour transmettre une
> valeur à la suite du programme, il faut `return` (ou laisser Ruby
> renvoyer la dernière expression évaluée).
