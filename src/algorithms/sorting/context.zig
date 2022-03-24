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
        .{ .x = 3, .y = -3 },
        .{ .x = -2, .y = 3 },
        .{ .x = 2, .y = -1 },
    };

    var context = Coord{ .x = 0, .y = 0 };

    std.sort.sort(Coord, &list, context, comptime Coord.compare);

    try std.testing.expectEqualSlices(Coord, &.{
        .{ .x = 1, .y = 2 },
        .{ .x = 2, .y = -1 },
        .{ .x = -2, .y = 2 },
        .{ .x = -3, .y = -2 },
        .{ .x = -2, .y = 3 },
        .{ .x = 3, .y = -3 },
        .{ .x = 3, .y = 4 },
        .{ .x = 4, .y = 4 },
    }, &list);
}
