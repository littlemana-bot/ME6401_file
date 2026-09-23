# ME6401 Individual Project — Submission Package

**Chengtao Zheng — A0351467Y — ME6401 Topics in Mechatronics 1**

## What this is

Two unmanned aerial vehicles search a forest for a trapped person. They share a
single ground rescue team, which both answers rescue calls and is the only way to
recover an aircraft that faults or loses contact. Because there is one team, those
two duties compete, and resolving that competition is what the specifications do.

## Package contents

| File / folder | What it is |
| --- | --- |
| `ME6401_Final_Report.docx` / `.pdf` | The report, English, 5 pages |
| `ME6401_Appendix_TCT.docx` / `.pdf` | The attachment: TCT operation steps, all five model sources verbatim, the recorded results, and a reproduction checklist |
| `models/` | The five `.ADS` sources and every `.DES` model TCT produced |
| `outputs/` | The `PDS` and `PDT` text dumps and the complete TCT session log |
| `figures/` | Graphviz sources and the rendered figures |

## The model

| Entity | States | Transitions | Role |
| --- | --- | --- | --- |
| UAV1 | 6 | 11 | Search aircraft |
| UAV2 | 6 | 11 | Search aircraft, labels offset by 12 |
| TEAM | 4 | 10 | One ground rescue team |

### Specifications and structural properties

Two items are genuine policy choices: the plant permits the forbidden behaviour,
so a supervisor has to remove it, and they are expressed as specification
automata.

- **Specification 1 — coverage preservation** (`SPEC_COVERAGE`, 4 states). An
  aircraft may not voluntarily stop while it is the only one exploring.
- **Specification 2 — first faulted, first repaired** (`SPEC_FIFO`, 5 states). If
  both aircraft are down, the team must go to the one that faulted or lost
  contact first.

Three further items already hold in the plant and need no specification:

- **Structural property 3 — rescue priority.** A call moves the team out of a
  repair and into the rescue in one shared transition, so a rescue is never
  blocked.
- **Structural property 4 — one team, one duty.**
- **Structural property 5 — a downed aircraft must be recovered by the team.**

## Verified results

| Model | States | Transitions | Events |
| --- | --- | --- | --- |
| UAV1 | 6 | 11 | 11 |
| UAV2 | 6 | 11 | 11 |
| TEAM | 4 | 10 | 8 |
| Plant G = `Sync(UAV1C,UAV2C,TEAM)` | 45 | 140 | 22 |
| SPEC_COVERAGE | 4 | 58 | 22 |
| SPEC_FIFO | 5 | 90 | 22 |
| Specification H = `Meet(SPCOVRC,SPFIFO)` | 20 | 234 | 22 |
| Supervisor M* = `Supcon(PLANTC,SPECC)` | 46 | 128 | 22 |

- The plant has 45 reachable states out of a possible 6 x 6 x 4 = 144, because the
  team's state is not free.
- **The supervisor has one state more than the plant.** The plant tuple
  `(3, 3, 0)` — both aircraft down, team idle — maps to two supervisor states,
  because the correct repair order depends on which aircraft faulted first.
- `Condat(PLANTC,SUPC)` reports **Controllable**, with **14 disabled state-event
  pairs**: event 3 six times and event 15 six times (Specification 1), event 5
  once and event 17 once (Specification 2). Every disabled event has an odd label,
  so every one is controllable.
- Since the legal behaviour is already controllable, `M` and `M*` have identical
  sizes and `Supcon` removes nothing further.

## Reproducing

Open TCT in the folder containing `USER`, then follow section B of the appendix:

```
FD      file all .ADS to .DES
3       Sync    k=3 : UAV1C, UAV2C, TEAM       -> PLANTC  (45,140)
4       Meet    k=2 : SPCOVRC, SPFIFO          -> SPECC   (20,234)
5       Supcon        PLANTC, SPECC            -> SUPC    (46,128)
7       Condat        PLANTC, SUPC             -> DATC    Controllable.
```

Section E of the appendix lists what each result must be. If any value differs,
the model has been changed since this submission.

## Event convention

TCT requires a controllable event to carry an **odd** label and an uncontrollable
event an **even** one (`TCT_Info.pdf`, p. xiii).

- Controllable: 1, 3, 5, 9, 11, 13, 15, 17, 21, 23
- Uncontrollable: 2, 4, 6, 8, 10, 14, 16, 18, 20, 22, 24, 26

Labels 7, 12, 19 and 25 are unused, because each event must occupy a label of the
parity its controllability requires.
