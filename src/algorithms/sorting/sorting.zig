const std = @import("std");

test "sorting" {
    var list = [_]u32{ 1, 5, 10, 3, 15 };
    std.sort.sort(u32, &list, {}, comptime std.sort.asc(u32));
    try std.testing.expectEqualSlices(u32, &.{ 1, 3, 5, 10, 15 }, &list);

    std.sort.sort(u32, &list, {}, comptime std.sort.desc(u32));
    try std.testing.expectEqualSlices(u32, &.{ 15, 10, 5, 3, 1 }, &list);
}
