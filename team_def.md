# Team Definitions

# Section 1 - TEAM_DEFS
Contains an array of pointers to the different `TEAM_DEF` in the file.

## TEAM_DEF Structure
Size: 0x18

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Name | u32 | Contains a pointer to a name given to the team |
| 0x4 | Team Index | u32 | Reserved |
| 0x8 | Formation | u16 | |
| 0xA | Coach | u16 | |
| 0xC | Manager | u16 | |
| 0xE | Strength | u16 | |
| 0x10 | PlayerData | u32 | Pointer to an array of TEAM_PLAYER |
| 0x14 | Metadata | u32 | Contains a pointer to an unknown structure |

## TEAM_PLAYER Structure
Size: 0x44
| Offset | Name | DataType |
| --- | --- | --- |
| 0x0 | PlayerID | u16 |
| 0x2 | Kit Number | u16 |
| 0x8 | Stats Index | u32 |
| 0x10 | Flag | u32 |
| 0x14 | Main Portrait | u32 |
| 0x18 | Left Portrait | u32 |
| 0x1C | Right Portrait | u32 |
| 0x20 | Level 1 Shoot | u16 |
| 0x22 | Level 2 Shoot | u16 |
| 0x24 | Level 3 Shoot | u16 |
| 0x28 | Dribble | u16 |
| 0x30 | Defense | u16 |
| 0x38 | Level 1 Catch | u16 |
| 0x3A | Level 2 Catch | u16 |
| 0x3C | Level 3 Catch | u16 |
| 0x40 | SP Shoot | u16 |

# Section 2 - Stats
Size: 0x14
| Offset | Name | DataType |
| --- | --- | --- |
| 0x0 | TP | u8 |
| 0x1 | Max TP | u8 |
| 0x2 | Kick | u8 |
| 0x3 | Max Kick | u8 |
| 0x4 | Catch | u8 |
| 0x5 | Max Catch | u8 |
| 0x6 | Body | u8 |
| 0x7 | Max Body | u8 |
| 0x8 | Guard | u8 |
| 0x9 | Max Guard | u8 |
| 0xA | Control | u8 |
| 0xB | Max Control | u8 |
| 0xC | Speed | u8 |
| 0xD | Max Speed | u8 |

# Section 3 - Kizuna
Size: 0x10
