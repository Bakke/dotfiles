# Plan file

`plan.md` in the feature folder, versioned in its heading (`v1`, `v2 after
review round 1`). Sections in this order; a section with nothing to say is deleted,
not left empty.

The plan is the record the user reads later (**Record** in `evidence.md`).
Sections 0 to 4 are its findings: each one carries its source or proof and its
tag. Section 6 is its decisions.

With a `design.md` in the folder, that file already holds the inventory,
measurements and mechanism. Sections 1 to 4 then hold only what the design
lacks, with a link to it. Section 5 uses the design's phases and their numbers;
"Phase 0" is only for a roadblock the design did not place, marked as an
addition for the user to approve.

## 0. Corrections to the premise

What the user assumed that the evidence contradicts, first. One bullet each, tagged.

## 1. Inventory

What the change touches: a table of resource → who uses it (inside and outside
this codebase) → whether it is safe today, with counts from grep. Side effects as
a list: what each step could break, destroy or expose, and who that lands on.
Measurements of the current state in a table (wall time, sizes, counts), each
with its conditions.

## 2. Roadblocks, with evidence

One heading per roadblock: the mechanism in a sentence, the file:line or the
reproduction, the tag. Hazards (data loss, shared state) are named as hazards.

## 3. Spike results

Only what was run: variant → result → number. All scratch edits reverted.

## 4. Why it behaves as it does

The explanation behind the numbers, tagged separately from the numbers.

## 5. Steps

Phases, each step one PR, smallest first. Phase 0 removes the roadblocks from
section 2, one PR each, before the change that needs them; the main change comes
after and depends on them by name:

- **PR n. Title.** What changes, by file. Why.
  *Alternative A:* … — the specific downside.
  *Alternative B:* … — the specific downside.
  Recommendation, with the reason.
  Verify: the exact command and the expected outcome.

Mark steps that depend on another step's merge. Mark optional steps as optional,
with the condition that would make them worth doing.

## 6. Decisions

Open: numbered, each with the recommended answer. Taken: the decision, who made
it and when, the alternative rejected and its specific downside. An answered
question moves from open to taken; it is not deleted.

## 7. Not checked

Everything that stayed `[Likely]` or `[Guessing]`, and why that is acceptable.
