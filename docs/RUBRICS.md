# Grading Rubrics

Every weekly submission gets two grades: **Hands-on** and **Leader Lens**. Scale for both:

| Grade | Meaning |
|-------|---------|
| **4** | Would survive scrutiny from a senior AI engineer or a CTO |
| **3** | Solid. Minor gaps you can name yourself |
| **2** | Did the exercise, missed the point it was teaching |
| **1** | Incomplete or wrong |

A 3 is a good week. A 4 should be rare and earned. Anything below 3 gets redone before the next checkpoint.

---

## Hands-On Standard (all weeks)

| Criterion | What a 4 looks like |
|-----------|---------------------|
| **Evidence over anecdote** | Results come from multiple runs, with pass rates, not "I tried it and it worked" |
| **Reproducible** | Committed to the repo; someone else could rerun it from the README |
| **Explained** | A short note says what you expected, what happened, and why |
| **Honest** | Failures and surprises are logged, not tidied away |

## Leader Lens Artefacts

### Wk 2: AI Failure Taxonomy
- Covers non-determinism, hallucination, context limits, prompt sensitivity, drift, plus RAG and tool-use failures
- Each type has a *detection method*, not just a description
- A PM could use it without you in the room

### Wk 4: Eval Strategy One-Pager
- Names what's measured and why it matters to users, not just what's easy to measure
- Specifies how the LLM judge is validated, with an agreement threshold
- Has pass-rate thresholds, refresh cadence and a named owner

### Wk 6: AI Threat Checklist
- 5-8 questions, each tied to an OWASP LLM risk
- Answerable at feature kickoff, before code exists
- Includes at least one question on tool permissions (excessive agency)

### Wk 7: Bias Testing Standard
- States when testing is required and when it isn't (proportionality)
- Defines what counts as a finding and who reviews it
- Doesn't overclaim: acknowledges what counterfactual testing can't catch

### Wk 8: AI Release Readiness Policy
- Every gate names the evidence required and who signs
- Covers pre-launch *and* post-launch (monitoring, drift, rollback, kill switch)
- Short enough that a team would actually follow it

---

## Checkpoints

Checkpoints are a quiz plus a portfolio review. Pass = average 3+ and you can answer the questions without notes.

**Checkpoint 1 (Wk 4), sample questions**
- Why does one passing run prove nothing?
- Your judge agrees with you 70% of the time. Ship the eval or not?
- Deterministic vs model-graded assertions: when do you use each?

**Checkpoint 2 (Wk 8), sample questions**
- Explain indirect prompt injection to a CEO in 60 seconds
- An AI feature passes evals but red-teaming found a medium-severity leak. Walk through your go/no-go
- Which NIST AI RMF function does your eval strategy sit in, and why?

**Checkpoint 3 (Wk 10), the interview simulation**
- 10-minute walkthrough of the capstone, then hostile questions: sample size, judge bias, why these models, what would change your recommendation

---

## LinkedIn Posts

Not graded, but checked before publishing:
- Leads with something you *did* or *found*, not a lesson you're teaching
- One idea per post
- Your voice: no em-dashes, no question openers, no buzzwords
- Nothing about HubSync, Winnie, or QA Brain
