# Release notes

## v1.1.0 — 13 juillet 2026

**Nouveau : les livecodes commentés (`content/livecode_with_comments/`)**

- Ajout du dossier `content/livecode_with_comments/week1/` : le code des livecodes de la semaine 1, **commenté en français ligne à ligne** (chaque ligne de code porte l'explication de ce qu'elle fait et pourquoi) :
  - `20260707_spring.rb` : compter les jours jusqu'au printemps. Librairie `Date`, paramètre avec valeur par défaut, `next_year` conditionnel, différence de dates convertie en entier.
  - `20260709_acronymize.rb` : transformer une phrase en acronyme. La trame de pseudo-code est conservée, et la version finale (`split` → `map` → `join`) est expliquée méthode par méthode (retour implicite, différence `map` / `each`, chaînage).
  - `20260709_rock_paper_scissors.rb` : pierre-feuille-ciseaux en boucle `until`. Explications sur `%w[]`, les constantes, `sample`, `each_with_index`, `gets.chomp.to_i`, l'opérateur ternaire et le `case/when` ; une remarque signale le comportement du message en cas d'égalité.
- Ajout d'un `.gitignore` (exclusion des fichiers système `.DS_Store`).
- Syntaxe Ruby des fichiers commentés validée (`ruby -c`).

## v1.0.0 — 13 juillet 2026

**Publication initiale du repo**

- Les 3 skills Claude : `wagon-coach`, `wagon-recap-of-the-day` (+ gabarit HTML), `wagon-flashcards-of-the-day` (+ script Python + template).
- Le contenu généré de la semaine 1 : 5 fiches recap quotidiennes + la fiche hebdo (`content/recaps/week1/`), 5 decks de 35 flashcards (`content/flashcards/week1/`).
- README bilingue (`Readme_FR.md`, `Readme_EN.md`, accueil `README.md`).
- `LICENSE.md` : repo non open source, © Romain Nicod / AI-gmented.pm, tous droits réservés, usage personnel et pédagogique autorisé pour les étudiants.
