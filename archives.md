# mcb0.bln

Table used as index to mcb1.bln

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | ID | u32 | |
| 0x4 | Offset | u32 |  |
| 0x8 | Size | u32 | |

# mcb1.bln

Contains archives

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Archive index | u32 | 0x00 => grp.bin 0x01 => scn.bin 0x02 => scn_sh.bin 0x03 => ui.bin 0x04 => dat.bin |
| 0x4 | Archive offset | u32 |  |
| 0x8 | Size | u32 | |

Files are compressed.

# Other archives

Header:

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | File Count | u32 | |
| 0x4 | Pad Factor | u32 | |
| 0x8 | Mul Factor | u32 | |
| 0xC | Shift Factor | u32 | |
| 0x10 | Mask | u32 | |

File Table:
| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Offset and Size | u32 | Offset = (OffSize >> Shift Factor) * Pad Factor<br />Size = (OffSize & Mask) * Mul Factor |
