# Start Here — Publishing Your Repos

Five complete, ready-to-publish repositories are in this folder. This guide gets them onto GitHub.

## What's here

| Folder | What it is | Why it's on your profile |
|---|---|---|
| `fitlix-storefront` | Full Shopify theme for Fitlix | Your flagship project — real, working product code |
| `shopify-liquid-snippets` | 7 documented, reusable Liquid snippets | Shows you can write code others can reuse |
| `css-component-library` | Token-driven CSS library + live demo page | Visual, immediately understandable to any visitor |
| `js-utils` | JS utilities with tests and CI | Tests + CI are the strongest technical signal here |
| `ai-prompt-library` | Prompt engineering with documented reasoning | Shows judgment, not just output |

Every repo includes: original code, a real README, an MIT license, a roadmap, and contributing notes.

---

## Step 1 — Initialize the repos locally

Open PowerShell in this folder (`F:\games\FITLIX\github`) and run:

```powershell
.\init-repos.ps1
```

If PowerShell blocks the script, allow it for this session first:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

This creates a git repo and first commit in each folder. It does not touch GitHub yet.

## Step 2 — Create the repos on GitHub

For each of the five names below, go to [github.com/new](https://github.com/new) and create it:

- `fitlix-storefront`
- `shopify-liquid-snippets`
- `css-component-library`
- `js-utils`
- `ai-prompt-library`

For each one:
- Visibility: **Public**
- **Do not** check "Add a README file"
- **Do not** add a .gitignore or license (each repo already has them)

## Step 3 — Push

```powershell
.\push-repos.ps1 -Username YOUR-GITHUB-USERNAME
```

You may be prompted to sign in to GitHub the first time. If you use a personal access token instead of a password, use the token as the password.

## Step 4 — Polish each repo on GitHub

This part matters more than people expect. For each repo:

1. **Add a description** (the field at the top right of the repo page). One clear sentence.
2. **Add topics/tags** — click the gear next to "About". Suggested:
   - `fitlix-storefront`: `shopify`, `shopify-theme`, `liquid`, `ecommerce`
   - `shopify-liquid-snippets`: `shopify`, `liquid`, `snippets`
   - `css-component-library`: `css`, `design-system`, `components`, `no-dependencies`
   - `js-utils`: `javascript`, `utilities`, `esm`, `zero-dependency`
   - `ai-prompt-library`: `prompt-engineering`, `ai`, `llm`, `prompts`
3. **For `css-component-library`, enable GitHub Pages**: Settings → Pages → Source: Deploy from branch → `main` / root. You'll get a live demo URL — put it in the repo's website field. This single step makes the repo far more compelling than a code-only repo.

---

## About commit history

The advice you were given about "regular commits over time" is real, but you can't fake it retroactively in a way that helps. What actually works:

**Don't** create fake backdated commits. It's detectable and pointless.

**Do** treat these five repos as living projects. Each has a roadmap in its README. Every time you tick off a roadmap item, that's a genuine commit. A repo with 30 real commits spread over three months looks completely different from one with a single "initial commit" — and the only way to get there is to actually keep working on them.

Realistic pace: pick one roadmap item per week across any repo. In two months you'll have a commit history that reads as authentic, because it will be.

## About the "10-20 repos" advice

I'd push back on it. Ten repos created the same day, most of them thin, reads worse than five substantial ones — the commit graph makes the pattern obvious. These five cover meaningfully different skills (theme development, reusable component authoring, CSS architecture, tested JavaScript, applied AI). That's a broader signal than ten variations on the same thing.

If you want more repos later, the honest way to get them is to build things you actually need and publish those.

## What to do next

1. Push these five (Steps 1-3 above)
2. Enable GitHub Pages on the CSS library
3. Add screenshots to `fitlix-storefront` and `css-component-library` — both READMEs have a marked spot for them
4. Pick one roadmap item and ship it this week

## A note on the screenshots

Two READMEs have placeholder sections for screenshots. Those placeholders should be filled or removed before you share the repos widely — a README promising screenshots that don't exist looks unfinished. Once your Shopify store is live, screenshot the homepage and product page; for the CSS library, screenshot the demo page in both light and dark mode.
