---
name: spec
description: >-
  Spec-driven work for Lorekeep. Turns a goal into a short spec, then a plan, then a task list,
  then a build, proposing at each stage and waiting for approval before the next. Use when a user
  wants to build a feature, make a change, or run a piece of work deliberately: "spec this out",
  "plan this properly", "let's build X", "turn this idea into a plan", "specify and plan before
  we start". Records significant choices as decisions. This is the spec-kit discipline inside
  Lorekeep.
---

# Spec: specify, plan, tasks, then build

Do not jump to output. Move a goal through four stages, proposing at each and waiting for the
user to accept, so nothing is built on an unconfirmed assumption. This is how Lorekeep does
deliberate work.

## Principles

- Suggest, do not act. Each stage is a proposal the user approves before the next begins.
- Spec before plan, plan before tasks, tasks before build. No skipping a stage.
- Capture the why. A choice that closes off other options becomes a decision record, not lost
  context.
- Small, reversible steps. Prefer a draft or a branch over an unattended change to canon.

## The four stages

1. **Specify.** Draft a short spec: the problem, who it is for, how it should work, and
   acceptance criteria. Write it to `raw/specs/<slug>.md`. Show it, get sign-off. A spec is the
   smallest set of statements that pin the outcome, not a padded document.
2. **Plan.** Propose an approach: the shape, the trade-offs, what it touches, what could go
   wrong. One idea at a time, clarity over density. Get sign-off.
3. **Tasks.** Break the plan into a checked list of small, orderable steps, each with a clear
   done condition. Get sign-off.
4. **Build.** Work the tasks one at a time. Show a diff before any change that touches canon or
   shared files. Anything that changes `CLAUDE.md` or promoted wiki goes through the `promote`
   gate and writes an oplog entry.

## State and adaptivity

- Meet the user where they are. A rough idea starts at Specify. A finished spec starts at Plan.
- If a stage shows the previous one was wrong, stop and revise it. Backtracking is cheaper than
  building the wrong thing.
- Keep a running decision log. When a choice is load bearing, write a decision record and link
  it from the spec.
- Match the governance dial set during onboarding: cautious users get a sign-off at every stage,
  trusted-unattended users may let the early stages run and review at Tasks.

## Desired output

A spec, a plan, a task list, and the built change, each approved in turn, with decisions
recorded. Success looks like: nothing was built that the user had not signed off, and every
non-obvious choice has a why on the record.

## Scalar metric

Rework rate: the fraction of build steps that had to be redone because the spec or plan was
wrong. Lower is better. A high rate means specify and plan are being rushed.

## Source methodology

GitHub Spec Kit (github.com/github/spec-kit) and the vault concept "Spec Kit as a business
operating system". Adapted to run through Lorekeep's proposal-first, oplog-logged gate.

## Related

- promote (the gate that build steps touching canon pass through)
- scaffold (creates raw, where specs live)
- onboard (sets the governance dial that spec respects)
