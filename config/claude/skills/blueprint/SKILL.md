---
name: blueprint
description: 'Research and draw a large feature as diagrams and phases the user approves in Obsidian before any code plan exists. Use only when the user asks for it: "blueprint this", "draw the design", "visual plan".'
---

# Blueprint

A blueprint is the design of one feature: researched claims, diagrams tied to the
code, and the phases it ships in, in a folder the user reads in Obsidian. It ends
at the user's approval; the code plan comes after, from the `planning` skill.

## Written for a human

The user reads every line of `design.md` and `research.md` before approval. Size
follows the feature, so there is no fixed limit, but each line must be something
the user has to judge or decide. Leave out background, restated code and
anything the user can see in a diagram.

Write the text this skill produces mainly in ASD-STE100 Simplified Technical
English: both files, diagram labels, the brief to the research agent, and every
message to the user. That means short sentences, active voice, one instruction
or one fact per sentence, and the same word for the same thing each time. Names
from the code stay as they are, and a term STE does not have is acceptable where
the plain word would be less exact.

## 1. Folder

Create the feature folder as **Folder** in
`${CLAUDE_SKILL_DIR}/../planning/evidence.md` says. It holds `design.md`,
`research.md` when external facts were needed, and `plan.md` later.

`design.md` opens with:

```yaml
---
status: draft
created: YYYY-MM-DD
commit: <git rev-parse HEAD when you start>
session: ${CLAUDE_SESSION_ID}
---
```

Done when the folder exists as untracked files and nothing else in
`git status` has changed.

## 2. Research

The method is `${CLAUDE_SKILL_DIR}/../planning/evidence.md`, shared with the
`planning` skill. Read it before starting.

- **Code**: follow its **Explore** and **Tags and mechanism**.
- **Online**: a fact owned by something outside the repository (a vendor API, a
  library's behaviour, a standard, a limit) needs a primary source. As soon as
  your reading of the code shows which such facts the design needs, call the
  `Skill` tool with `research` yourself. That skill spawns the background agent;
  you do the spawn, so the agent it starts is the one that reads. Brief the
  agent with the questions and tell it to write `research.md` in the folder:
  only the facts the design uses, one source each, each read this session.
  Give it a scratch directory for downloads and tell it to empty that
  directory when it is done.
  Continue to explore while it reads.
- **Test with code**: follow its **Test with code**. Put the results in one
  table in `design.md`: what you ran, the result, the conditions.

`design.md` starts with the **Findings** list from the **Record** section of
`evidence.md`, then the measurements table. A finding proved by a measurement
points at its row.

Done when you can name every component the feature touches, the path data takes
through them today, each external fact has a source in `research.md`, every
`[Likely]` the design depends on is measured or listed as an open question, and
`git status` shows the feature folder and nothing else new.

## 3. Draw

Each diagram is a mermaid block answering one question, with a `title` and a
label on every edge that is not obvious without one:

- **As-is**: the flow today.
- **To-be**: the same nodes with the same names, plus the changes. Number each
  change (`C1`, `C2`, ...) in the label of the node or edge it applies to, and
  give those nodes one `classDef changed`. One node can carry several changes.
  What a change removes stays in the diagram with its number: a node gets a
  second `classDef removed`, an edge is drawn dashed (`-.->`), because mermaid
  cannot give an edge a class. Where a diagram type cannot dash a line, or
  dashed already means something else in that diagram, write "removed" in the
  label.
- **Sequence**: the changed flow, call by call.
- **ER or state**: only when the feature changes schema or a lifecycle.

Split a diagram when its PNG from section 5 is too wide or too dense to read
without zoom, or when the check reports that the PNG conversion failed. Labels
take `<br/>`, `<b>` and `<i>`; everything else is plain text, because
Obsidian draws mermaid with its own renderer and shows markdown marks as typed.

Name each existing node after the class, function or table it stands for, so the
user can find it by searching. A thing outside the code (a scheduler, a partner
system, an alert) gets its plain name. Unchanged nodes that you verified in the code get
that name and no other mention in the file.

Under the to-be diagram, a table with a row only for what the user has to judge:
every numbered change, and every existing element whose evidence is `[Likely]`
or `[Guessing]`. Columns: element, evidence (`file:line`, a measurement, a
`research.md` heading), tag. On a change, the tag rates the evidence that the
change is necessary.

Done when every change has a number and a row, every uncertain element has a
row, and every other node carries a name that exists in the code.

## 4. Phases

After the diagrams, one table: the order the feature ships in. A phase is an
outcome someone can observe, usable on its own, stated without files or PRs;
`planning` cuts each phase into PRs later.

| Phase | Outcome | Changes delivered | Depends on | Risk |
|---|---|---|---|---|

Order them smallest and least risky first, with whatever removes an unknown
ahead of what relies on it. Where two orders are possible, name the other and
its specific downside in one line under the table.

`design.md` closes with two lists. **Decisions**, as the **Record** section of
`evidence.md` defines them: every choice the design makes, with the rejected
alternative. Then the numbered open questions: every `[Guessing]` row, and
every decision only the user can make, each with a recommended answer.

Tests have no number: each phase includes the tests for its own changes.

Done when every numbered change belongs to exactly one phase.

## 5. Check

```
${CLAUDE_SKILL_DIR}/check <folder>/design.md <scratch-dir>
```

It renders each block with the renderer inside the installed Obsidian
(`OBSIDIAN_ASAR` overrides the path) and prints one PNG path per block. `Read`
every PNG and compare it with what the diagram should say; fix and
rerun. The PNGs are scratch artefacts: delete them before the gate.

Done when the command exits 0 on the final file and you have looked at every PNG
since the last edit to a mermaid block.

## 6. Disprove

Follow **Disprove** in the same `evidence.md`, with the folder as the document.
The reviser attacks each table row and each unlisted node's name against the
code, each external fact against its source, each diagram against the flow it
claims to show, and the phase order against its dependencies. A finding that is
plausible but not reproduced becomes an open question.

Done when **Disprove** is done and the check in section 5 has passed on the
final file.

## 7. Gate

Stop and hand the folder to the user: its path, one line per diagram, the phases,
the open questions, and what the reviser overturned. The user reads in Obsidian
and answers in chat or edits the file.

When the user returns, re-read `design.md` from disk, summarise what changed
since you last wrote it, and rerun the check if a diagram changed.

Move each question the user answers into **Decisions**, with the user and the
date, and make the changes to diagrams, tables and phases that the answer
requires. A question the user does not answer stays open; name the phases that
wait for it. Add what the reviser overturned to **Findings** if it is not
there. Then show the file's changes. The user approves the file with the
answers in it. Recording the user's words adds no claim, so it needs no new
reviser round.

List the decisions that are still "recommended, not confirmed" when you ask for
the approval. An approval covers them: mark each one with the user and the
date when you set the status.

An approval covers the content the user saw. If you change the content after
the user's last message, for any reason, show the change and wait for a new
approval. This includes a repair of a diagram that the user's edit broke: fix
the syntax, keep the user's words, show the before and after, and ask.

Set `status: approved` only when the user's most recent message approves the
file as it stands on disk. The `status` line is the one thing you write without
a new approval, because it records that decision.

This rule holds for as long as the folder exists, in every skill: after
approval, `design.md` changes only through the check in section 5 and a new
approval from the user. A revision that `planning` or `orchestrate` asks for
is this same gate: set `status: draft`, make the change, run the check, show
the change, and wait for the approval.

## 8. Hand off

Call the `Skill` tool with `planning`. Tell it the folder: it reads `design.md`
and `research.md` first, treats approved diagrams and phases as settled, writes
its plan as `plan.md` in the folder with its steps grouped under the blueprint's
phases, and names in each step the numbered changes that step implements. When
reading the folder back, the markdown and mermaid text is the source.

From here the folder has other users. `planning` writes `plan.md` and, on the
user's approval of the plan, commits the whole folder as the plan PR.
`orchestrate` gives both files to each executor. The PR that ships the last
phase of the design sets `status: implemented`; a plan that covers only some
phases leaves the status as it is.
