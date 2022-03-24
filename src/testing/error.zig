const std = @import("std");

pub fn foo(x: u32) !void {
    if (x < 5) return error.Foo;
    if (x < 10) return error.Bar;
}

test "expectError" {
    try std.testing.expectError(error.Foo, foo(2));
    try std.testing.expectError(error.Bar, foo(8));
}
