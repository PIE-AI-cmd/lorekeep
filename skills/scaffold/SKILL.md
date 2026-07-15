---
name: scaffold
description: >-
  Creates the local Lorekeep vault tree: an immutable raw tier, a maintained wiki, an append
  only oplog, a quarantine for proposals, and a CLAUDE.md constitution seeded from a template.
  Use this after the elicit interview, or whenever a user wants to set up a knowledge vault,
  a second brain, or a personal wiki from scratch. Creates structure only, never content, and
  writes nothing outside the chosen vault root.
---

# Scaffold: create the vault tree

Turn a chosen folder into a governed Lorekeep vault. This skill creates directories and empty
templates only. It never invents content, and it never writes outside the vault root.

## Non-negotiable principles

1. Local only. Everything stays on the user's machine.
2. Structure, not content. Scaffold makes the tree and the empty templates. The elicit and
   ingest skills fill it, always landing in raw first.
3. Confirm the root before writing. Never scaffold outside the folder the user names.

## When to run

After elicit, or on any request to set up a vault, second brain, personal wiki, or knowledge
base. If a vault already exists at the target, do not overwrite it: report what is present and
offer to fill only the missing pieces.

## The tree

```
<vault>/
  CLAUDE.md                     # constitution, seeded from template, edited by hand only
  raw/                          # immutable inputs. Read, never rewrite.
    sessions/  meetings/  emails/  ideas/  processed/
  wiki/                         # maintained, promoted knowledge
    index.md                    # the retrieval entry point, read first every session
    oplog.md                    # append only promotion and demotion ledger
    projects/  tools/  clients/  decisions/  people/  concepts/
  quarantine/                   # ripple proposals and material pending promotion
```

## Process

1. Confirm the vault root path with the user.
2. If nothing exists there, create the tree above.
3. Seed `CLAUDE.md` from the constitution template with the four operations (ingest, query,
   promote, verify), the precedence spine, the oplog protocol, ripple as proposal, and the
   what-you-never-do list. Leave all user specific content blank.
4. Seed `wiki/index.md` with the where-to-look table and the index first rule.
5. Seed `wiki/oplog.md` with the append only header and an empty entry list.
6. Report what was created. Point the user to elicit to start filling raw.

## Desired output

A complete, empty, governed vault the user owns. Success looks like: the tree exists, the
constitution and index are seeded, the oplog is ready, and nothing but structure was written.

## Scalar metric

Scaffold completeness: the fraction of the required tree and seed files present and valid after
a run, target 1.0. A run that leaves a missing directory or an unseeded index scores below 1.0.

## Source methodology

The raw, wiki, canon vault shape and the governed promotion gate. See docs/DESIGN.md.

## Related

- elicit (fills raw through an interview)
- promote (moves raw to wiki to canon through the gate)
