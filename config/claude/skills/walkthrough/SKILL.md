---
name: walkthrough
description: "Walk me through a PR, commit, branch, diff or file in Simplified Technical English."
disable-model-invocation: true
argument-hint: "What should I walk through? (PR, commit, branch, diff or file)"
---

Walk the user through the change or code they name. If they named nothing, use the uncommitted working tree; if that is clean, use the current branch against the main branch.

## Steps

1. Read the whole target: the PR description and full diff, the commit, or the file. Read enough of the surrounding code to know what the changed code is called by and what it calls.

2. Write the walkthrough in this order:
   - Why the change or code exists, in two or three sentences.
   - The path through the code, from the entry point to the effect: what runs first, what it changes, what the user or system sees. Follow the dataflow.
   - For a change, a list of every changed file with what it does now.
   - Risks and what to check: where the change can break a caller, lose or expose data, or change behaviour that is not in the description. Say what to test or read to confirm each one. Say so if you found none.

3. Write in ASD-STE100 Simplified Technical English, descriptive style:
   - One idea per sentence, subject-verb-object, at most 25 words.
   - Active voice, present tense.
   - One meaning per word, and the same word for the same thing every time. Noun strings of at most three words.
   - Use the ubiquitous language from `GLOSSARY.md` when the repo has one (follow `GLOSSARY-MAP.md` to the right one if there is more than one).
   - One topic per paragraph, at most six sentences; a list for three or more parallel items.
