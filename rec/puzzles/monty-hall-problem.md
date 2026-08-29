---
folder-path: rec/puzzles/
date: 2026-08-12 01:30:32 GMT (21:30:32 NYC)
---

# The Monty Hall Problem

**Category:** Math puzzle (probability, conditional probability, Bayesian reasoning)

## The Setup

Three doors. Behind one: a car. Behind the other two: goats. You pick a door — say Door 1. The host, who knows where the car is, opens one of the other doors to reveal a goat. He offers you a chance to switch. Do you?

## The Answer

**Switch. Always switch.**

Switching wins the car 2/3 of the time. Staying wins 1/3. This is not a coin flip.

## Why (The Intuitive Version)

When you first picked Door 1, you had a 1/3 chance of being right. The other two doors *collectively* had a 2/3 chance. The host opening a losing door doesn't change your 1/3 — it concentrates the full 2/3 onto the one remaining unchosen door. You're essentially choosing between your original 1/3 guess and the "other two doors" option that now has nowhere else to hide.

## The Formal Proof

The rigorous treatment uses conditional probability and [Bayes' theorem](https://en.wikipedia.org/wiki/Bayes%27_theorem). See the full write-up on Wikipedia: [Monty Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem).

The problem is mathematically equivalent to the earlier [three prisoners problem](https://en.wikipedia.org/wiki/Three_prisoners_problem) and the much older [Bertrand's box paradox](https://en.wikipedia.org/wiki/Bertrand%27s_box_paradox).

## The Vos Savant Explosion

In September 1990, [Marilyn vos Savant](https://en.wikipedia.org/wiki/Marilyn_vos_Savant) published the correct answer in her "Ask Marilyn" column in *Parade* magazine. What followed was one of the most remarkable episodes in the public history of mathematics.

Approximately **10,000 letters** poured in, the vast majority telling her she was wrong. Nearly **1,000 came from people with PhDs**, many in mathematics or statistics. [Robert Sachs](https://en.wikipedia.org/wiki/Robert_S._Sachs), a math professor at George Mason University, wrote to say she had "blew it big" and offered to help her understand. He later sent a second letter: *"After removing my foot from my mouth I'm now eating humble pie."*

The problem was informally renamed **"Marilyn and the Goats."**

Over the following two years, acceptance among general readers shifted from 8% to 56%, and among academics from 35% to 71%. [Stanford statistician Persi Diaconis](https://en.wikipedia.org/wiki/Persi_Diaconis) noted: *"Our brains are just not wired to do probability problems very well."*

## Paul Erdős Was Not Convinced

[Paul Erdős](https://en.wikipedia.org/wiki/Paul_Erd%C5%91s), one of the most prolific mathematicians in history, refused to believe the answer. When told the solution, he said: **"That's impossible."**

A colleague arranged a formal proof. Erdős grew angry. Only after watching a computer simulation produce hundreds of trials overwhelmingly favoring switching did he concede he was wrong. ([Source](https://en.wikipedia.org/wiki/Monty_Hall_problem#Savant_and_the_media_furor))

## Monty Hall Himself Weighed In

In 1991, [Monty Hall](https://en.wikipedia.org/wiki/Monty_Hall) sat down with *New York Times* reporter John Tierney at his Beverly Hills dining room and conducted live experiments. He confirmed the 2/3 answer under idealized rules — but then demonstrated what he *actually* did on the show:

> "You're sure you want Door No. 2? Before I show you what's behind that door, I will give you $3,000 in cash not to switch to it."

Hall called it the **"Henry James treatment"** — *"The Turn of the Screw."* He would use escalating cash offers and psychological pressure to manipulate contestants. The real game show was not the idealized puzzle. As he put it: *"If the host is required to open a door all the time and offer you a switch, then you should take the switch. But if he has the choice whether to allow a switch or not, beware. Caveat emptor. It all depends on his mood."*

([Tierney, "Behind Monty Hall's Doors," *The New York Times*, 1991](https://www.nytimes.com/1991/07/21/magazine/behind-monty-hall-s-doors.html); [Wikipedia](https://en.wikipedia.org/wiki/Monty_Hall_problem#Confusion_and_criticism))

## MythBusters Tested It

In Season 9, Episode 20 ("Wheel of Mythfortune," November 22, 2011), [MythBusters](https://en.wikipedia.org/wiki/MythBusters) tackled the problem head-on.

- **All 20 live volunteers** chose to stick with their original door. Not a single one switched.
- Adam Savage always switched; Jamie Hyneman never switched. Over 50 trials each, Adam dominated.
- In their definitive 100-trial mechanical simulation: Adam won **38 out of 49** by switching. Jamie won **11 out of 49** by staying.

[YouTube clip: *Should You Really Switch Doors In The Monty Hall Problem? | MythBusters*](https://www.youtube.com/watch?v=WhSjcF-qjXs)

## Sources

- [Monty Hall problem — Wikipedia](https://en.wikipedia.org/wiki/Monty_Hall_problem)
- [Three prisoners problem — Wikipedia](https://en.wikipedia.org/wiki/Three_prisoners_problem)
- [Bertrand's box paradox — Wikipedia](https://en.wikipedia.org/wiki/Bertrand%27s_box_paradox)
- [Steve Selvin — Wikipedia](https://en.wikipedia.org/wiki/Steve_Selvin)
- [Marilyn vos Savant — Wikipedia](https://en.wikipedia.org/wiki/Marilyn_vos_Savant)
- [Paul Erdős — Wikipedia](https://en.wikipedia.org/wiki/Paul_Erd%C5%91s)
- [Let's Make a Deal — Wikipedia](https://en.wikipedia.org/wiki/Let%27s_Make_a_Deal)
- [Martin Gardner — Wikipedia](https://en.wikipedia.org/wiki/Martin_Gardner)
- Selvin, Steve (1975). "A problem in probability". *The American Statistician*. 29 (1): 67.
- Tierney, John (1991). "Behind Monty Hall's Doors: Puzzle, Debate and Answer?". *The New York Times*.
- Mlodinow, Leonard (2008). *The Drunkard's Walk: How Randomness Rules Our Lives*.
- Vazsonyi, Andrew (2001). "Which Door Has the Cadillac?". *Decision Line*.
- MythBusters S9E20: "Wheel of Mythfortune" (2011). [YouTube: *Should You Really Switch Doors In The Monty Hall Problem?*](https://www.youtube.com/watch?v=WhSjcF-qjXs)
