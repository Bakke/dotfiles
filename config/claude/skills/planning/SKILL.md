---
name: planning
description: Investigate, verify and plan a multi-step change until the plan is solid, then hand it to the orchestrate skill. Use when the user says "plan this", "make a plan", "plan it in steps", "explore and plan", or asks for alternatives and a recommendation before any code is written.
---

# Planning

A plan is a set of claims plus a sequence of PRs. The work is making every claim
**certain** before the user sees it. Nothing is implemented in this phase: a spike
is allowed, uncommitted, and reverted before the plan is written.

The method for sections 1, 2, 3 and 5 is [`evidence.md`](evidence.md), shared
with the `blueprint` skill. Read it before starting.

**Feature folder.** Every plan lives in a feature folder (**Folder** in
`evidence.md`). Before section 1, find out if the `blueprint` skill already
designed this change. Use an existing folder under `docs/plans/` only in one of
two cases: the user or the caller names it, or exactly one folder has
`status: approved`, no `plan.md`, and a `design.md` that is plainly about this
request. A folder that already holds a `plan.md` is in progress or finished:
ask before you touch it. In every other case (two candidates, an uncertain
match) ask the user. When no folder fits, create one for this plan. In a
folder with a `design.md`, its status decides what the folder is:

- `approved`: read `design.md` and `research.md` first, then test that the
  design still fits the code: each existing node it names must still exist,
  and `git log <commit>..HEAD` on the files it touches, with `commit` from the
  design's frontmatter, shows what changed since. Three outcomes:
  - Nothing touches the design: the approved diagrams, measurements and phases
    are settled. Sections 1 to 3 then cover only what the design leaves open,
    and what a step needs that a design does not hold (files, tests,
    verification commands).
  - Names or places changed but the flow is the same (a rename, a moved file):
    tell the user and propose a short revision, the corrected names and a
    rerun of the measurements.
  - The flow changed: tell the user that the design needs the `blueprint`
    skill again.

  In the last two cases write no plan. The user decides, and the change goes
  through the `blueprint` gate.
- `draft`: not a basis for a plan. Tell the user.
- `implemented`: history. Treat it as an old doc, a lead and not a fact.

`design.md` is not yours to change. If the plan needs a different design, stop
and tell the user; the `blueprint` gate decides.

## 1. Explore

Follow **Explore** in `evidence.md`: the territory, the reach, the side effects,
the roadblocks.

Done when you can name every component the change touches, every outside reader
of those components, every side effect with who it lands on, and every roadblock
in the way.

## 2. Understand the mechanism

Follow **Tags and mechanism** in `evidence.md`.

Done when the mechanism behind each roadblock is a sentence you could defend with
a file:line.

## 3. Verify with code

Follow **Test with code** in `evidence.md`.

Done when each `[Likely]` on the critical path is `[Certain]` or explicitly
accepted as a risk, and every scratch edit is reverted and every scratch artefact
(databases, files) is gone.

## 4. Write the plan

`plan.md` in the feature folder, shaped by
[`plan-template.md`](plan-template.md): premise
corrections first, the inventory, roadblocks with evidence, measurements, then
the steps. Each step is one PR, smallest first, independently shippable.
**Roadblocks go first**: phase 0 is one PR per roadblock, each green on its own
and merged before the change that needed it, so the main PR's diff is only the
main change. A roadblock discovered later, during execution, is a new phase-0
step added to the plan, never scope folded into the executor's PR. Where several
ways reach a goal, list the **alternatives** with the specific downside of each
and give one **recommendation**. Close with the decisions only the user can make
and what was not checked.

With a `design.md`, group the steps under the design's phases and name in
each step the numbered changes it implements. A roadblock the design did not
place in a phase still goes first, and the user must approve it as an addition
to the design.

## 5. Review until solid

Follow **Disprove** in `evidence.md`, with `plan.md` as the document.

**Solid** means: every claim tagged, nothing `[Guessing]` on the critical path, the
reviser has nothing left or the user ended the loop, and every step has a
verification the executor can run.

## 6. Discuss, then hand off

Bring it to the user: the uncomfortable answer first, the numbers in a table, the
decisions as a short list. Every message that presents or updates the plan ends
with two labelled lines, as a review does:

- `Not checked:` what mattered and was not verified, and why that is acceptable.
- `Uncertain:` every claim still `[Likely]` or `[Guessing]` that the plan rests on.

Nothing left on either line is written as `Not checked: nothing.` so the absence
is a statement, not an omission. Record the user's decisions in section 6 of
the plan, as **Record** in `evidence.md` says, and in memory.

When the user approves the plan, open the plan PR as **Folder** in
`evidence.md` says, and stop. After the user confirms that it has merged,
execution is the orchestrate skill's job: call the `Skill` tool with
`orchestrate` and run the plan one executor per PR.
