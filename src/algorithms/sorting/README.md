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
