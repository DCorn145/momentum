# M☺︎BENTUM

A free, single-file daily workout app. Each day you do a 30-second check-in (sleep, energy, stress, pain areas, time, equipment) and M☺︎BENTUM builds a fresh mission around it, then tracks your progress over time.

## Features

- **New workout every day**: seeded by the date and your check-in, so reloading gives the same plan. Recently done exercises are deprioritized and the focus rotates (lower, upper, full body).
- **Pain-aware**: exercises that load a painful joint are excluded. If nothing safe is left, it falls back to breathing work rather than ignoring your input.
- **Red-flag check**: sharp or worsening pain, numbness, chest pain or dizziness replaces the workout with a rest message.
- **Time-based planning**: the plan is built to fit your available minutes.
- **Explainable**: each mission shows why it looks the way it does.
- **Progress tracking**: streak, weekly count, readiness trend, 28-day grid, recent workouts, and automatic target progression.
- **Private**: no ads, no tracking. Works without an account (data stays in your browser's localStorage). If you sign in with your email, progress is also synced to your account in Supabase. Copy/paste backup on the Progress tab, and a Delete my account button. See `privacy.html` and `terms.html`.

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

    Name | equipment | joints it loads | unit | coaching cue | rep range (optional) | load (optional)

- **Ladders** list exercises from easiest (top) to hardest (bottom). Put a new line where it belongs.
- Equipment codes: `bw db band kb bench bb hex bar`. A comma means either one (`db,kb`), a plus means both (`db+bench`).
- Joints: `neck shoulder back hip knee ankle wrist`. People with pain there are not given the move.
- Units: `r` reps, `rs` reps each side, `s` seconds, `ss` seconds each side, `m` slow mobility reps.
- `load` / `noload` forces a weight box on or off. If left off, moves needing `db`, `kb`, `bb` or `hex` get one automatically.
- A line starting with `#` starts a new group: `# id | pattern | Title | ladder`.

### Weight tracking
- Loaded exercises get a weight box. The app estimates a one-rep max from each logged set (weight divided by the percentage for the reps done: 1 rep 100%, 3 reps 93%, 5 reps 85%, 7 reps 77%, 10 reps 67%, 12 reps 62%, 15 reps 58%, 20 reps 50%, straight lines in between) and suggests a weight for the target reps next time.
- To change the percentages, search for `PCT=` in `index.html`.

### How progression works
- Each ladder remembers the person's current step. New users pick Beginner, Intermediate or Advanced once.
- After each workout the person rates how good they feel (1 rough, 10 great). Hit the target and feel 3/10 or better and the target rises by 1 rep (5 sec for holds) until the top of the range.
- At the top of the range, with reps logged, the person moves up one step and the target resets.
- Feeling 1-2/10 while missing the target lowers the target, then steps back down the ladder.
- Low-readiness days run one step easier and hold targets. After 10+ days away, targets drop slightly.
- Moves the person has no equipment for, or that load a painful joint, are skipped automatically.

## Disclaimer

M☺︎BENTUM provides educational fitness guidance only. It is not medical advice, diagnosis or treatment. Stop any exercise that causes sharp, worsening or unusual pain, and consult a doctor before starting a new program.

## License

All rights reserved, see `LICENSE`.
