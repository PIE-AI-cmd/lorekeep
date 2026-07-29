# Lorekeep design: the governance model

Lorekeep is a maintainer, not a store. Its value is that new information improves the knowledge
already inside it, and that nothing becomes authoritative without a human accepting it. This
document describes the governance primitives. They are generic and carry no user content.

## Two integrity layers over one spine

- Knowledge integrity: turn saved sources into a maintained, cross linked wiki, and keep it
  honest as it grows.
- Capability integrity: keep the system's own skills current, personalized, and correctly
  chosen, always as proposals.
- The spine: a precedence order, a promotion gate, an append only log, and a suggest then act
  interaction contract that both layers obey.

## The invariants

1. Local first, capture nothing silently. The system asks and records with the user watching.
2. Suggest, do not act. Every change to canon is a proposal the user promotes.
3. Governed promotion. Knowledge moves raw to quarantine to canon. Promotion is a rewrite, never
   a copy. A machine may draft it, only a human accepts it.
4. Append only oplog. Every promotion and demotion is logged with its reason and is reversible.
5. Index first retrieval. Answering reads the index, opens only what it points to, and cites raw
   sources, never derived pages.
6. Ripple as proposal. A contradiction surfaces as a diff into quarantine, not a write across
   pages.
7. Precedence, not tier flat. User canon outranks user skills, which outrank forks, which
   outrank stock addons.
8. Cheapest sufficient model. Classify task complexity, spend the smallest model that clears the
   bar, escalate on signal, and surface the choice.
9. Feedback by default. Ask how it did, and route corrections back into raw as candidate edits.
10. Fit any level of user. Guide a novice step by step, give a power user terse proposals, and
    learn which one is present from behavior.

## The four operations

- Ingest: save a source to raw, summarize, detect contradictions at ingest time, and emit any
  conflict as a ripple proposal into quarantine.
- Query: read the index, open only what it points to, cite the raw source, and flag a stale
  index as a lint finding.
- Promote: the one gate to canon. Rewrite, not copy. A human accepts. Write an oplog entry.
- Verify: a scheduled decay sweep for broken links, orphans, contradictions, stale markers, and
  orphan promotions with no oplog entry.

## The oplog

An append only ledger. Each entry records what changed, the tier movement, the source, the
reason, and what it reverses against. Why is this in canon always resolves to an entry. Rollback
reverses against the entry. Past entries are never edited or deleted. Corrections are new
entries.

## Ripple as proposal

When new information contradicts canon, the change is surfaced as a diff into quarantine, never
written across related pages unattended. The ripple proposes, the human disposes, through the
promote gate.

## Verify's finding classes

Decay is not one thing. Verify sweeps five classes: structural (broken links, orphans, index
entries that do not resolve), governance (canon changes with no oplog entry), referent existence
(claims naming external, machine-checkable things — model IDs, API versions, dependency
versions, crawler user agents — carry a last-verified date and are checked against the current
source of truth), staleness and volatility (a high-volatility claim stored as if static carries
a revalidation cadence), and measurement honesty (a value must distinguish measured-low from
never-measured; a silent default is how canon lies later). Findings are keyed (path, rule) so
reruns update rather than duplicate, auto-resolve when their condition clears, and travel as
proposals through the same gate as everything else.

Two boundaries matter. Machine-checkable claims (paths, git state, versions, URL liveness) are
checked automatically; positional claims (stances, style rules, preferences) cannot be, so they
carry a date stamp and a human cadence — sweeping them together means the checkable claims
never get checked. And a canon rule the current environment cannot satisfy is raised, at read
time where possible and by the sweep as backstop, never silently failed: precedence gives canon
maximum blast radius, so a stale rule outranks the agent's own eyes by design and must announce
itself when it breaks.

## Precedence

Four tiers resolve every conflict at selection time: user canon, then user skills, then forks of
third party tools, then stock addons. A stock addon's own instructions, including any it injects
at session start, never carry equal weight to user canon. Third party tools are components, never
the policy.

## The self improving loop, proposal only

- Scout: pick the best installed skill for a task, selecting by precedence.
- Discover: surface relevant new or rising skills and addons as proposals. Never auto install.
  An adopted skill is placed in the correct precedence tier, and de fanged if it asserts
  authority it should not have.
- Personalize: tune skills from feedback. Corrections land in raw and are promoted into skill
  edits through the same gate.
- Feedback: after meaningful output, ask how it did and capture the answer to raw.

## The curiosity loop

Learning is continuous, not an event. Gaps the system notices — an unexplained term at ingest,
an unmeasured value in a sweep, an entity a session touches that has no index entry, a dated
answer past its cadence — land in a question queue in quarantine. Each session spends a small
question budget, one or two, on the highest-leverage entries at a natural moment; answers are
captured to raw and rise through the same gate as everything else. Scout applies the same
discipline to the capability layer: inventory the installed skills, agents, and plugins,
snapshot to raw, diff against last time, and propose adoptions, precedence placements,
de-fangings, and retirements. The queue, the budget, and the diff keep the system evolving
without ever writing canon unattended.

## Open core

The governance primitives are the open core: elicit, the promotion gate, the oplog, index first
retrieval, ripple as proposal, precedence, and model routing. Domain depth layered on top stays
private. Ship patterns, keep payloads.
