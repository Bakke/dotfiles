# Evidence

Shared by `planning` and `blueprint`: how every claim becomes **certain** before
the user sees it, and what the document keeps of it. "The document" is the plan
or the blueprint being written.

## Explore

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
document before it is a surprise in execution.

Hunt for **roadblocks** while you map: anything that would make a later step fail
or be unverifiable. A dependency present in `vendor/` but not in the lock file, a
flag the tool silently ignores, shared state between the things you will run in
parallel, a flaky or order-sensitive test, a drifted version, stale caches, a
doc that is wrong. Each one is written down with its evidence the moment it is
found; most are small and all are cheaper to remove before the main change than
inside it.

## Tags and mechanism

Trace *how it works*, down into vendor code when the behaviour lives there (a
framework hook, a runner, a parser). Every factual claim carries a tag:
`[Certain]` from code or a measurement seen this session, `[Likely]` strong
inference, `[Guessing]`. A `[Guessing]` claim on the critical path is a task, not a
footnote.

## Test with code

Prefer a measurement to an argument. Run the command, time it, count the rows,
reproduce the failure. A scratch spike that proves a design (a hook fires, a flag
is honoured) is cheap; a wrong assumption that reaches the executor is not.
External facts (a vendor's limits, a service's sizes) come from the primary
documentation, fetched now, not from memory. Record every number with its
conditions (hardware, worker count, date): numbers travel without context and
mislead later.

A spike is evidence, never the implementation.

## Folder

One folder per feature: `<repo>/docs/plans/YYYY-MM-DD-<slug>/`. It holds
`plan.md`, and `design.md` and `research.md` when the `blueprint` skill ran. The
user reads it in Obsidian. A later session on the same feature continues in the
existing folder.

The folder is committed, as the first PR of the feature.

- **Draft**: until the user approves the plan, the folder is untracked files in
  the working tree. Commit nothing from it, and keep it out of every other
  commit (stage files by name, never `git add -A`).
- **Plan PR**: when the user approves the plan, cut a branch from a freshly
  pulled main (`chore/plan-<slug>`), commit the whole folder in one commit with
  `[skip ci]` in its message, push, and open the PR the way the project does.
  It holds the folder and nothing else. Execution starts when it has merged.
- **After the merge**: a change to the folder ships in a step's PR. Leave no
  uncommitted edit in it, because a modified tracked file stops the next branch
  command.

The project's own git rules come first: where they say to leave changes
uncommitted for the user, write the folder and stop.

## Record

The document is the record the user reads later, so it keeps two lists. What you
tell the user in chat must already be in the document.

- **Findings**: every fact the document rests on and every correction to the
  user's premise, one row each: the finding, its source or proof (`file:line`,
  the command and its result, a URL read this session), its tag. A claim the
  reviser overturned stays as a row, with what replaced it. A finding with no
  source or proof is `[Guessing]` and is an open question.
- **Decisions**: every choice made, one row each: the decision, who made it and
  when (the user and the date, or "recommended, not confirmed"), the
  alternative rejected and its specific downside.

## Disprove

- If an `advisor` tool is available, call it before writing the document and
  again before declaring it done; when it conflicts with your evidence, say so to
  it and let the constraint, not the rank, decide.
- Spawn one `general-purpose` **reviser** agent, briefed with the document's
  path and the primary sources, told to *disprove* each claim and argue against
  each recommendation. It changes no file in the repository and does not edit
  the document; it can run spikes in a scratch directory of its own and
  deletes only what it created. Each document gets a new reviser: the one that
  reviewed a design does not review the plan made from it. Tell it what to
  attack, not which claims you believe.
- Reproduce an overturning finding before adopting it; a reproduced finding
  changes the document, a plausible one is tagged and kept visible.
- Send the changed document back to the same reviser, naming what you changed.
  A round counts when the reviser has answered; fixes it has not seen are not
  confirmed.
- After 3 rounds with disagreement left, apply the fixes you reproduced, mark
  them as not confirmed, then stop and ask the user whether to continue. Give
  the user the open findings and what each round changed. If the user says
  continue, resume the same reviser; the count starts again at 1.

Done when the reviser reports no remaining disagreement on the document as it
now stands, or the user ends the loop.
