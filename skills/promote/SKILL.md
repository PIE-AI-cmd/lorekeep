---
name: promote
description: >-
  The governed gate that moves reviewed material from raw or quarantine into the wiki, and from
  the wiki into canon (CLAUDE.md). Use whenever a user wants to make something official, promote
  a note to canon, accept a proposal, or turn a captured idea into maintained knowledge.
  Promotion is always a rewrite a human accepts, never an automatic copy, and every promotion
  writes an oplog entry so it can be reversed.
---

# Promote: the governed raw to wiki to canon gate

Nothing becomes authoritative by accident. This skill walks a human through promoting material
one step up the tiers, rewriting rather than copying, and recording the move in the oplog.

## Non-negotiable principles

1. A human accepts every promotion. The agent proposes the rewrite; the user approves it.
2. Promotion is a rewrite, never a copy. Restate the material in canon voice, do not paste.
3. Every promotion and every demotion writes one oplog entry. No entry, no promotion.
4. Contradictions do not get promoted silently. If the new material conflicts with existing
   canon, surface the conflict first and let the user resolve it.

## The tiers

```
raw / quarantine   ->   wiki   ->   canon (CLAUDE.md)
```

Material moves one step at a time. Raw is immutable input. Wiki is maintained, promoted
knowledge. Canon is the constitution and the promoted pages that govern behavior.

## Process

1. Identify the source: a raw file, a quarantine proposal, or a wiki page being raised to canon.
2. Read the target tier and check for contradictions. If the source conflicts with what is
   already there, stop and show the conflict. Do not overwrite. Let the user decide.
3. Draft the rewrite in the voice of the target tier. Show it to the user as a diff.
4. On the user's explicit approval, write the rewrite to the target tier.
5. Append one oplog entry: date, action (promote or demote), what changed, from and to tier,
   the source, the reason, and what it reverses against.
6. Report what moved and link the oplog entry.

## Reversal

To roll back, demote against the oplog entry: write a new demote entry that references the
promotion, and restore the prior state. Never edit or delete the original entry.

## Desired output

A single reviewed, rewritten promotion with a matching oplog entry. Success looks like: the
target tier reflects the change in its own voice, the oplog explains why, and the move is
reversible.

## Scalar metric

Oplog coverage: the fraction of canon changes that have a matching oplog entry, target 1.0.
Any canon claim with no oplog entry is an orphan promotion and scores against this metric.

## Source methodology

The governed promotion pipeline and the append only oplog. See docs/DESIGN.md.

## Related

- scaffold (creates the tiers and the oplog)
- elicit (fills raw, the bottom of the gate)
