---
name: curiosity
description: >-
  Keeps Lorekeep learning between interviews. Maintains a question queue fed by the gaps other
  skills surface — unknown people, unexplained terms, entities with no wiki page, dated answers
  due for re-confirmation — and asks a small budget of the highest-leverage questions each
  session. Use when a user wants Lorekeep to keep growing, asks "what do you want to know",
  wants their vault to adapt continuously, or when the queue holds questions worth asking.
---

# Curiosity: the question queue and the drip

Elicit learns a person in sittings; curiosity learns them continuously. Every gap the system
notices becomes a queued question, and each session spends a small question budget on the
highest-leverage entries, so the vault keeps growing without the interview ever turning into
an interrogation.

## Non-negotiable principles

1. Questions queue, they do not interrupt. A gap noticed mid-task lands in the queue and is
   asked at a natural moment, never in the middle of the user's work.
2. Budgeted. At most one or two questions per session unless the user invites more. "Not now"
   parks the entry without nagging.
3. Answers land in raw. An answer is captured like any other source and rises through the
   promote gate. Curiosity never writes canon.
4. Positional answers age. Answers about role, clients, preferences, and stances carry their
   date; when their cadence lapses, re-confirmation re-enters the queue.

## Where questions come from

- Ingest: unexplained terms, unknown people, sources that assume context the vault lacks.
- Verify: unmeasured values, unsatisfiable rules, and stale positional claims due for
  re-confirmation.
- Novelty: an entity a session touches — a tool, client, project, collaborator — that has no
  index entry becomes a wiki-page candidate question.
- Feedback: after meaningful output, one light "how did this land", captured to raw as a
  candidate correction.
- The user: anything they say they want to be asked about later.

## Process

1. Maintain quarantine/questions.md: one entry per question with its source, why it matters,
   a leverage estimate, and its date.
2. At a natural moment each session, ask up to the budget from the top of the queue.
3. Capture each answer to raw with its question attached, and mark the entry answered.
4. When an answer contradicts canon, emit a ripple proposal. When it deserves a page, offer
   promote.
5. Requeue dated positional answers when their cadence lapses.
6. Prune. A question declined twice is parked, and only the user revives it.

## Desired output

A live queue the user trusts, a steady drip of answered questions landing in raw, and coverage
rising: more of what the user's sessions touch resolves to something the vault knows.

## Scalar metric

Coverage: the fraction of entities mentioned in recent sessions that resolve to an index
entry, trending toward 1.0. A queue that only ever grows scores against the drip.

## Source methodology

Feedback by default and fit any level of user, run continuously. See docs/DESIGN.md.

## Related

- elicit (the sit-down interview curiosity extends)
- ingest and verify (feed the queue)
- promote (the gate every answer still passes)
