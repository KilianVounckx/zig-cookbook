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
