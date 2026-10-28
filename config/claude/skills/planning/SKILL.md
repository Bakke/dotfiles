---
name: planning
description: Investigate, verify and plan a multi-step change until the plan is solid, then hand it to the orchestrate skill. Use when the user says "plan this", "make a plan", "plan it in steps", "explore and plan", or asks for alternatives and a recommendation before any code is written.
---

# Planning

A plan is a set of claims plus a sequence of PRs. The work is making every claim
**certain** before the user sees it. Nothing is implemented in this phase: a spike
is allowed, uncommitted, and reverted before the plan is written.

## 1. Explore

Map the territory before forming an opinion. Read the entry points yourself
(config, build/CI files, the base classes everything extends). For broad sweeps
across many files, spawn `Explore` agents and keep only their conclusions. Grep for
string-literal references as well as symbols. Stale notes and old docs are
**leads**, never facts: check them against git history and the code.

Map the **reach** of the change: every place it must touch (callers, tests,
fixtures, factories, config, scripts, CI, docs, other repositories) and every
reader of what it touches that is not in this codebase (a BI tool reading a view,
a pipeline reading a report file, a developer's local cache). Then the **side
effects**: what each step could break or destroy, which data it exposes, which
behaviour it silently changes for someone who did not ask. A cache clear that
also flushes a developer's Redis, a lock-file change that triggers a different
build step, a commit marker that silences a whole pipeline: each is a line in the
plan before it is a surprise in execution.

Hunt for **roadblocks** while you map: anything that would make a later step fail
or be unverifiable. A dependency present in `vendor/` but not in the lock file, a
flag the tool silently ignores, shared state between the things you will run in
parallel, a flaky or order-sensitive test, a drifted version, stale caches, a
doc that is wrong. Each one is written down with its evidence the moment it is
found; most are small and all are cheaper to remove before the main change than
inside it.

Done when you can name every component the change touches, every outside reader
of those components, every side effect with who it lands on, and every roadblock
in the way.

## 2. Understand the mechanism

Trace *how it works*, down into vendor code when the behaviour lives there (a
framework hook, a runner, a parser). Every factual claim carries a tag:
`[Certain]` from code or a measurement seen this session, `[Likely]` strong
inference, `[Guessing]`. A `[Guessing]` claim on the critical path is a task, not a
footnote.

Done when the mechanism behind each roadblock is a sentence you could defend with
a file:line.

## 3. Verify with code

Prefer a measurement to an argument. Run the command, time it, count the rows,
reproduce the failure. A scratch spike that proves a design (a hook fires, a flag
is honoured) is cheap; a wrong assumption that reaches the executor is not.
External facts (a vendor's limits, a service's sizes) come from the primary
documentation, fetched now, not from memory. Record every number with its
conditions (hardware, worker count, date): numbers travel without context and
mislead later.

Done when each `[Likely]` on the critical path is `[Certain]` or explicitly
accepted as a risk, and every scratch edit is reverted and every scratch artefact
(databases, files) is gone.

## 4. Write the plan

One scratch file, shaped by [`plan-template.md`](plan-template.md): premise
corrections first, the inventory, roadblocks with evidence, measurements, then
the steps. Each step is one PR, smallest first, independently shippable.
**Roadblocks go first**: phase 0 is one PR per roadblock, each green on its own
and merged before the change that needed it, so the main PR's diff is only the
main change. A roadblock discovered later, during execution, is a new phase-0
step added to the plan, never scope folded into the executor's PR. Where several
ways reach a goal, list the **alternatives** with the specific downside of each
and give one **recommendation**. Close with the decisions only the user can make
and what was not checked.

## 5. Review until solid

- If an `advisor` tool is available, call it before writing the plan and again
  before declaring it done; when it conflicts with your evidence, say so to it
  and let the constraint, not the rank, decide.
- Spawn one `general-purpose` **reviser** agent, read-only, briefed with the plan
  path and the primary sources, told to *disprove* each claim and argue against
  each recommendation. Give it evidence, never conclusions. Reproduce an
  overturning finding before adopting it; a reproduced finding changes the plan,
  a plausible one is tagged and kept visible.
- Iterate until the reviser reports no remaining disagreement.

**Solid** means: every claim tagged, nothing `[Guessing]` on the critical path, the
reviser has nothing left, and every step has a verification the executor can run.

## 6. Discuss, then hand off

Bring it to the user: the uncomfortable answer first, the numbers in a table, the
decisions as a short list. Every message that presents or updates the plan ends
with two labelled lines, as a review does:

- `Not checked:` what mattered and was not verified, and why that is acceptable.
- `Uncertain:` every claim still `[Likely]` or `[Guessing]` that the plan rests on.

Nothing left on either line is written as `Not checked: nothing.` so the absence
is a statement, not an omission. Record the decisions in the plan and in memory.
Then execution is the orchestrate skill's job: call the `Skill` tool with
`orchestrate` and run the plan one executor per PR.
