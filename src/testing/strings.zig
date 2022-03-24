const std = @import("std");

test "strings" {
    try std.testing.expectEqualStrings("Hello", "Hello");
    try std.testing.expectStringStartsWith("Hello", "Hel");
    try std.testing.expectStringEndsWith("Hello", "llo");
}
