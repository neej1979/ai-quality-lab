# Week 0 Setup (Sat Oct 3 - Sun Oct 4)

Budget: about 90 minutes, most of it the model download.

## 1. Run the setup script (Saturday)

Open the Ollama app first, then:

```bash
cd ai-quality-lab
./setup.sh
```

What it does, in order: checks macOS + Homebrew, installs Node 20+ if missing, confirms Ollama is running and pulls `qwen3:32b` if you don't have it, installs gitleaks, initialises git and activates the secret-guard hook, creates `.env`, installs Promptfoo, runs a 3-question smoke test against your local model.

**Done when:** the last line reads `Week 0 environment complete`. Then run `npm run view` to see the results in Promptfoo's browser UI. Poke around; you'll live in it from Week 3.

If anything fails, the script tells you what and stops. Fix that one thing, re-run. It skips whatever's already done.

## 2. Prove the secret guard works (5 minutes)

Do this once so you trust it:

```bash
echo 'aws_secret_access_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"' > leak-test.txt
git add leak-test.txt
git commit -m "should be blocked"     # gitleaks should refuse
git restore --staged leak-test.txt && rm leak-test.txt
```

## 3. Publish the repo (Saturday)

1. Create a **public** GitHub repo called `ai-quality-lab`
2. Then:
   ```bash
   git add -A
   git commit -m "Week 0: environment and plan"
   git remote add origin git@github.com:<you>/ai-quality-lab.git
   git push -u origin main
   ```

## 4. API accounts and spend caps (any time before Week 3)

No keys are needed until Week 3. Set caps **before** adding keys to `.env`.

The most reliable cap is prepaid credit with auto-recharge off: you physically can't spend more than you loaded.

| Provider | Do this |
|----------|---------|
| Anthropic (console.anthropic.com) | Buy a small prepaid credit balance, leave auto-reload off, create an API key |
| OpenAI (platform.openai.com) | Buy a small prepaid credit balance, leave auto-recharge off, create a project key |
| Google (aistudio.google.com) | Create a Gemini API key. The free tier is enough for most of this plan; if you enable billing, set a Cloud budget alert. Note: Google budgets *alert*, they don't hard-stop spending |

Start with $10-20 per provider. Top up at the capstone if needed; you'll know the real cost by then from Promptfoo's token reports.

Paste keys into `.env`. Never anywhere else.

## 5. Set up the Claude Project (Sunday)

1. Create a new Claude Project: **AI Quality Lab**
2. Paste `PROJECT_INSTRUCTIONS.md` into the project's custom instructions
3. Add as project knowledge: connect the GitHub repo if the integration is available (so files stay in sync); otherwise upload `docs/AI_Quality_Learning_Plan.md`, `docs/RUBRICS.md` and `PROGRESS.md`
4. First session: say **"Week 0 review"** and paste the tail of your setup output

Week 1 kicks off Monday Oct 5 with **"Week 1 kickoff"**.
