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

# TEXCUT

Little endian. No Header, just an array of the SHD_TEXCUT (0x10 bytes long) struct:

| Offset | Name | DataType |
| --- | --- | --- |
| 0x0 | X Offset | u16 |
| 0x2 | Y Offset | u16 |
| 0x4 | Width | u16 |
| 0x6 | Height | u16 |

# SSAD

*Shade Sprite Animation Data* - Used for layout and sprite animations. Little endian



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

Here are the different fields:
| Field | Description | Has KeyFrame |
| --- | --- | --- |
| PART | | |
| NAME | Name of the entry | | 
| AREA | 4 u32s => rectangle (x1,y1,x2,y2) | |
| ORGX/ORGY | origin x/y  | |
| TBDT |   | |
| MYID |   | |
| PAID |   | |
| CHID |   | |
| PCID |   | |
| SUCD |   | |
| PRIO |   | |
| POSX | X Position | X |
| POSY | Y Position | X |
| ANGL | Rotation angle | X |
| SCAX | X Scale | X |
| SCAY | Y Scale | X |
| TRAN |   | X | 
| HIDE |   | X | 
| FLPH | Flip H | X |
| FLPV | Flip V | X |
| UDAT |   | X |
| PCOL |   | X | 
| PALT |   | X |
| VERT |   | X |
| IMGX | Image X | X |
| IMGY | Image Y | X |
| IMGW | Image Width | X |
| IMGH | Image Height | X |
| ORFX/ORFY |   | X |

Some of them have an extended header, if they allow "keyframes". It adds two more u32's (success values), and one keyframe count.

The Keyframe data is a 0x1C bytes long structure.

# Data cache

Loaded with `DCLoad`, most of the files from dat.bin. This format is used to store data structures.

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

When a file is loaded in memory, all the u32 that are treated as offsets are resolved to be pointers. It allows for quick memory access. `End` will point to a section that contains pointers to pointers in the file that may need to be fixed.
