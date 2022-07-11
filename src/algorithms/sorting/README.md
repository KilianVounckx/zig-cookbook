## Sorting

All functions dealing with sorting and comparisons are located in the std.sort namespace. The
main function for sorting a slice is called sort. This function automatically uses a sorting
algorithm based on heuristics from the given slice length. It takes four arguments. The first one is
the type of slice elements. The second argument is the slice itself. The third argument is the
context type. There will be an example of that later. The last argument is the comparison function.
This is a comptime known function which takes a value of type context, as well as two values of the
slice element type. It should return false if the the first value has to be in front of the second
value in the sorted list. The std.sort namespace exports two functions which cover most use cases
when working with regular numbers. These are asc and desc. Each take a type as an argument, and
return the comparison function. Besides the normal sort function, there is also insertionSort,
which always sorts the given slice using the insertion sort algorithm. Most of the times, this
will be slower, so just using sort is preferred.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./sorting.zig) -->
<!-- The below code snippet is automatically added from ./sorting.zig -->
```zig
const std = @import("std");

test "sorting" {
    var list = [_]u32{ 1, 5, 10, 3, 15 };
    std.sort.sort(u32, &list, {}, comptime std.sort.asc(u32));
    try std.testing.expectEqualSlices(u32, &.{ 1, 3, 5, 10, 15 }, &list);

    std.sort.sort(u32, &list, {}, comptime std.sort.desc(u32));
    try std.testing.expectEqualSlices(u32, &.{ 15, 10, 5, 3, 1 }, &list);
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Is sorted

The isSorted function checks if a list is sorted. It takes the exact same parameters as the sort
functions.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./sorting.zig) -->
<!-- The below code snippet is automatically added from ./sorting.zig -->
```zig
const std = @import("std");

test "sorting" {
    var list = [_]u32{ 1, 5, 10, 3, 15 };
    std.sort.sort(u32, &list, {}, comptime std.sort.asc(u32));
    try std.testing.expectEqualSlices(u32, &.{ 1, 3, 5, 10, 15 }, &list);

    std.sort.sort(u32, &list, {}, comptime std.sort.desc(u32));
    try std.testing.expectEqualSlices(u32, &.{ 15, 10, 5, 3, 1 }, &list);
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Context

Almost all functions exported by std.sort take a context parameter. This can be of any type. Most
of the time this will just be void and be unused. Sometimes however it can be useful to have some
context. Say you have a 2D grid, and you want to sort a list of coordinates based on the distance
to a given coordinate. You could hardcode this one coordinate in the comparison function, but this
won't allow for having that coordinate be runtime known. For this a context can be used. An
important note is that order is not necessarily preserved. If two coordinates are equally far from
the context coordinate, their order could be swapped. This is called unstable sorting. It has
nothing to do with the context, and everything with the algorithm zig uses to sort. With the builtin
functions asc and desc, you won't notice this however, since only if two variables are the same
will their order be swapped.

Note: In other (more functional) programming languages, these context variables could be
encapsulated in closures. Since zig does not have closures, this is impossible.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./context.zig) -->
<!-- The below code snippet is automatically added from ./context.zig -->
```zig
const std = @import("std");

const Coord = struct {
    const Self = @This();

    x: i32,
    y: i32,

    pub fn distance(self: Self, other: Self) u32 {
        return std.math.absCast(self.x - other.x) + std.math.absCast(self.y - other.y);
    }

    pub fn compare(context: Self, a: Self, b: Self) bool {
        return context.distance(a) < context.distance(b);
    }
};

test "context" {
    var list = [_]Coord{
        .{ .x = 1, .y = 2 },
        .{ .x = -2, .y = 2 },
        .{ .x = 3, .y = 4 },
        .{ .x = -3, .y = -2 },
        .{ .x = 4, .y = 4 },
        .{ .x = -2, .y = 3 },
    };
    var context = Coord{ .x = 0, .y = 0 };

    std.sort.sort(Coord, &list, context, Coord.compare);

    try std.testing.expectEqualSlices(Coord, &.{
        .{ .x = 1, .y = 2 },
        .{ .x = -2, .y = 2 },
        .{ .x = -3, .y = -2 },
        .{ .x = -2, .y = 3 },
        .{ .x = 3, .y = 4 },
        .{ .x = 4, .y = 4 },
    }, &list);

    context = .{ .x = 5, .y = 5 };
    std.sort.sort(Coord, &list, context, Coord.compare);

    try std.testing.expectEqualSlices(Coord, &.{
        .{ .x = 4, .y = 4 },
        .{ .x = 3, .y = 4 },
        .{ .x = 1, .y = 2 },
        .{ .x = -2, .y = 3 },
        .{ .x = -2, .y = 2 },
        .{ .x = -3, .y = -2 },
    }, &list);
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## SortContext

Besides sort and insertionSort, there are sortContext and insertionSortContext. These functions do
not take a slice. They take a length, and a context. This allows to sort any type. It does not have
to be a slice. It could be used for sorting a binary tree for example. To keep things simple, this
sample will sort a slice. The length argument will be the length of the slice in this case. The
context can be any type. The only requirements is that is has a swap and a lessThan declaration.
The swap declaration takes two usize integers and swaps the corresponding elements. The lessThan
declaration also takes two usize integers and returns true if the element corresponding to the first
index is smaller than the second.

Note: The context argument in these functions has nothing to do with the context argument in the
other sorting functions.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./sort_context.zig) -->
<!-- The below code snippet is automatically added from ./sort_context.zig -->
```zig
const std = @import("std");

test "sortContext" {
    const Context = struct {
        const Self = @This();

        list: []u32,

        pub fn swap(self: Self, i: usize, j: usize) void {
            const tmp = self.list[i];
            self.list[i] = self.list[j];
            self.list[j] = tmp;
        }

        pub fn lessThan(self: Self, i: usize, j: usize) bool {
            return self.list[i] < self.list[j];
        }
    };

    var list = [_]u32{ 1, 5, 10, 3, 15 };
    const context = Context{ .list = &list };
    std.sort.sortContext(list.len, context);

    try std.testing.expectEqualSlices(u32, &.{ 1, 3, 5, 10, 15 }, &list);
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Binary Search

The binarySearch function searches for an item in a sorted list. It runs in O(log(N)) time which
is much faster than a linear search, especially for large lists. Technically, the list doesn't have
to be ordered. The only thing that matters is all the elements before the one you are searching for
should be smaller, and all the ones after it should be bigger. A sorted list always has this
property. The binarySearch function takes most of the same parameters as the sort functions. There
are two differences. The first is it takes a key. This is the item you are looking for. The second
difference is more subtle. The comparison function does not just return a boolean anymore. It
returns an Order enum (from std.math). This enum has three fields: lt, gt and eq. They signal
if the first item is less than, greater than, or equal to the second item respectively. If the key
is found in the list, the corresponding index is returned. Otherwise, it returns null.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./binary_search.zig) -->
<!-- The below code snippet is automatically added from ./binary_search.zig -->
```zig
const std = @import("std");

test "binary search" {
    const list = [_]u32{ 5, 6, 7, 8, 9 };

    const order = struct {
        pub fn order(_: void, a: u32, b: u32) std.math.Order {
            if (a < b) {
                return .lt;
            } else if (a > b) {
                return .gt;
            } else {
                return .eq;
            }
        }
    }.order;

    var index = std.sort.binarySearch(u32, 7, &list, {}, order);
    try std.testing.expectEqual(@as(?usize, 2), index);

    index = std.sort.binarySearch(u32, 42, &list, {}, order);
    try std.testing.expectEqual(@as(?usize, null), index);
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Min and max

The last functions in the std.sort namespace are min, max, argMin and argMax. All of them take the
same arguments as the sort functions. Min and max return the smallest and largest item in the
given slice respectively. ArgMin and argMax return the index corresponding to the smallest and
largest item respectively. All four of these functions return null if the given slice is empty.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./min_max.zig) -->
<!-- The below code snippet is automatically added from ./min_max.zig -->
```zig
const std = @import("std");

test "min, max" {
    const list = [_]u32{ 13, 11, 31, 4, 42, 6 };

    const min = std.sort.min(u32, &list, {}, comptime std.sort.asc(u32));
    try std.testing.expectEqual(@as(?u32, 4), min);

    const max = std.sort.max(u32, &list, {}, comptime std.sort.asc(u32));
    try std.testing.expectEqual(@as(?u32, 42), max);
}

test "argMin, argMax" {
    const list = [_]u32{ 13, 11, 31, 4, 42, 6 };

    const min = std.sort.argMin(u32, &list, {}, comptime std.sort.asc(u32));
    try std.testing.expectEqual(@as(?usize, 3), min);

    const max = std.sort.argMax(u32, &list, {}, comptime std.sort.asc(u32));
    try std.testing.expectEqual(@as(?usize, 4), max);
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->
