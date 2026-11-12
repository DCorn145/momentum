# M☺︎BENTUM

A free, single-file daily workout app. Each day you do a 30-second check-in (sleep, energy, stress, pain areas, time, equipment) and M☺︎BENTUM builds a fresh mission around it, then tracks your progress over time.

## Features

- **New workout every day**: seeded by the date and your check-in, so reloading gives the same plan. Recently done exercises are deprioritized and the focus rotates (lower, upper, full body).
- **Pain-aware**: exercises that load a painful joint are excluded. If nothing safe is left, it falls back to breathing work rather than ignoring your input.
- **Red-flag check**: sharp or worsening pain, numbness, chest pain or dizziness replaces the workout with a rest message.
- **Time-based planning**: the plan is built to fit your available minutes.
- **Explainable**: each mission shows why it looks the way it does.
- **Progress tracking**: streak, weekly count, readiness trend, 28-day grid, recent workouts, and automatic target progression.
- **Private**: no ads, no tracking. Works without an account (data stays in your browser's localStorage). If you sign in with your email, progress is also synced to your account in Supabase. Your Progress tab has a Delete my account button for signed-in users. See `privacy.html` and `terms.html`.

## Run it

No build step. Open `index.html` in a browser.

## Deploy with GitHub Pages

1. Push this repo to GitHub.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, select `main` and `/ (root)`, then save.
4. Your site will be live at `https://<your-username>.github.io/<repo-name>/`.

## Customize

### Add or reorder exercises
Open `index.html` on GitHub, press the pencil icon, and search for `EXERCISE LIBRARY`. Each exercise is one line:

    Name | equipment | joints it loads | unit | coaching cue | rep range (optional) | load (optional) | intensity 1-10 | letter A/B/C

- **Intensity** is the 1-10 score. Add `i` after it (like `7i`) for jumping or landing moves.
- **Letter** picks the set and rep scheme for strength moves (see `SCH=` in `index.html`). A: 1x20, 2x10, 2x12, 3x10, 3x15. B: 2x8, 3x6, 3x8, 4x5, 4x6. C: 2x3, 3x3, 5x4, 5x5. Core, mobility and cardio can leave the letter blank.
- Equipment codes: `bw db band kb bench bb hex bar cable med`. A comma means either one (`db,kb`), a plus means both (`db+bench`).
- Joints: `neck shoulder back hip knee ankle wrist`. People with pain there are not given the move.
- Units: `r` reps, `rs` reps each side, `s` seconds, `ss` seconds each side, `m` slow mobility reps, `rd` rounds, `x` one steady effort (the range is minutes).
- `load` / `noload` forces a weight box on or off. If left off, moves needing `db`, `kb`, `bb`, `hex` or `cable` get one automatically.
- A line starting with `#` starts a new group: `# id | pattern | Title | ladder`.

### Weight tracking
- Loaded exercises get a weight box. The app estimates a one-rep max from each logged set (weight divided by the percentage for the reps done: 1 rep 100%, 3 reps 93%, 5 reps 85%, 7 reps 77%, 10 reps 67%, 12 reps 62%, 15 reps 58%, 20 reps 50%, straight lines in between) and suggests a weight for the target reps next time.
- To change the percentages, search for `PCT=` in `index.html`.

### How progression works
- Every person has one overall **stage**. The nine stages run 1-4 A, 1-4 B, 1-4 C, 5-6 A, 5-6 B, 5-6 C, 7-10 A, 7-10 B, 7-10 C (the number is the exercise intensity score, the letter is the set and rep scheme). A stage is skipped automatically if fewer than three movement groups have an exercise in it.
- New users pick Beginner (starts at 1-4 A), Intermediate (5-6 A) or Advanced (5-6 C) once. Change these in `lvStart=`.
- A workout uses strength moves from the current stage's letter and score band, so A moves are paired with A, B with B, C with C. When the list has no move for a group at the current stage, the app falls back to the nearest same-letter move.
- Beginners get extra mobility: four warm-up moves and two cool-down moves on lifting days.
- After each workout the person rates how good they feel (1 rough, 10 great). Hit the targets and feel 3/10 or better and it counts as a good session. Three good sessions (`NEED=`) move the scheme up one step (for example 1x20 to 2x10). At the end of the scheme the person moves up to the next stage.
- Two hard sessions in a row (feeling 1-2/10 while missing targets) step back one notch.
- Core, mobility and cardio use their own rep or second targets that rise by 1 rep (5 sec for holds) each good session.
- Low-readiness days run one notch easier and hold progress. After 10+ days away, targets drop slightly.
- Moves the person has no equipment for, or that load a painful joint, are skipped automatically.

## Disclaimer

M☺︎BENTUM provides educational fitness guidance only. It is not medical advice, diagnosis or treatment. Stop any exercise that causes sharp, worsening or unusual pain, and consult a doctor before starting a new program.

## License

All rights reserved, see `LICENSE`.
