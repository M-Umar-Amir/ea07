# OPEN CRICKET REMASTER

Original cricket game foundation built with Godot 4.x.

## Repository Structure

```text
open-cricket-remaster/
├── project.godot
├── scenes/
│   ├── main/
│   ├── menu/
│   ├── match/
│   ├── stadium/
│   ├── players/
│   ├── ball/
│   └── UI/
├── scripts/
│   ├── core/
│   ├── match/
│   ├── batting/
│   ├── bowling/
│   ├── ball/
│   ├── fielding/
│   ├── AI/
│   ├── players/
│   ├── teams/
│   ├── career/
│   ├── tournament/
│   └── UI/
├── data/
│   ├── players/
│   ├── teams/
│   ├── stadiums/
│   └── competitions/
├── assets/
│   ├── models/
│   ├── textures/
│   ├── animations/
│   ├── audio/
│   └── UI/
├── tests/
└── docs/
```

## Current Foundation Delivered

- Godot project bootstrap (`project.godot`) with autoloaded `GameStateManager`.
- Main scene that routes startup to menu.
- Basic menu scene (`QUICK MATCH`, `EXIT`).
- Match scene with placeholder cricket pitch, bowler, batter, and ball.
- Minimal playable interaction loop:
  - `SPACE` bowls a delivery.
  - `ENTER` attempts a timed shot.
  - `R` returns to menu.

## Scene Entry Points

- Main: `/home/runner/work/ea07/ea07/scenes/main/main.tscn`
- Menu: `/home/runner/work/ea07/ea07/scenes/menu/menu.tscn`
- Match: `/home/runner/work/ea07/ea07/scenes/match/match.tscn`

## GitHub Setup Instructions

1. Create protected `main` and working `develop` branches.
2. Use short-lived feature branches (for example `feature/foundation`, `feature/batting`, `feature/bowling`).
3. Require pull requests and status checks before merge.
4. Run Godot headless checks in CI for scene/script load validation.
5. Keep assets original or properly licensed before adding them.

## First Playable Milestone

**Milestone target:** Foundation prototype where user can launch game, enter menu, start quick match scene, bowl, and attempt basic timed shots with placeholder 3D entities.

After confirming this baseline works, implement the complete one-over match loop (runs, wickets, overs, innings, and result) as the next milestone.
