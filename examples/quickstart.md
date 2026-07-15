# Quickstart: a worked run

A short walkthrough from cold start to your first governed promotion. Everything here is local.

## 1. Create the vault

In a Claude Code session with Lorekeep installed:

> Set up a Lorekeep vault in ./my-vault

The `scaffold` skill creates the tree: `raw/`, `wiki/` with `index.md` and `oplog.md`,
`quarantine/`, and a seeded `CLAUDE.md`. Nothing but structure is written.

## 2. Learn about you

> Learn about me and how I work

The `elicit` skill runs a short interview, one question at a time. You answer, it reflects each
answer back and writes it to `raw/`, and it asks the next. Say stop whenever you like. Example:

> Q: What do you do, and what does good work look like for you?
> A: I run a small studio. Good work is on brand, on time, and cited.
>
> Reflected: studio owner, values on brand, on time, well cited work. Written to
> raw/identity.md. Next question.

Nothing is promoted yet. It all sits in `raw/`, watched by you.

## 3. Add a source

Drop a file into `raw/` and ask to ingest it:

> I added notes.md to raw. Ingest and update the wiki.

Ingest summarizes the source, checks the wiki for related pages, and runs contradiction
detection. If the source contradicts existing canon, it writes a proposal to `quarantine/`
instead of overwriting. Otherwise it drafts wiki updates for your review.

## 4. Promote to canon

When you want something to become official:

> Promote the studio brand rules to canon

The `promote` skill drafts a rewrite in canon voice, shows you the diff, and only writes on your
approval. It then appends an entry to `wiki/oplog.md`:

```
## 0001 · 2026-01-01 · promote
- what: studio brand rules
- from to: wiki into canon (CLAUDE.md)
- source: raw/brand-notes.md
- reason: approved, stable, referenced across projects
- reverses: none
```

## 5. Ask a question

> What are my brand rules?

Query reads `wiki/index.md` first, opens only the page it points to, and cites the raw source
the page records. If the answer is not in the wiki, it says so and offers to ingest the
relevant raw file, rather than guessing.

## To reverse a promotion

> Demote the studio brand rules

Promote writes a new demote entry that references the original, and restores the prior state.
The original oplog entry is never edited. Canon is always answerable and always reversible.
