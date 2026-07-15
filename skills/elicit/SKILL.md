---
name: elicit
description: >-
  Learns a user through a structured, one-question-at-a-time interview, then writes what it
  learns into a personalised local Markdown vault. Use this whenever a user wants to onboard,
  personalise their setup, "teach you about themselves", set up a knowledge base or vault, or
  have you learn their voice, tone, brand, clients, colleagues, competitors, or workflows,
  even if they do not say the word "vault". Also use when a user asks you to remember how they
  work, or wants their preferences reflected consistently across future sessions. Prefer this
  skill over ad-hoc questions any time durable personalisation is the goal.
---

# Elicit: the vault interview engine

Turn a cold start into a warm, personalised working relationship by asking, not guessing.
This skill runs a deliberate interview and scaffolds a local Markdown vault from the answers.

## Non-negotiable principles

1. **Local only.** Everything stays on the user's machine. Nothing is sent to any server. No
   telemetry.
2. **Capture nothing silently.** This skill asks and records with the user watching. It does
   not scrape, infer, or harvest.
3. **Methodology, not content.** The skill ships the pattern of a good vault. The content is
   the user's, created live, owned by them.
4. **Deliberate, not ambient.** One question at a time. The user sees each answer land.
5. **Governed promotion.** Everything the interview produces lands in `raw/` first.
   Nothing becomes canon (`CLAUDE.md`) without an explicit, separate promotion step
   (see the `promote` skill). Promotion is a rewrite, never a copy.

## When to run

Trigger on onboarding or personalisation intent (see description). If the user is mid-task and
just wants a one-off answer, do **not** hijack it into an interview. Offer the vault instead:
"I can set up a personal vault so I remember this next time. Want to do that now or later?"

## The interview

Ask **one question at a time**. Reflect the answer back in a sentence, write it to the relevant
`raw/` file, then ask the next. Adapt follow-ups to what you hear, be curious, not robotic.
Stop whenever the user wants; the vault is useful even half-built.

Cover these dimensions in roughly this order. The full question bank is in
`references/question-bank.md`, read it when you start the interview.

1. **Identity and role:** who they are, what they do, what "good" looks like for them.
2. **Voice and style:** tone of voice, formatting preferences, banned words, British or US English.
3. **Brand:** visual tokens (type, palette), naming conventions, house terms.
4. **Clients:** who they serve, per-client quirks and constraints.
5. **Colleagues:** who they work with, and how (hand-offs, approvals).
6. **Competitors:** who they measure against, and why.
7. **Workflows and tools:** how work actually moves, the stack, the rituals.
8. **Governance preferences:** how cautious to be, what needs sign-off, what may run
   unattended.

### Consent gate before writing

Before creating any file, confirm: *"I'll store this locally in your vault. Nothing leaves your
machine. Good to go?"* Honour `<private>` markers, anything wrapped in them is discussed but
never written.

## What it builds: the vault schema

Scaffold this tree under the user's chosen vault root (or run the `scaffold` skill). Write
interview answers into `raw/`; leave `wiki/` and `CLAUDE.md` for the governed promotion step.

```
vault/
├── raw/                     # raw tier: everything the interview captures lands here first
│   ├── identity.md
│   ├── voice-and-style.md
│   ├── brand.md
│   ├── clients/
│   ├── colleagues.md
│   ├── competitors.md
│   ├── workflows.md
│   └── governance.md
├── wiki/                    # promoted, reviewed knowledge (written by `promote`, not here)
│   ├── index.md             # retrieval entry point
│   └── oplog.md             # append only promotion and demotion ledger
├── quarantine/              # ripple proposals and material pending promotion
└── CLAUDE.md                # canon: manual rewrite only, never auto-written
```

## Adaptivity

On later sessions, revisit and refine: fill gaps, update stale answers, deepen thin areas.
**But always land new material in `raw/`.** This skill never edits `wiki/` or `CLAUDE.md`.
Continuous learning, yes; continuous canon-writing, never.

## Hand-off

When the user is ready to make captured material official, point them to the `promote`
skill, which walks the `raw` to `wiki` to `CLAUDE.md` gate with them. Do not promote from here.

## Guardrails

- Never infer sensitive attributes; ask, and accept "skip".
- Never write outside the chosen vault root.
- If unsure whether something is method or the user's private data, treat it as private.
- Keep the interview conversational and short-turned; this is a dialogue, not a form.

---

*Skeleton v0.1: bundled resources (`references/question-bank.md`) hold the full question set.
Companion skills: `scaffold` (vault tree creation) and `promote` (the governed raw to wiki to
canon gate).*
