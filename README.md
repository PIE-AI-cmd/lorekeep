# Lorekeep

A local first Claude Code plugin that learns you, then keeps your knowledge true as it grows.

Most memory tools observe you quietly and write what they infer straight into the assistant's
context. Lorekeep does the opposite. It asks, you answer, and nothing becomes authoritative
without your explicit approval. It turns saved sources into a maintained, cross linked wiki,
and it keeps that wiki honest with an append only ledger, an index first retrieval rule, and a
governed promotion gate.

Everything stays on your machine. No server, no telemetry, no content leaves the device.

## Why it is different

- **Deliberate, not ambient.** A structured interview learns your voice, brand, clients,
  colleagues, competitors, and workflows, one question at a time, with your consent before any
  write.
- **Governed promotion.** Knowledge moves raw to wiki to canon. Promotion is a rewrite a human
  accepts, never an automatic copy.
- **Append only oplog.** Every promotion and demotion is logged with its reason, so canon is
  always answerable and always reversible.
- **Index first retrieval.** Answers read an index and open only what it points to, and cite
  the raw source rather than a derived page, so your knowledge never ends up citing itself.
- **Ripple as proposal.** When a new source contradicts your canon, the conflict is surfaced as
  a proposal for you to decide, never written across your pages unattended.

## Getting started

Install Claude Code, then clone and run Lorekeep:

```
git clone https://github.com/PIE-AI-cmd/lorekeep.git
claude --plugin-dir ./lorekeep
```

Then, in the session, say **"onboard me"**. The `onboard` skill sets you up and learns you: it
checks your experience level, scaffolds a vault, asks the few highest-leverage questions, and
gives you a quick first win, adapting as it goes. Full setup, including how to install Claude
Code on each platform, is in `skills/onboard/references/setup.md`.

New to Claude Code? On Windows PowerShell: `irm https://claude.ai/install.ps1 | iex`. On macOS,
Linux, or WSL: `curl -fsSL https://claude.ai/install.sh | bash`. Reopen the terminal, then run
`claude doctor` to confirm. You need a Claude account on a plan that includes Claude Code.

## What it installs

Five skills and two hooks:

- `onboard` : first-run setup plus a fast, adaptive interview that gets you productive quickly.
- `elicit` : the deeper interview that keeps learning you over time.
- `scaffold` : creates the vault tree (raw, wiki, oplog, quarantine, constitution).
- `promote` : the governed gate from raw to wiki to canon, writing the oplog.
- `hooks/load-vault-context.sh` : on session start, loads your index, read only, and points
  first-run users to `onboard`.
- `hooks/capture-to-raw.sh` : on session end, captures a stub to the raw tier only, never canon.

## The vault it builds

```
<vault>/
  CLAUDE.md            constitution, edited by hand only
  raw/                 immutable inputs, read never rewritten
  wiki/
    index.md           retrieval entry point, read first every session
    oplog.md           append only promotion and demotion ledger
    projects/ tools/ clients/ decisions/ people/ concepts/
  quarantine/          ripple proposals and material pending promotion
```

## The invariants

1. Local first, capture nothing silently.
2. Suggest, do not act: every change to canon is a proposal you promote.
3. Governed promotion: raw to wiki to canon, a rewrite you accept.
4. Append only oplog: every promotion and demotion is logged and reversible.
5. Index first retrieval: read the index, cite raw, not derived pages.
6. Ripple as proposal: contradictions surface as diffs, never unattended writes.

## Design

See `docs/DESIGN.md` for the governance model in full, and `examples/quickstart.md` for a
worked run from cold start to a first promotion.

## License

Apache 2.0. See `LICENSE`. Patterns are open. Your content is yours and never ships with the
plugin.
