# Release notes

## v1.3.0 — 13 juillet 2026

**Nouveau : les cheatsheets (`content/cheatsheets/`)**

- `content/cheatsheets/week1/w1_ruby_basics_cheatsheet.html` : l'essentiel Ruby de la semaine 1 sur une page — types de données, variables et interpolation, conditions (`if`/`case`), boucles, méthodes (paramètres par défaut, retour implicite), CRUD Array/Hash côte à côte, tableaux des méthodes utiles à connaître par cœur.
- Fichier HTML autonome, consultable **hors ligne**, imprimable (Cmd+P), exemples originaux rédigés pour la révision.
- Rappels intégrés des pièges vus en semaine 1 (guillemets typographiques, `puts`/`return`, ordre des branches, `sort` vs `sort!`).

## v1.2.0 — 13 juillet 2026

**Nouveau : le début de la semaine 2 (Regular Expressions, Parsing) + livecode du mercredi semaine 1**

Contenu **généraliste** pour la semaine 2 : bâti sur les cours, sans session de chat (contrairement à la semaine 1, personnalisée sur les sessions réelles).

- `content/recaps/week2/` : 2 fiches recap — jour 1 Regular Expressions (13/07), jour 2 Parsing (14/07). Questions clés, concepts, pièges, patterns commentés ligne à ligne, méthodes, auto-test.
- `content/flashcards/week2/` : 2 decks de 35 cartes (regex et parsing), dosage 40 % cœur / 31 % pièges / 20 % livecode / 9 % rappel semaine 1, hors ligne comme toujours.
- `content/livecode_with_comments/week1/20260708_acronymize.rb` : la version each + accumulateur du mercredi, commentée ligne à ligne et testée.
- `content/livecode_with_comments/week2/` : 2 implémentations de référence commentées ligne à ligne, toutes deux exécutées avec succès —
  - `20260713_url_parser.rb` : regex longue en mode étendu, groupes nommés, parsing de query string ;
  - `20260714_movies_scraper.rb` : open-uri + Nokogiri + YAML, cycle complet parsing → storing.

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
