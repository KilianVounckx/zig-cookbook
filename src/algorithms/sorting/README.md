## Sorting

All functions dealing with sorting and comparisons are located in the std.sort namespace. The
main function for sorting a slice is called sort. It takes four arguments. The first one is the
type of slice elements. The second argument is the slice itself. The third argument is the context
type. There will be an example of that later. The last argument is the comparison function. This is
a comptime known function which takes a value of type context, as well as two values of the slice
element type. It should return false if the the first value has to be in front of the second value
in the sorted list. The std.sort namespace exports two functions which cover most use cases when
working with regular numbers. These are asc and desc. Each take a type as an argument, and return
the comparison function.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./sorting.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->

## Context

Almost all functions exported by std.sort take a context parameter. This can be of any type. Most
of the time this will just be void and be unused. Sometimes however it can be useful to have some
context. Say you have a 2D grid, and you want to sort a list of coordinates based on the distance
to a given coordinate. You could hardcode this one coordinate in the comparison function, but this
won't allow for having that coordinate be runtime known. For this a context can be used. An
important note is that order is not necessarily preserved. If two coordinates are equally far from
the context coordinate, their order could be swapped.
