---
name: onboard
description: >-
  First-run onboarding for Lorekeep. Gets a new user connected and productive fast, then learns
  them through a short adaptive interview. Use on first use, when a user installs Lorekeep, or
  when they say "get started", "set me up", "onboard me", "how do I use this", "connect my
  computer", or when no vault exists yet. Guides setup, connects the computer to the live vault,
  detects the user's experience level, scaffolds the vault, asks the highest-leverage questions
  first, delivers a quick first win, and starts the feedback loop.
---

# Onboard: get connected, then learn the user fast

Three jobs: get the user connected to their real vault, get them running, and learn enough about
them to be useful within a few answers. Deliberate and local. Ask before writing. Adapt to the
person in front of you.

## Principles

- Local only, capture nothing silently, consent before any write.
- Suggest, do not act. Every step is offered, the user confirms.
- Fast value first. Aim for a useful result within five answers, then deepen over time.
- Adapt to level. Guide a first timer step by step; give an expert terse prompts and speed.

## Step 0: setup, only if needed

If the user is reading this, Lorekeep is already loaded. If they are helping a teammate start
from scratch, hand them `references/setup.md`: it covers both Claude Code (install the CLI, clone,
run with `--plugin-dir`) and Cowork (open the desktop app and connect the vault folder). Do not
run the interview until they are actually in a session.

## Step 1: welcome and read the room

One or two lines on what Lorekeep is: a local second brain that learns them and keeps their
knowledge true, and that it always asks before it writes. Then one question to set depth:

> Have you used Claude Code, Cowork, or a tool like this before?

- New to it: explain each step, keep governance cautious (ask before most writes).
- Experienced: go terse, offer to batch questions, allow more unattended once trust is set.

## Step 2: connect your computer, the bridge

Lorekeep is only useful once it can reach the live vault on the user's own machine, to read the
constitution, propose edits, and run git. Make this a guided, first-class step, never something
the user has to discover later.

Detect the current state and give one clear next action:

- **No bridge yet.** The agent cannot see the machine's files. In Cowork, connect the vault
  folder (enable computer use or folder access in settings, then select the folder). In Claude
  Code, the CLI already has file access, so this is just confirming the working folder.
- **Bridge on, no vault selected.** Point Lorekeep at the vault folder and grant read and write.
- **Vault selected, git not configured.** Offer to set up the GitHub remote so the vault is
  backed up. This is the natural moment to establish that backup.
- **Fully connected.** Continue.

Then verify before doing any work:

- Read `CLAUDE.md` and confirm the top-level folder structure.
- Check the git remote is reachable, and report any uncommitted changes before the first sync, so
  nothing is lost on a fresh clone or pull.

Second machine: if this is a laptop added to an existing setup, clone or pull the vault rather
than scaffolding a new one.

Fallback: if no bridge is available (on mobile, or the desktop app is closed), say so plainly.
Lorekeep can still discuss and draft against a cloud mirror, but it cannot write back or push
until the bridge is on. Offer to continue read only, or to wait until they can connect.

## Step 3: choose a vault and scaffold

Once connected, confirm a folder and run the `scaffold` skill to build the tree. Nothing but
structure is written. If a vault already exists, do not overwrite it: offer to fill only what is
missing.

## Step 4: the fast-start interview

Ask the highest-leverage questions first, one at a time, reflecting each answer back and writing
it to `raw/`. The prioritized sequence and the adaptivity rules are in
`references/fast-start.md`. Read it before you start. Stop whenever the user wants; even three
answers is useful.

## Step 5: first win

Immediately show the payoff. Using only what you just learned, do one small real thing in their
voice: draft a message, answer a question, or restate their brand rules. This proves the value
and gives the user something concrete to react to.

## Step 6: feedback and adapt

Ask how that landed. Capture the correction to `raw/` as a candidate edit. Adjust your verbosity
and the governance dial to match what you heard. This is the standing loop: always ask, always
learn.

## Step 7: handoff

Tell them what happens next: keep dropping sources and asking questions, use `spec` when they
want to build something deliberately, and use `promote` to make stable material canon. Note that
Lorekeep keeps learning each session and deepens the thin areas over time.

## Scalar metric

Time to first win: the number of user answers before the first useful, in-voice output, counted
only once the bridge is connected. Target five or fewer. Fewer answers to real value scores
better.

## Related

- scaffold (builds the vault tree)
- elicit (the full interview, for deeper sessions)
- spec (deliberate, spec-driven build work)
- promote (make learned material canon)
