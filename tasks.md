# Tasks

**Tasks** are actions (functions) that are performed each frame. 

## Structure

They are functions that have exactly two arguments, an `s32` which is the current state, and a `void*` (not always used) that's actually a pointer to the parent class.

 A task has the following structure:

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Function | u32 | Pointer to the function |
| 0x4 | Parent class | u32 | the `void*` mentioned earlier |
| 0x8 | unk | u32 | |

## cTASK

**cTASK** is the name given to one of the main classes in the game. It holds the tasks that an element (a menu, the helpbar, a window...) in a stack-like structure. It has the following structure:

| Offset | Name | DataType | Notes |
| --- | --- | --- | --- |
| 0x0 | Tasks | Task* | Pointer to an array of tasks. |
| 0x4 | Elapsed time | u32 | not sure about this one |
| 0x8 | Call count | u32 | Counts how many times the current function has been executed. |
| 0x4 | Remaining tasks | u32 | Counts how many tasks are free |
| 0x8 | Task Count | u32 | |

### Methods

#### Update

Executes the task that is at the top of the stack with 2 as the argument. If it has never been executed, it first executes it with 0 as the argument. Updates the call count, and elapsed time.

#### Push

Adds a new task to the top of the stack. Updates the remaining tasks count.

#### Pop

Executes the task that is at the top of the stack with 3 as the argument. Updates the remaining tasks count (to "remove" the last one). Next function becomes the top of the stack. Executes it with 1 as the argument.


