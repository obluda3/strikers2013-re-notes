# SHTX

*SHade TeXture file format*

Header:
| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Magic | u32 | |
| 0x4 | Format | u16 |  |
| 0x6 | Width | u16 | Fixed to 256x256 for Format = ST |
| 0x8 | Height | u16 | |
| 0xA | Unk A | u16 | |
| 0xB | Unk B | u16 | |

- SHTXFS: 256 color palette (8bpp)
- SHTXF4: 16 color palette (4bpp)
- SHTXFF: Raw pixel data (32bpp)

Credits:
- Alpha

# SSAD

*Shade Sprite Animation Data* - Used for layout and sprite animations.

Header (length 0x1C):
| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Magic | u32 | |
| 0x14 | Entry count | u32 | |

Each entry is made of different "fields".

Each field is structured as follows:

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Field Name | u32 | |
| 0x4 | Length | u32 | |
| 0x8 | Arguments | u32 | Length/4 |

Here are the different fields:
| Field | Description |
| --- | --- |
| PART | |
| NAME | Name of the entry |
| AREA | 4 u32s => rectangle (x1,y1,x2,y2) |
| ORGX/ORGY | origin x/y  |
| TBDT |   |
| MYID |   |
| PAID |   |
| CHID |   |
| PCID |   |
| SUCD |   |
| PRIO |   |
| POSX | X Position |
| POSY | Y Position |
| ANGL | Rotation angle  |
| SCAX | X Scale |
| SCAY | Y Scale |
| TRAN |   |
| HIDE |   |
| FLPH | Flip H |
| FLPV | Flip V |
| UDAT |   |
| PCOL |   |
| PALT |   |
| VERT |   |
| IMGX | Image X |
| IMGY | Image Y |
| IMGW | Image Width |
| IMGH | Image Height |
| ORFX/ORFY |   |

# Data

No proper name for them, loaded in `DCLoad`, most of the files from dat.bin.

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Section count | u32 | |
| 0x4 | End | u32 | |
| 0x8 | Beginning | u32 | |

For each section:
| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Offset | u32 | |
| 0x4 | Count | u32 | |

If the file contains text `End` will point to a section that contains pointers to text pointers.
