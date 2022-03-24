const std = @import("std");

test "basics" {
    try std.testing.expect(true);
    try std.testing.expectEqual(@as(u32, 42), 42);
    try std.testing.expectEqualSlices(u32, &.{ 1, 2, 3, 4 }, &.{ 1, 2, 3, 4 });
    try std.testing.expectEqualSentinel(u32, 0, &.{ 1, 2, 3 }, &.{ 1, 2, 3 });
}
