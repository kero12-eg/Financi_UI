# UNIVERSAL README — entry point for the portable docs set

> ملاحظة بالعربية: الملف دا دليل الدخول للملفات **العامة** اللي تتنقل زي ما هي لأي مشروع جديد — انسخه مع الباقي.

These 9 files are **project-agnostic**: they describe HOW to work and HOW to build (save, backend, day agenda, design, pinch zoom, fixed screen scaling, pixel-diff forensics, and how to bootstrap all of it) in any app. Everything else in this repo is specific to the law-office project.

> **Entry point for a new project:** [`UNIVERSAL_BOOTSTRAP.md`](UNIVERSAL_BOOTSTRAP.md) is the
> executable runbook (copy → create → wire the code → self-audit). This file is the index.

---

## The portable set (copy these to any project)

| # | File | Contains | Read when |
|---|---|---|---|
| 1 | `USER_CONTEXT.md` | How I communicate and work with AI (Arabic, concise, show progress, ask before big changes) | **First conversation**, always |
| 2 | `GENERAL_PROJECT_RULES.md` | Universal engineering rules: minimal changes, error handling, **§11 local-first save**, **§12 save page + activity log pattern** (with code) | Before starting any task |
| 3 | `UNIVERSAL_BACKEND_PATTERNS.md` | Backend integration for ANY stack: layering, Supabase/DB recipes (code), auth, offline outbox/pending queues (code), timestamps, file storage, migrations, security checklist | Any task touching data/backend |
| 4 | `UNIVERSAL_DESIGN_PRINCIPLES.md` | General UI/UX rules (tokens, consistency, states) | Any UI work |
| 5 | `UNIVERSAL_DAY_AGENDA_PATTERN.md` | Day-agenda/list screens: one row per primary event, prev/next decision columns (SQL chain + LEAD-style lookup, code), merging secondary entries of the same owner (code), schedule/postpone creating a real future row (code), pitfalls + test scenario | Building any agenda/calendar/daily-list screen |
| 6 | `UNIVERSAL_PINCH_ZOOM.md` | App-wide pinch zoom for **Flutter** (gallery-style): why `InteractiveViewer` at app level loses to swipe-to-delete, custom pinch-only recognizer (full code), 7 tests, edge cases, ready-to-paste prompt | Any Flutter work touching gestures/zoom |
| 7 | `UNIVERSAL_SCREEN_SCALING.md` | **One fixed design + the app fills the whole screen**: the single uniform `scale = min(w/W, h/H)` rule with the canvas derived as `window / scale` (no letterbox bars ever) + `FittedBox` code, what MediaQuery pins vs what stays real (safe area, keyboard, text scale), frozen `screenutil`, per-add checklist (§0), verification procedure with `adb wm size` + zero-white-edges test, measured evidence, 22 tests, hard lessons | Any Flutter UI/layout work — **and every time you add a screen or widget** |
| 8 | `UNIVERSAL_BOOTSTRAP.md` | **The runbook**: copy the portable set → create the 4 project files (with paste-ready templates) → wire the 5 code files in `main.dart` → **self-audit** (analyze/tests/link-graph/zero-white-edges) → how to adopt all of it into an app that already exists | Starting a new project, or onboarding an existing one |
| 9 | `UNIVERSAL_PIXEL_DIFF_FORENSICS.md` | Pixel-diff forensics (design ref PNG vs rendered golden): measure-before-fix rule, ink-mass/shift text diagnostics, channel-order + bicubic-ringing artifacts, PNG ref extraction, "should I even fix it?" thresholds | Comparing rendered UI against a design reference (visual QA) |
| 10 | `figma-pixel-kit/README.md` | **Figma → Flutter pixel-perfect pipeline** as a portable kit: extractor CLI (pull/frames/inspect/palette/assets), measure scripts (audit/probe/inkscan), responsive scaler template, golden/fit/wide skeletons, **screen-selection gate**, thresholds, paste-ready AI handoff prompt | Reproducing ANY Figma design at exact measurements |
| 11 | `UNIVERSAL_PORTFOLIO_SHOTS.md` | **Portfolio-screenshots pipeline** for any app: screen audit → professional demo data (idempotent seed, `CURRENT_DATE`-relative, REST-verified) → release build (why debug shows a badge) → emulator capture kit (adb, safe navigation, recovery) → per-shot verify loop (read every PNG, 4-8x zoom, visual-defect checklist) → coverage check + delivery gate | User asks for portfolio screenshots / "prepare the app for showcase" |

## NOT portable (stay per-project)

`AGENTS.md`, `PROJECT_RULES.md`, `DESIGN_SYSTEM.md`, root `README.md`, `.opencode/plans/`, session logs — these describe ONE project and must be rebuilt per project (via a full code audit, like this repo's). `AGENTS.md` is regenerated per project from the template in step 3 below (this repo's own version: [`AGENTS.md`](AGENTS.md)).

---

## Bootstrap a brand-new project — 3 steps

> **Preferred: work straight from the runbook** → [`UNIVERSAL_BOOTSTRAP.md`](UNIVERSAL_BOOTSTRAP.md)
> (§1 copy · §2 create · §3 wire the code · §4 self-audit · §6 adopt into an existing app).
> The 3 steps below are the summary of it.

1. **Copy the 9 portable files** above to the new repo root (keep the same names — links break otherwise).
2. **Create the project's own docs:**
   - `README.md` — index pointing at everything (copy the structure of this repo's README, incl. its "Read order" table).
   - `PROJECT_RULES.md` — run a full audit of the new codebase (screens, save paths, backend, SQL, defects) exactly like this repo's file. Do NOT copy this repo's version. **Copy its 🚨 "read `UNIVERSAL_SCREEN_SCALING.md` §0 before any UI change" header block** — the project id changes, the rule does not.
   - `DESIGN_SYSTEM.md` — extract from the new app's actual styling.
3. **Add a pointer file so any AI finds them** — paste this into `AGENTS.md` (or `CLAUDE.md`) at the new repo root:

    # Agent instructions — read in order
    0. UNIVERSAL_BOOTSTRAP.md   → ONLY when starting a NEW project (the runbook: copy → wire → audit)
    1. USER_CONTEXT.md          → how to work with me
    2. PROJECT_RULES.md         → THIS project's rules (ALWAYS wins over universal files)
    3. GENERAL_PROJECT_RULES.md → universal rules (§11 local drafts, §12 save + activity log)
    4. UNIVERSAL_BACKEND_PATTERNS.md → backend/offline/timestamps/security rules
    5. UNIVERSAL_SCREEN_SCALING.md → ⚠️ §0 checklist before ANY UI/layout/sizing change
                                     (one design canvas + one uniform scale; canvas fills the screen)
    6. DESIGN_SYSTEM.md         → which token/number to use
    7. UNIVERSAL_DESIGN_PRINCIPLES.md → design/token/UX principles (§8 one-scale vs responsive)
    8. UNIVERSAL_DAY_AGENDA_PATTERN.md → day-agenda screens (rows, prev/next columns, merging, postpone)
    9. UNIVERSAL_PINCH_ZOOM.md  → Flutter pinch zoom that never fights scroll/swipe-delete
    10. UNIVERSAL_PIXEL_DIFF_FORENSICS.md → visual QA: pixel diff (design ref vs rendered golden)
    11. README.md               → index
    Rules: minimal changes; verify (analyze/tests) after every change; list changed files;
    never rename tables/columns; never change UI text without asking; commit only when asked.

   (Ready-made, fully linked version of exactly this list → this repo's [`AGENTS.md`](AGENTS.md).)

---

## Golden rules

1. **Project files win.** When a project rule conflicts with a universal one, the project's `PROJECT_RULES.md` decides for that project.
2. **New pitfall discovered → write it in BOTH places:** universal file (if any project could hit it) + project file (if it's specific).
3. **Never re-learn a documented bug.** Every "⚠️ / Hard lesson" in these files already happened once.
4. **Update this README** whenever a portable file is added or removed.
5. **UI/layout/sizing task → `UNIVERSAL_SCREEN_SCALING.md` §0 first**, every time, in every
   project. Sizes come from design units, never from the real screen; one scaler only.
6. **The files must cross-link each other** (header "Companion files" / "Read together"
   block). A portable file with no outgoing links is a dead end — link it when you add it.
