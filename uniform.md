# UniformData
Main.dol @0x804D08B8 => uniformDataTbl

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Player | s32 | -1 => Everyone 0 => Clubroom only, any other value will make the uniform only available for a specific player |
| 0x4 | Uniform | u32 |  |
| 0x8 | Emblem | u32 | 0 => Same as Uniform |
| 0xC | Text Entry | u32 | Index into text file |
| 0x10 | Unk | u32 | |
