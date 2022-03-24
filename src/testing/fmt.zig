const std = @import("std");

test "fmt primitives" {
    try std.testing.expectFmt("42", "{}", .{42});
    try std.testing.expectFmt("Hello", "{s}", .{"Hello"});
    try std.testing.expectFmt("{ 1, 2, 3 }", "{any}", .{[_]u32{ 1, 2, 3 }});
}

const Vec2 = struct {
    x: u32,
    y: u32,

    pub fn format(
        self: Vec2,
        comptime _: []const u8,
        _: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        try writer.print("Vec2({}, {})", .{ self.x, self.y });
    }
};

test "fmt custom" {
    try std.testing.expectFmt("Vec2(1, 2)", "{}", .{Vec2{ .x = 1, .y = 2 }});
}
