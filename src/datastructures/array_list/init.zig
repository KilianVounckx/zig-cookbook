const std = @import("std");

test "Initialization" {
    var list = std.ArrayList(u32).init(std.testing.allocator);
    defer list.deinit();
    try std.testing.expectEqual(@as(usize, 0), list.items.len);
}
