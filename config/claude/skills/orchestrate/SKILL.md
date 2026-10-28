---
name: orchestrate
description: Run a multi-step plan as orchestrator - plan and review here, execute each step in its own session on the newest Opus model, review every hand-back. Use when the user says "orchestrate", "orchestrator mode", "one session per step/PR", "hand each step to Opus", or asks for a plan where every step ships as its own reviewed PR.
---

# Orchestrate

You are the **orchestrator**: you review and record; a fresh **executor** session
does each step. Two context boundaries do the work: the executor sees only its
brief, so it cannot inherit your assumptions, and you see only its hand-back, so
you review a diff instead of your own memory of writing it.

## Plan

Execution starts from a **solid** plan: every step one PR with its verification,
decisions taken by the user. If there is no such plan yet, call the `Skill` tool
with `planning` and come back here when it hands off.

## Execute, one step at a time

The checkout is shared: the executor edits the working tree the user's tools
mount, so **one executor at a time**, and you are hands-off the tree until its
hand-back arrives. Review by reading the branch (`git diff master..branch`),
never by editing it.

Per step:

1. **Brief** an executor: `Agent` with `subagent_type: general-purpose`,
   `model: "opus"` (the alias resolves to the newest available Opus; never pin a version). The brief is the executor's entire world; write it from
   [`brief.md`](brief.md). It always opens by naming the global and the
   project `CLAUDE.md` as the files to read first and follow.
2. **Review the hand-back yourself**; the hand-back is a claim, not a result.
   Read the full diff on the branch against the brief's scope, line by line for
   code, and read any docs text it wrote. Re-run the cheapest verification when
   it decides anything (a filtered test, a parse, a `psql` count). Judge every
   deviation it flags: one it reasoned about correctly is accepted, one it did
   not notice goes back with `SendMessage`. Nothing reaches the user that you
   have not read.
3. **Follow-ups on the same branch** resume the same executor with
   `SendMessage`, so it keeps its context; a new step gets a new executor.
4. **Hand over** to the user: what the branch does, what was verified and what
   was not, the PR link and a ready-to-paste description. Record the step in
   memory and the project docs.
5. **Stop.** Wait for the merge or an explicit "launch next". Pipeline results
   the executor cannot see come back through the user as logs; read them, decide,
   and resume the executor with the numbers.

## Rules that earned their place

- `[skip ci]` goes on docs-only commits, never on the head commit of a branch
  that carries code: CI evaluates the head, so it would silence the whole PR.
- Force-pushes are the user's: amend locally if asked, then hand them the push
  command to run with the `!` prefix.
- A docs correction of your own on an open branch is a normal commit; a wording
  nit is not worth one.
- Leftovers the executor cannot see from inside the brief (databases, temp
  dirs, stashes) belong in the brief's cleanup step, with the exact commands.
