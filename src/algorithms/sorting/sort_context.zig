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
