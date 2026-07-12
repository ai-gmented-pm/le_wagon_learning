#!/usr/bin/env python3
"""Construit le set de flashcards HTML a partir d'un deck.json.

Usage:
    python build_flashcards.py deck.json "/chemin/sortie.html"

Format attendu de deck.json :
{
  "title":    "Flashcards — Hash & Symbols",
  "subtitle": "Le Wagon · Batch 2319 · 12 juillet 2026",
  "difficultes": ["puts vs return", "sort vs sort!"],
  "cards": [
    {
      "bloc": "coeur|faible|challenge|rappel",
      "type": "Production de code",
      "q": "Comment iterer sur un array en recuperant l'index ?",
      "a": "<p>Avec <code>each_with_index</code> :</p><pre><code>...</code></pre>"
    }
  ]
}
Les champs "q" et "a" sont du HTML (code inline via <code>, blocs via <pre><code>).
"""
import json
import sys
from pathlib import Path

BLOCS = {"coeur", "faible", "challenge", "rappel"}
ATTENDU = 35


def main() -> None:
    deck_path = Path(sys.argv[1])
    out_path = Path(sys.argv[2])
    tpl_path = Path(__file__).resolve().parent.parent / "assets" / "template.html"

    deck = json.loads(deck_path.read_text(encoding="utf-8"))
    cards = deck["cards"]

    # Controles de coherence : on echoue bruyamment plutot que de livrer un set faux.
    if len(cards) != ATTENDU:
        print(f"ATTENTION : {len(cards)} cartes au lieu de {ATTENDU}.")
    questions = [c["q"] for c in cards]
    if len(set(questions)) != len(questions):
        raise SystemExit("ERREUR : questions dupliquees dans le deck.")
    for i, c in enumerate(cards, 1):
        if c["bloc"] not in BLOCS:
            raise SystemExit(f"ERREUR carte {i} : bloc '{c['bloc']}' inconnu.")
        for champ in ("type", "q", "a"):
            if not c.get(champ):
                raise SystemExit(f"ERREUR carte {i} : champ '{champ}' vide.")

    html = tpl_path.read_text(encoding="utf-8")
    html = html.replace("__TITLE__", deck["title"])
    html = html.replace("__SUBTITLE__", deck["subtitle"])
    html = html.replace("__COUNT__", str(len(cards)))
    html = html.replace("__DECK__", json.dumps(cards, ensure_ascii=False))
    html = html.replace(
        "__DIFFS__", json.dumps(deck.get("difficultes", []), ensure_ascii=False)
    )

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(html, encoding="utf-8")

    repartition = {}
    for c in cards:
        repartition[c["bloc"]] = repartition.get(c["bloc"], 0) + 1
    print(f"OK : {out_path} ({len(cards)} cartes)")
    for bloc, n in repartition.items():
        print(f"  {bloc:10s} {n:2d} ({round(n / len(cards) * 100)}%)")


if __name__ == "__main__":
    main()
