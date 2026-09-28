# AI Quality Lab

A 10-week, hands-on study of how to evaluate, red-team and govern AI features, run in public by a quality engineering leader.

**Why:** Traditional test automation asserts deterministic outcomes. AI features are probabilistic. This repo is the work of building the skills and standards that replace pass/fail: eval suites, adversarial testing, bias checks and release gates.

**Capstone (Dec 2026):** a reproducible head-to-head evaluation of three frontier model APIs on a realistic task.

| Folder | What's in it |
|--------|--------------|
| `docs/` | The learning plan, grading rubrics, setup guide |
| `toy-app/` | A small RAG app built to be tested and broken |
| `evals/` | Promptfoo eval suites, one folder per exercise |
| `redteam/` | Adversarial session logs and findings |
| `bias/` | Counterfactual test sets and results |
| `artefacts/` | Leadership artefacts: failure taxonomy, eval strategy, threat checklist, bias standard, release readiness policy |
| `capstone/` | Dataset, config, raw results and the final report |
| `posts/` | Weekly write-ups |

Progress: see [PROGRESS.md](PROGRESS.md).

## Run it

macOS with Homebrew and Ollama:

```bash
./setup.sh
```
