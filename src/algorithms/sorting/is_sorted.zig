const std = @import("std");

test "isSorted" {
    var list = [_]u32{ 1, 2, 3, 4, 5 };
    try std.testing.expect(std.sort.isSorted(u32, &list, {}, comptime std.sort.asc(u32)));
    try std.testing.expect(!std.sort.isSorted(u32, &list, {}, comptime std.sort.desc(u32)));

    list = [_]u32{ 5, 4, 3, 2, 1 };
    try std.testing.expect(!std.sort.isSorted(u32, &list, {}, comptime std.sort.asc(u32)));
    try std.testing.expect(std.sort.isSorted(u32, &list, {}, comptime std.sort.desc(u32)));

    list = [_]u32{ 2, 5, 4, 32, 43 };
    try std.testing.expect(!std.sort.isSorted(u32, &list, {}, comptime std.sort.asc(u32)));
    try std.testing.expect(!std.sort.isSorted(u32, &list, {}, comptime std.sort.desc(u32)));
}
