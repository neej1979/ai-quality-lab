# Week 0 Failure Log

Five failures during setup, before Week 1 started. Three were bugs in the
provided setup, two were tool/model behavior. All five are worth keeping.

## 1. Inline prompt read as a file path
- **Symptom:** Error: There are no prompts in "Answer in one short sentence. {{question}} /no_think"
- **Root cause:** in my run, a / anywhere in the string triggered file-path handling
- **Fix:** Put the prompt in its own file and reference it with file://
- **Lesson:** Know how your tool parses input before trusting it. And my first fix (moving the / to the end) failed because I acted on a diagnosis I hadn't verified.

## 2. Model ignored /no_think
- **Symptom:** The /no_think command was ignored by the model
- **Root cause:** newer Ollama versions control thinking through an API parameter rather than the prompt switch. Promptfoo's Ollama provider passes a think setting straight through to that API, and prepends any thinking it receives as Thinking: ....
- **Fix:** Use the `think: false` option in the provider config, 
- **Lesson:** Control model behavior through config, not prose. A prompt instruction is a suggestion, a config flag is a setting.

## 3. False pass on reasoning text
- **Symptom:** Smoke test passed 3/3, but every output began with "Thinking: ..."
- **Root cause:** Qwen3's reasoning trace was prepended to the answer. The
  assertions matched words in the reasoning, never checking the answer itself.
- **Fix:** `think: false` in provider config, plus a `not-icontains "thinking:"`
  guard on every test.
- **Lesson:** A green tick means something matched, not that the right thing
  was right. Check *why* a test passed, not just that it did.

## 4. Leak test proved nothing
- **Symptom:** The commit that should have been blocked went through.
- **Root cause:** The test key was AWS's official documentation example, which gitleaks deliberately ignores. 
- **Fix:** Used a random fake token shaped like a GH PAT
- **Lesson:** A negative test that can't fail proves nothing. Before trusting a guard, prove it actually blocks something.

## 5. Guard blocked a harmless file
- **Symptom:** a harmless .env example file was blocked by the gitleaks guard.
- **Root cause:** The example .env file had an empty key followed by another line which gitleaks read as one 'secret'
- **Fix:** Reordered the .env example file so that the empty key lines are last, which removed the pattern that gitleaks saw.
- **Lesson:** Fixed without an allowlist so the guard wasn't weakened repo-wide. The fix depends on file layout, but it fails safe: a future edit could cause another false block, never a leak.

**Feedback to act on:** Replace the denylist guard with a positive assertion on answer shape (carried to Week 3).