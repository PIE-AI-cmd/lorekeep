---
name: ingest
description: >-
  Saves a source into the vault: verbatim capture into the immutable raw tier, a short summary,
  and contradiction detection against existing canon at ingest time. Any conflict is emitted as
  a ripple proposal into quarantine, never written across pages. Use whenever a user wants to
  add, save, capture, or ingest a document, article, readme, note, or finding into their vault,
  Lorekeep, wiki, knowledge base, or second brain, even if they do not say the word "ingest".
---

# Ingest: capture to raw, detect ripples at the door

Ingest is the front door of the vault. A source lands verbatim in raw, and because the new
evidence is already in hand, ingest is the cheapest moment to check what it contradicts. The
scheduled sweep in verify is the other half of decay detection; this half runs while the source
is still on the desk.

## Non-negotiable principles

1. Raw is immutable. The source is captured verbatim with a metadata header, and never
   rewritten.
2. Capture nothing silently. Confirm the source and its destination with the user before
   writing.
3. Ripple as proposal. A contradiction with canon becomes a diff into quarantine, never a write
   across pages. Ingest touches raw and quarantine only, never wiki or CLAUDE.md.
4. Distinguish measured from unmeasured. A value the source does not carry is recorded as
   unknown, never defaulted to zero or best. Silent auto-values are how canon lies later.

## Process

1. Confirm the source and its metadata: capture date, origin, type, and a staleness note when
   the material is dated.
2. Write the source verbatim to raw/ under a dated filename, metadata header on top.
3. Summarize the source for the user in a few lines.
4. Read wiki/index.md and open only the pages it points to that plausibly overlap the source.
5. Compare. Where the source contradicts a wiki page or a canon claim, write one ripple
   proposal per conflict into quarantine/ as a diff that cites the raw file, and tell the user.
6. Where the source deserves a wiki page, offer to draft a promotion proposal into quarantine
   and point the user at promote. Never promote anything from inside ingest.
7. Report: the raw path, the proposals emitted, and confirmation that wiki and canon are
   untouched.

## Desired output

One immutable raw capture, zero unattended writes, and every detected conflict standing in
quarantine as a proposal the user can promote or discard.

## Scalar metric

Ingest hygiene: the fraction of ingests that leave the source verbatim in raw with a metadata
header and make zero writes to wiki or canon, target 1.0.

## Source methodology

Ripple as proposal and ingest-time contradiction detection. See docs/DESIGN.md.

## Related

- promote (moves captured material up the tiers)
- verify (the scheduled other half of decay detection)
- scaffold (creates the tiers ingest writes into)
