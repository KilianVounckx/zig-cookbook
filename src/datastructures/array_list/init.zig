const std = @import("std");

test "Empty initialization" {
    var list = std.ArrayList(u32).init(std.testing.allocator);
    defer list.deinit();
    try std.testing.expectEqual(@as(usize, 0), list.items.len);
    try std.testing.expectEqual(@as(usize, 0), list.capacity);
}

test "Initialization with capacity" {
    var list = try std.ArrayList(u32).initCapacity(std.testing.allocator, 42);
    defer list.deinit();
    try std.testing.expectEqual(@as(usize, 0), list.items.len);
    try std.testing.expectEqual(@as(usize, 42), list.capacity);
}
