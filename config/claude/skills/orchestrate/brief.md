# Executor brief

The brief is the only context the executor has. Everything it must know is
either in the brief or reachable from a file the brief names. Write it as a peer
would: goal, what is already settled, exact scope, how to prove it, how to
report.

## Shape

1. **Where and how.** Repository path, then the instruction files the executor
   reads *first* and follows: the global one (`~/.claude/CLAUDE.md`) and the
   project one (`<repo>/CLAUDE.md`), by absolute path, in that order. A fresh
   session does not inherit yours, so say it in the brief every time. Then how
   commands run (containers, wrappers); branch naming; commit style; whether a
   PR can be created from the shell. With no PR CLI: push, then return the
   PR-creation link and a description for the user to paste.
2. **Problem and goal** in two sentences.
3. **Facts to rely on**, each one verified by you this session, with the file or
   measurement behind it. Mark the executor's starting hypotheses as hypotheses.
   Anything you are guessing stays out or is labelled.
4. **Scope, exactly**, numbered: the branch command (`git checkout master &&
   git pull --rebase && git checkout -b …` in one command, because the checkout
   is shared), each file and what changes in it, what is explicitly *not* in
   scope. Name the alternative you rejected when the executor might otherwise
   reach for it.
5. **Verification**, as the exact commands and the expected outcome for each,
   including the negative case that proves a guard still works, and the cleanup
   commands for anything the run leaves behind.
6. **Commits**: imperative messages, the attribution line *the executor's own
   harness* instructs (it differs from yours), no `[skip ci]` on a branch that
   carries code. Push with `-u`.
7. **Stop condition**: if the scope turns out wrong or a test cannot pass within
   it, stop and report rather than improvise.
8. **Report format**, addressed to you, not the user: branch, commits, diff
   summary per file, every verification result with counts and times, every
   deviation from the brief with its reason, surprises, the PR link, and a
   ready-to-paste PR description ending with the generated-with line.

## What makes briefs fail

- A fact you inferred but wrote as known. The executor builds on it.
- Scope by intent ("clean this up") instead of by file and change.
- Verification by adjective ("make sure it works") instead of by command and
  expected output.
- Instructions that only you can act on (pipeline logs, force pushes). Route
  those through the user.
