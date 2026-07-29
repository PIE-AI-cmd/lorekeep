---
name: verify
description: >-
  The scheduled decay sweep over a Lorekeep vault. Checks that the index resolves, links are
  not broken, canon has oplog coverage, and claims naming external referents (model IDs, API
  versions, dependency versions, crawler user agents) still hold against the current world.
  Emits keyed findings as proposals and never fixes canon itself. Use when a user asks to
  verify, lint, audit, or health-check their vault, or on any schedule that keeps canon honest.
---

# Verify: the decay sweep

Canon rots in identifiable ways: links break, the index goes stale, promotions lose their paper
trail, and claims about the outside world quietly stop being true. Verify walks the vault
looking for each class of rot and reports findings as proposals. It never repairs canon itself.

## Non-negotiable principles

1. Read-only on canon. Verify writes findings and proposals; a human applies fixes through
   promote.
2. Fail open. A sweep that errors changes nothing and says so. A partial sweep reports what it
   did not cover rather than implying it covered everything.
3. Findings are keyed and lifecycled. A finding is keyed (path, rule) so reruns update it
   rather than duplicate it, and a finding whose condition has cleared auto-resolves.
4. Every claim carries its evidence class. A finding labels each claim Observed, Assessment,
   or Not verified. A heuristic judgment is an Assessment, never presented with the confidence
   of an observation; missing data is Not verified, never guessed.
5. Machine-checkable and positional claims part ways. A claim about paths, git state, versions,
   or URL liveness is checked automatically. A positional claim — a stance, a style rule, a
   preference — cannot be, so it carries a date stamp and a human review cadence instead.
   Sweeping them together means the checkable claims never get checked.

## The finding classes

- Structural: broken links, orphan pages unreachable from the index, index entries that do not
  resolve to a file.
- Governance: canon or wiki changes with no matching oplog entry (orphan promotions), and
  quarantine proposals applied without acceptance.
- Referent existence: claims naming external, machine-checkable things — model IDs, API
  versions, dependency versions, crawler user agents — carry a last-verified date and are
  checked against the current source of truth.
- Staleness and volatility: pages built on dated raw sources, and high-volatility claims stored
  as if static, flagged for revalidation.
- Measurement honesty: values that could mean measured-low or never-measured and do not say
  which.
- Unsatisfiable rules: a canon rule the current environment cannot follow — a path that does
  not exist, a tool that is not installed — is raised as a finding, never silently failed.
  A session that reads canon should raise these at read time too; the sweep is the backstop.

## Process

1. Read wiki/index.md first. Check every entry resolves. A stale index is itself a finding.
2. Walk the pages the index points to and record structural findings.
3. Cross-check canon and wiki changes against wiki/oplog.md for coverage.
4. Check referent-existence claims that are due. Record the check in the finding, not the page.
5. Flag staleness, volatility, and measurement-honesty findings.
6. Emit one report of keyed findings into quarantine/, each carrying type, path, rule,
   severity, evidence class (Observed, Assessment, or Not verified), detail, and a proposed
   action, auto-resolving any prior finding whose condition has cleared.
7. Offer the user the promote gate for any proposed fix. Apply nothing.

## Desired output

A single keyed findings report in quarantine, each finding carrying its class, severity, and a
proposed action, with canon untouched and previously cleared findings resolved.

## Scalar metric

Vault health: the fraction of index entries that resolve and of canon changes with oplog
coverage, target 1.0. A rerun that duplicates an open finding instead of updating it scores
against the sweep itself.

## Source methodology

The decay sweep from the four operations, with finding classes drawn from failures observed in
the wild: unmanaged referent decay, silent auto-values, and unkeyed findings. See
docs/DESIGN.md.

## Related

- ingest (contradiction detection at the door; verify is the scheduled half)
- promote (the gate every proposed fix goes through)
- scaffold (creates the index and oplog that verify audits)
