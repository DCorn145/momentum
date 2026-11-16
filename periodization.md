# MOBENTUM workout structure and periodization

## Daily mission template (13 moves, every day)
1. **Mobility** (3): hip, t-spine, then one other area.
2. **Primer** (2): 1 easy conditioning move + 1 easy core move.
3. **Circuit A**: hip hinge (B), horizontal pull (B), push (B).
4. **Circuit B**: squat/knee (A), vertical pull (A), core (B).
5. **Cool-down** (2): calming mobility, chosen from stretches and breathing work.

- Each ladder slot looks for a move with the slot's letter within about 4 steps below / 2 above the user's level. If none exists (for example a beginner and a B slot), it uses the move at the user's level and that move's own letter scheme. An A move is only ever done in A sets and reps.
- Core moves have no letter in the exercise list, so the circuit sets their sets and their targets come from their own range.
- Everyone in a circuit does the same number of rounds: the lowest set count among the scheme moves, minus one on 20-minute days, capped at 2 on recovery days.
- If pain blocks a movement, the slot is filled from another pattern so the count stays 11.
- Bonus workouts keep the flexible format (Lower, Upper, Mobility, Conditioning).

## Periodization (the PERIOD table in index.html)
A repeating cycle of weeks, counted from the user's first check-in (`S.pstart`):

| Week | Name | Effect |
|---|---|---|
| 1 | Foundation | `off 0`: targets at the user's level |
| 2 | Build | `off 0`: same targets |
| 3 | Push | `off +1`: one scheme step above the level. A miss holds the level (no step back); hitting it moves the level up |
| 4 | Deload | `off -2`, readiness cap -1, `hold`: lighter targets, no level changes, no 2-week review |

Fields per week: `t` name, `note` text, `off` scheme steps above (+) or below (-) the level, `cap` readiness cap shift, `hold` true = no level changes, `L` optional letter overrides by slot, e.g. `{cBsquat:"B"}` (slot ids: cA/cB + ladder id: hip, pull, push, squat, vpull, core).

Add or reorder rows to change the cycle length (it can be 6, 8 or 12 weeks). Starting a Program from the Progress page replaces the default cycle with that program's weeks (its `sets` value acts as `off`, a week named "Deload" holds levels, and its `wu` list themes the mobility block).

## Weekly rhythm (heavy / moderate / light)
Inside each cycle week, the Nth finished mission of that week sets the day's load. Weeks are counted from the cycle start date.

| Mission of the week | Day type | Effect |
|---|---|---|
| 1st to 3rd | Heavy | Targets at the week's level. Progress is earned here |
| 4th to 5th | Moderate | One scheme step lighter. Targets and levels held |
| 6th and later | Light | Two steps lighter. Targets and levels held |

A 7-day user gets H H H M M L L every week. A 3 to 4 day user is almost always Heavy. Deload weeks skip the rhythm (the whole week is light and held).

## Pacing rules
- A strength move steps up only after the target is hit on two Heavy days (rep or time target reached, effort 8 or easier, reps logged if entered), and at most once every 6 days per ladder.
- A ladder levels up (next exercise) only at the top step, after the same two hits, and no more than once every 7 days. The 2-week level check and the fitness test are the faster routes.
- Moves rotate: the three most recent days' moves are avoided when a near alternative exists, and a move maxed out at the top step is skipped in favour of a harder neighbour.
- A move rotated in next to ones you've trained starts at your current step, not step 1.
- A gap of 14 or more days between finished missions restarts the cycle at Foundation.
