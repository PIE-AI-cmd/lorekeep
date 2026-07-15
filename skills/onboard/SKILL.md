---
name: onboard
description: >-
  First-run onboarding for Lorekeep. Gets a new user set up and productive fast, then learns
  them through a short adaptive interview. Use on first use, when a user installs Lorekeep, or
  when they say "get started", "set me up", "onboard me", "how do I use this", or when no vault
  exists yet. Guides setup, detects the user's experience level, scaffolds the vault, asks the
  highest-leverage questions first, delivers a quick first win, and starts the feedback loop.
---

# Onboard: get set up, then learn the user fast

Two jobs: get the user running, and learn enough about them to be useful within a few answers.
Deliberate and local. Ask before writing. Adapt to the person in front of you.

## Principles

- Local only, capture nothing silently, consent before any write.
- Suggest, do not act. Every step is offered, the user confirms.
- Fast value first. Aim for a useful result within five answers, then deepen over time.
- Adapt to level. Guide a first timer step by step; give an expert terse prompts and speed.

## Step 0: setup, only if needed

If the user is reading this, Lorekeep is already loaded. If they are helping a teammate get
started from scratch, hand them `references/setup.md`: install Claude Code, clone the repo, run
with `--plugin-dir`. Do not run the interview until they are actually in a session.

## Step 1: welcome and read the room

One or two lines on what Lorekeep is: a local second brain that learns them and keeps their
knowledge true, and that it always asks before it writes. Then one question to set depth:

> Have you used Claude Code, or a tool like this, before?

- New to it: explain each step, keep governance cautious (ask before most writes).
- Experienced: go terse, offer to batch questions, allow more unattended once trust is set.

## Step 2: choose a vault and scaffold

Confirm a folder, then run the `scaffold` skill to build the tree. Nothing but structure is
written. If a vault already exists, do not overwrite it: offer to fill only what is missing.

## Step 3: the fast-start interview

Ask the highest-leverage questions first, one at a time, reflecting each answer back and writing
it to `raw/`. The prioritized sequence and the adaptivity rules are in
`references/fast-start.md`. Read it before you start. Stop whenever the user wants; even three
answers is useful.

## Step 4: first win

Immediately show the payoff. Using only what you just learned, do one small real thing in their
voice: draft a message, answer a question, or restate their brand rules. This proves the value
and gives the user something concrete to react to.

## Step 5: feedback and adapt

Ask how that landed. Capture the correction to `raw/` as a candidate edit. Adjust your verbosity
and the governance dial to match what you heard. This is the standing loop: always ask, always
learn.

## Step 6: handoff

Tell them what happens next: keep dropping sources and asking questions, and when something is
stable, use the `promote` skill to make it canon. Note that Lorekeep keeps learning each session
and deepens the thin areas over time.

## Scalar metric

Time to first win: the number of user answers before the first useful, in-voice output. Target
five or fewer. Fewer answers to real value scores better.

## Related

- scaffold (builds the vault tree)
- elicit (the full interview, for deeper sessions)
- promote (make learned material canon)
