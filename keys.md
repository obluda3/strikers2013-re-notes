# Keys

File: 0.bin\48.bin and dat\11.bin. First sections are unknown. Last one is the table of key profiles, and before that the profiles are defined.

## StatBonus

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Unknown | u16 | Probably some padding |
| 0x2 | Level 1 | u16 | Stat bonus that you get with 50% kizuna |
| 0x4 | Level 2 | u16 | Stat bonus that you get with 75% kizuna |
| 0x6 | Level 3 | u16 | Stat bonus that you get with 100% kizuna |

## Key profiles
| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Kick | StatBonus | |
| 0x8 | Catch | StatBonus | |
| 0x10 | Body | StatBonus | |
| 0x18 | Guard | StatBonus | |
| 0x20 | Control | StatBonus | |
| 0x28 | Speed | StatBonus | |
