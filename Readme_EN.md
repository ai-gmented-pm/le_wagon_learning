# Le Wagon Learning — AI-augmented autonomous learning

> 🇫🇷 Version française : [Readme_FR.md](Readme_FR.md)

This repo shares my **AI-augmented autonomous learning backbone** for Le Wagon's **AI Software Development** bootcamp (batch 2319).

The idea: use Claude not as a solver that does the exercises for me, but as a **personal coach** that helps me understand my mistakes, then **turns each day of work into custom revision material** (recap sheets and flashcards), calibrated on my actual difficulties.

Everything is made available here: the 3 Claude skills I use, and the content they generated (recaps and flashcards), week by week.

---

## The method: 3 skills

The daily cycle:

```
Coding day                     End of day                        Revision
┌─────────────────┐    ┌──────────────────────────────┐    ┌──────────────────┐
│  wagon-coach    │ →  │  wagon-recap-of-the-day      │ →  │  recap sheet     │
│  (during the    │    │  wagon-flashcards-of-the-day │    │  + deck of 35    │
│   challenges)   │    │  (analyze the day's chat)    │    │    flashcards    │
└─────────────────┘    └──────────────────────────────┘    └──────────────────┘
```

### 1. `wagon-coach` — a coach, not a solver

Coach mode for the daily challenges (Python, bash, JS, CSS, Ruby…). Its cardinal rule: **never give the answer upfront**.

- It makes you write your **algorithm as pseudo-code first** (plain-language comments) before any line of code: logic first, syntax second.
- It guides with targeted questions, following a **5-level hint ladder**: frame the error → point to the area → name the kind of problem → targeted conceptual hint → full unlock (only on explicit request).
- It teaches you to **read error messages** (Python tracebacks bottom-up, `rake` output, JS console errors…).
- When it does show a fix, it uses an **AS IS / TO BE** format, commented line by line, followed by a comprehension-check question.

Outcome: the exercise passes, but above all you know **why** it didn't.

### 2. `wagon-recap-of-the-day` — the evening recap sheet

At the end of the day, this skill produces a **printable HTML recap sheet** (index-card style).

**Its key advantage: the sheet is custom.** It is built from an **AI analysis of the day's chat**: my questions, my hesitations, my error messages, the back-and-forth with the coach. The skill understands my difficulties and adjusts the content accordingly.

Sheet structure:
1. 🧠 **My questions & misunderstandings** (the backbone, never empty)
2. 🎯 Key concepts (the what AND the why)
3. ⚠️ Pitfalls of the day (typical error → cause → fix, AS IS / TO BE format)
4. 🔧 Patterns & idioms (code commented line by line)
5. 📖 Methods & vocabulary (table)
6. ❓ Self-test (active-recall questions with collapsed answers)

On Fridays it also produces a **weekly synthesis sheet** consolidating the 5 days and highlighting recurring difficulties: those are the weekend's revision priorities.

### 3. `wagon-flashcards-of-the-day` — the active-recall deck

Complementary to the recap (to read), this skill produces a **deck of 35 interactive flashcards** (to practice), also generated from the analysis of the day's chat.

- **Personalized mix**: ~40% core of the day's lecture, ~30% my weak points (known confusions + those spotted in the chat), ~20% mechanics from the challenge actually worked on, ~10% recall from previous days.
- Cards test **code production** ("how do you…?"), not definition recital: debugging my own mistakes from the day, output prediction, comparisons (`puts` vs `return`, `.map` vs `.each`…).
- **Spaced repetition**: cards marked "did not know" feed the next day's deck.
- **Works offline**: a single self-contained HTML file, zero dependencies, opens in any browser (including on your phone, during your commute).

---

## What's in the repo

```
le_wagon_learning/
├── skills/                          # the 3 Claude skills, ready to install
│   ├── wagon-coach/
│   ├── wagon-recap-of-the-day/      # + HTML template for the sheet
│   └── wagon-flashcards-of-the-day/ # + Python script + deck template
└── content/                         # generated content, week by week
    ├── recaps/week1/                # 5 daily sheets + the weekly one
    └── flashcards/week1/            # 5 decks of 35 cards
```

The HTML files in `content/` open directly in a browser: download them and revise, even offline.

---

## Installing the skills

The skills work with **Claude** (Claude Code, the desktop app / Cowork, or claude.ai).

**With Claude Code**: copy the folders from `skills/` into `~/.claude/skills/` (or your project's `.claude/skills/`), then invoke them in conversation ("coach mode", "recap of the day", "flashcards").

**With the Claude desktop app / Cowork**: add each skill folder via the skills settings (each folder contains a `SKILL.md`, the standard Anthropic skill format).

### Adapt before use

These skills are **personalized**: they mention my first name and my known difficulties (e.g. `puts` vs `return`, `sort` vs `sort!`). To get the most out of them:

1. Replace the first name in the `SKILL.md` files with yours.
2. Replace the list of known difficulties with your own (or empty it: the skills will rebuild it over your sessions).
3. The batch (2319) and the Ruby examples transpose easily to your own batch and current modules.

---

## Why it works

- **The coach doesn't hand out answers**: the friction is where the learning happens.
- **The revision material starts from MY blockers** of the day, not a generic course summary: every sheet and every card targets an identified gap.
- **Active recall + spaced repetition** (self-tests, flashcards, missed cards reinjected) are the two best-documented memorization techniques.
- **Offline and printable**: revision depends on no account and no connection.

---

## Intellectual property

This repo is **not open source**. The skills, the method, and the generated deliverables (recap sheets, flashcards) are the intellectual property of their author (Romain Nicod / AI-gmented.pm). © 2026, all rights reserved.

- ✅ **Personal and educational use allowed** for students: install the skills, adapt them to your own learning, revise with the content.
- ❌ **Forbidden without prior written consent**: redistribution, derivative publication, commercial use.

Le Wagon course materials (challenge briefs, lecture concepts) remain the property of Le Wagon.

Enjoy the bootcamp! 🚀

*Questions, suggestions: open an issue.*
