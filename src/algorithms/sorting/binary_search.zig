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
