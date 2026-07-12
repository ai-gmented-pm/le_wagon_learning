---
name: wagon-flashcards-of-the-day
description: "Génère le set quotidien de 35 flashcards Le Wagon (format Kitt) à partir du chat de la journée. Analyse la conversation en cours pour identifier le module/Lecture du jour, le challenge travaillé, les questions posées par Romain, ses erreurs, ses incompréhensions et ses blocages, puis calibre les cartes sur son niveau réel. Déclencher quand Romain dit « flashcards », « /flashcards », « les cartes du jour », « fais-moi les flashcards », « génère le set », ou quand il clôture sa journée de code et veut réviser en rappel actif. Ne pas confondre avec wagon-recap-of-the-day, fiche bristol à lire ; ici la sortie est un deck interactif de rappel actif."
---

# Flashcards of the day

Produit un set de **35 flashcards** au format Kitt, ancré sur la journée
qui vient de se dérouler dans le chat courant.

Le skill `wagon-recap-of-the-day` produit une fiche de synthèse à **lire**.
Celui-ci produit un deck à **pratiquer** en rappel actif. Les deux sont
complémentaires et peuvent tourner le même soir.

---

## 1. Passe 0 — analyse du chat (obligatoire, avant toute carte)

Le chat courant est la source primaire. Le relire en entier et extraire,
sans rien inventer :

1. **Le module / la Lecture du jour** (ex. « Hash & Symbols »). C'est la
   borne de couverture : ne pas sortir du scope de la Lecture.
2. **Le ou les challenges travaillés** (noms de fichiers, méthodes à
   implémenter, sorties de `rake`).
3. **Les méthodes et concepts réellement mobilisés** dans le code écrit
   ou corrigé pendant la session.
4. **Les questions posées par Romain**, verbatim. Ce sont les meilleurs
   candidats de cartes : une question posée = un trou identifié.
5. **Les erreurs commises** : messages d'erreur, tests rouges,
   corrections AS IS / TO BE, boucles où il a tourné en rond.
6. **Les points où il a explicitement dit ne pas comprendre.**

Croiser ensuite avec ses **difficultés connues** (mémoire du projet :
`puts` vs `return`, `=` vs `==`, retour implicite, `sort` vs `sort!`,
portée des variables de bloc, retour de `each` vs `map`, syntaxe des
blocs, interpolation, argument vs attribut, duck typing…).

Si le chat ne contient pas assez de matière (session courte, pas de
code), le dire et demander en 🔴 le module + le challenge du jour plutôt
que de meubler avec du contenu générique.

---

## 2. Dosage des 35 cartes

| Bloc | Cible | Contenu |
|---|---|---|
| `coeur` | ~14 (40 %) | Syntaxe et méthodes centrales de la Lecture du jour |
| `faible` | ~11 (30 %) | Ses confusions connues + celles repérées dans le chat |
| `challenge` | ~7 (20 %) | Mécanismes tirés du challenge effectivement travaillé |
| `rappel` | ~3 (10 %) | Notions des jours précédents encore fragiles |

Le dosage s'ajuste : si la session a révélé un blocage massif sur un
point, sur-pondérer `faible` en prenant sur `coeur`. Toute déviation par
rapport à la cible est annoncée dans le message d'accompagnement.

---

## 3. Écriture des cartes

**Principe** : la carte teste la capacité à **produire du code Ruby
correct et idiomatique**, pas à réciter une définition. Formuler en
« comment fait-on pour… ? » plutôt qu'en « qu'est-ce que… ? », sauf pour
le vocabulaire vraiment fondamental (avec parcimonie).

**Sept formats, à faire tourner** (champ `type` de la carte) :

1. `Production de code` — « Comment itérer en récupérant l'index ? »
2. `Choix idiomatique` — « Quelle est la meilleure façon de… ? »
3. `Différence` — « `.map` vs `.each` », « `puts` vs `return` »
4. `Prédiction de sortie` — « Que renvoie `[1,2,3].map { |n| n * 2 }` ? »
5. `Débogage` — snippet cassé (idéalement **son** erreur du jour) à corriger
6. `Vocabulaire` — « Qu'est-ce qu'un bloc ? » (rare)
7. `Traduction intention → code` — « Comment garder les nombres pairs ? »

**Exploitation des points faibles** (le cœur de la personnalisation) :
- Chaque difficulté connue ou repérée reçoit au moins une carte frontale.
- Confusion entre deux notions → carte **comparative** qui force à les
  distinguer côte à côte.
- Erreur récurrente de syntaxe → carte **Débogage** reprenant son erreur
  typique, telle qu'elle est apparue dans le chat.
- Notion vraiment bloquante → la reformuler sous **2 angles différents**.

**Qualité rédactionnelle** :
- 1 carte = 1 question = 1 idée testable. Pas de question à tiroirs.
- Réponse = solution idiomatique + une phrase de « pourquoi » si utile.
  Jamais un pavé. Code toujours en bloc.
- Auto-évaluable sans ambiguïté après le flip (« je savais » / « je ne
  savais pas »).
- Zéro duplication : 35 questions distinctes.
- Difficulté croissante dans le set : fondamentaux → nuances → pièges.
- Réponses en français, code Ruby commenté en français quand un commentaire
  est nécessaire.

---

## 4. Production

Écrire un `deck.json` puis lancer le script :

```bash
python scripts/build_flashcards.py deck.json \
  "/mnt/user-data/outputs/{YYYYMMDD} - Le Wagon Ruby - Flashcards {module} v01.html"
```

`deck.json` :

```json
{
  "title": "Flashcards — Hash & Symbols",
  "subtitle": "Le Wagon · Batch 2319 · 12 juillet 2026",
  "difficultes": [
    "Confusion <code>puts</code> / <code>return</code> (revue 2 fois aujourd'hui)",
    "Portée des variables de bloc"
  ],
  "cards": [
    {
      "bloc": "faible",
      "type": "Différence",
      "q": "Quelle différence entre <code>puts</code> et <code>return</code> ?",
      "a": "<p><code>puts</code> affiche et retourne <code>nil</code>…</p><pre><code>def f\n  puts \"hello\"   # affiche, retourne nil\nend</code></pre><div class=\"why\">Ton test échouait pour ça ce matin.</div>"
    }
  ]
}
```

Règles :
- `q` et `a` sont du **HTML** : `<code>` en inline, `<pre><code>` en bloc,
  `<p>` pour les paragraphes, `<div class="why">` pour le « pourquoi »
  ou le rappel du contexte de son erreur du jour.
- `bloc` ∈ `coeur` | `faible` | `challenge` | `rappel`. Il pilote le badge
  de couleur et la répartition affichée dans le récapitulatif.
- Le script échoue si une question est dupliquée, si un bloc est inconnu
  ou si un champ est vide. Il avertit si le compte ≠ 35.
- Le récapitulatif de fin de set (répartition réelle + difficultés
  couvertes + liste « à revoir ») est généré automatiquement par le
  template : ne pas le rédiger à la main.

**Nommage** : `{YYYYMMDD} - Le Wagon Ruby - Flashcards {module} v{NN}.html`.
Historique dans `/home/claude/work/`, seule la dernière version reste dans
`/mnt/user-data/outputs/`. Itérer la version à chaque update, ne jamais
écraser.

Le fichier produit est **autonome et hors ligne** : un seul HTML, aucune
dépendance, ouvrable dans le navigateur.

---

## 5. Rappel espacé

Après révision, le set liste les cartes marquées « Did not know » sous
forme copiable. Si Romain colle cette liste au lancement suivant, ces
cartes alimentent en priorité le bloc `rappel` du set du lendemain.

S'il ne colle rien, remplir le bloc `rappel` avec les difficultés connues
qui n'ont pas été révisées récemment.

---

## 6. Message d'accompagnement

Après `present_files`, en quelques lignes seulement :
- La répartition réelle des 35 cartes, si elle dévie de la cible, avec la
  raison (ex. « 13 cartes `faible` : les blocs `select` t'ont posé
  problème 3 fois »).
- Les difficultés personnelles couvertes par ce set.
- Rien d'autre. Pas d'éloge, pas de méta-commentaire sur la génération.
