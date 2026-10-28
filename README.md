# Momentum

A free, single-file daily workout app. Each day you do a 30-second check-in (sleep, energy, stress, pain areas, time, equipment) and Momentum builds a fresh mission around it, then tracks your progress over time.

## Features

- **New workout every day**: seeded by the date and your check-in, so reloading gives the same plan. Recently done exercises are deprioritized and the focus rotates (lower, upper, full body).
- **Pain-aware**: exercises that load a painful joint are excluded. If nothing safe is left, it falls back to breathing work rather than ignoring your input.
- **Red-flag check**: sharp or worsening pain, numbness, chest pain or dizziness replaces the workout with a rest message.
- **Time-based planning**: the plan is built to fit your available minutes.
- **Explainable**: each mission shows why it looks the way it does.
- **Progress tracking**: streak, weekly count, readiness trend, 28-day grid, recent workouts, and automatic target progression.
- **Private**: no accounts, no server, no tracking. Data is stored in your browser's localStorage, with a copy/paste backup on the Progress tab.

## Run it

No build step. Open `index.html` in a browser.

## Deploy with GitHub Pages

1. Push this repo to GitHub.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, select `main` and `/ (root)`, then save.
4. Your site will be live at `https://<your-username>.github.io/<repo-name>/`.

## Customize

- **Exercises**: edit the `D` array in `index.html`. Each line is `name|pattern|equipment|joints loaded|unit|cue`.
  - Patterns: `mob`, `squat`, `hinge`, `push`, `pull`, `core`
  - Equipment: `bw`, `db`, `band`, `kb`
  - Joints: `neck`, `shoulder`, `back`, `hip`, `knee`, `ankle`, `wrist`
  - Units: `r` (reps), `s` (seconds), `m` (slow mobility reps)
- **Progression**: see the `finish()` function. Targets rise by 1 rep (or 5 sec) when hit at effort 8/10 or below.
- **Readiness formula**: see `readiness()`.

## Disclaimer

Momentum provides educational fitness guidance only. It is not medical advice, diagnosis or treatment. Stop any exercise that causes sharp, worsening or unusual pain, and consult a doctor before starting a new program.

## License

MIT, see `LICENSE`.
