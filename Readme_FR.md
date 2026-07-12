# Le Wagon Learning — apprentissage autonome augmenté par l'IA

> 🇬🇧 English version: [Readme_EN.md](Readme_EN.md)

Ce repo partage ma **colonne vertébrale d'apprentissage autonome AI-augmented** pour suivre le bootcamp **AI Software Development** de Le Wagon (batch 2319).

L'idée : utiliser Claude non pas comme un solveur qui fait les exercices à ma place, mais comme un **coach personnel** qui m'aide à comprendre mes erreurs, puis qui **transforme chaque journée de travail en matériel de révision sur mesure** (fiches de synthèse et flashcards), calibré sur mes difficultés réelles.

Tout est mis à disposition ici : les 3 skills Claude que j'utilise, et le contenu qu'ils ont généré (recaps et flashcards), semaine par semaine.

---

## La méthode en 3 skills

Le cycle quotidien :

```
Journée de code                Fin de journée                    Révision
┌─────────────────┐    ┌──────────────────────────────┐    ┌──────────────────┐
│  wagon-coach    │ →  │  wagon-recap-of-the-day      │ →  │  fiche bristol   │
│  (pendant les   │    │  wagon-flashcards-of-the-day │    │  + deck de 35    │
│   challenges)   │    │  (analysent le chat du jour) │    │    flashcards    │
└─────────────────┘    └──────────────────────────────┘    └──────────────────┘
```

### 1. `wagon-coach` — le coach, pas le solveur

Mode coach pour les challenges quotidiens (Python, bash, JS, CSS, Ruby…). Son principe cardinal : **ne jamais donner la réponse d'emblée**.

- Il fait d'abord écrire l'**algorithme en pseudo-code** (commentaires en français) avant toute ligne de code : on règle la logique d'abord, la syntaxe ensuite.
- Il guide par questions ciblées, avec une **échelle d'indices en 5 paliers** : cadrer l'erreur → orienter la zone → nommer la nature du problème → indice conceptuel → déblocage complet (seulement sur demande explicite).
- Il apprend à **lire les messages d'erreur** (traceback Python de bas en haut, sorties `rake`, erreurs console JS…).
- Quand il finit par montrer une correction, c'est au format **AS IS / TO BE**, commentée ligne à ligne, suivie d'une question de vérification.

Résultat : l'exercice passe, mais surtout on sait **pourquoi** il ne passait pas.

### 2. `wagon-recap-of-the-day` — la fiche bristol du soir

En fin de journée, ce skill produit une **fiche de synthèse HTML** (imprimable, format fiche bristol).

**Son gros avantage : la fiche est custom.** Elle est bâtie sur une **analyse du chat de la journée avec l'IA** : mes questions, mes hésitations, mes messages d'erreur, les allers-retours avec le coach. Le skill comprend mes difficultés et ajuste le contenu en conséquence.

Structure de la fiche :
1. 🧠 **Mes questions & incompréhensions** (la colonne vertébrale, jamais vide)
2. 🎯 Concepts clés (le quoi ET le pourquoi)
3. ⚠️ Pièges du jour (erreur type → cause → correctif, format AS IS / TO BE)
4. 🔧 Patterns & idiomes (code commenté ligne à ligne)
5. 📖 Méthodes & vocabulaire (tableau)
6. ❓ Auto-test (questions à réponses repliées, rappel actif)

Le vendredi, il produit en plus une **fiche de synthèse de la semaine** qui consolide les 5 jours et met en avant les difficultés récurrentes : ce sont les priorités de révision du week-end.

### 3. `wagon-flashcards-of-the-day` — le deck de rappel actif

Complémentaire du recap (à lire), ce skill produit un **deck de 35 flashcards interactives** (à pratiquer), lui aussi généré à partir de l'analyse du chat du jour.

- **Dosage personnalisé** : ~40 % cœur de la leçon du jour, ~30 % mes points faibles (confusions connues + celles repérées dans le chat), ~20 % mécanismes du challenge travaillé, ~10 % rappel des jours précédents.
- Les cartes testent la **production de code** (« comment fait-on pour… ? »), pas la récitation de définitions : débogage de mes propres erreurs du jour, prédiction de sortie, comparaisons (`puts` vs `return`, `.map` vs `.each`…).
- **Rappel espacé** : les cartes marquées « je ne savais pas » alimentent le deck du lendemain.
- **Accessible hors ligne** : un seul fichier HTML autonome, sans aucune dépendance, ouvrable dans n'importe quel navigateur (téléphone compris, dans les transports).

---

## Contenu du repo

```
le_wagon_learning/
├── skills/                          # les 3 skills Claude, prêts à installer
│   ├── wagon-coach/
│   ├── wagon-recap-of-the-day/      # + gabarit HTML de la fiche
│   └── wagon-flashcards-of-the-day/ # + script Python + template du deck
└── content/                         # le contenu généré, semaine par semaine
    ├── recaps/week1/                # 5 fiches quotidiennes + la fiche hebdo
    └── flashcards/week1/            # 5 decks de 35 cartes
```

Les fichiers HTML de `content/` s'ouvrent directement dans le navigateur : téléchargez-les et révisez, même hors ligne.

---

## Installer les skills chez vous

Les skills fonctionnent avec **Claude** (Claude Code, l'app desktop / Cowork, ou claude.ai).

**Avec Claude Code** : copiez les dossiers de `skills/` dans `~/.claude/skills/` (ou dans `.claude/skills/` de votre projet), puis invoquez-les dans la conversation (« mode coach », « recap du jour », « flashcards »).

**Avec l'app desktop Claude / Cowork** : ajoutez chaque dossier de skill via les réglages de skills (chaque dossier contient un `SKILL.md`, c'est le format standard des skills Anthropic).

### À adapter avant usage

Ces skills sont **personnalisés** : ils mentionnent mon prénom et mes difficultés connues (ex. `puts` vs `return`, `sort` vs `sort!`). Pour en profiter pleinement :

1. Remplacez le prénom dans les `SKILL.md` par le vôtre.
2. Remplacez la liste des difficultés connues par les vôtres (ou videz-la : les skills la reconstruiront au fil de vos sessions).
3. Le batch (2319) et les exemples Ruby sont facilement transposables à votre propre batch et aux modules du moment.

---

## Pourquoi ça marche

- **Le coach ne donne pas la réponse** : la friction est là où l'apprentissage se produit.
- **Le matériel de révision part de MES blocages** du jour, pas d'un résumé générique du cours : chaque fiche et chaque carte cible un trou identifié.
- **Le rappel actif + la répétition espacée** (auto-tests, flashcards, cartes ratées réinjectées) sont les deux techniques de mémorisation les mieux documentées.
- **Hors ligne et imprimable** : la révision ne dépend ni d'un compte, ni d'une connexion.

Bon bootcamp ! 🚀

*Questions, suggestions : ouvrez une issue.*
