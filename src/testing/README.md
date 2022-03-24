## Basics

The std.testing namespace exports a lot of functions to be used in tests. All examples in this
repository use tests, so there are a lot of examples. The ones here are specifically to show
the test functions.

There are a lot of expect functions. These test if some assumption is correct. The basic expect
function checks if a bool is true. ExpectEqual tests if two variables are the same.
ExpectEqualSlices checks if two slices of a given type are the same, and expectEqualSentinel checks
if two sentinel terminated slices are the same. This last function also checks that they have the
correct sentinel. When using an expectEqualFoo function which compares two types, the first
argument is always the expected value, and the second the actual value. If you get this wrong,
the same tests will fail, or succeed. However, the messages on fail will be confusing if you get
the order wrong.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./basics.zig) -->
<!-- The below code snippet is automatically added from ./basics.zig -->
```zig
const std = @import("std");

test "basics" {
    try std.testing.expect(true);
    try std.testing.expectEqual(@as(u32, 42), 42);
    try std.testing.expectEqualSlices(u32, &.{ 1, 2, 3, 4 }, &.{ 1, 2, 3, 4 });
    try std.testing.expectEqualSentinel(u32, 0, &.{ 1, 2, 3 }, &.{ 1, 2, 3 });
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Strings

There are three functions for testing string properties. These are expectEqualStrings,
expectStringStartsWith, and expectStringEndsWith. Their names are pretty self explanatory.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./strings.zig) -->
<!-- The below code snippet is automatically added from ./strings.zig -->
```zig
const std = @import("std");

test "strings" {
    try std.testing.expectEqualStrings("Hello", "Hello");
    try std.testing.expectStringStartsWith("Hello", "Hel");
    try std.testing.expectStringEndsWith("Hello", "llo");
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Fmt

Whenever you want to test if some writer formatting works as expected, you can use expectFmt.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./fmt.zig) -->
<!-- The below code snippet is automatically added from ./fmt.zig -->
```zig
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
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Error

You can test whether a function returned an error with the expectError function.

## Approx

Floating point numbers are almost never exact. To do tests to compare floating point numbers, use
expectApproxEqRel and expectApproxEqAbs.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./fmt.zig) -->
<!-- The below code snippet is automatically added from ./fmt.zig -->
```zig
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
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## TmpDir

When you have to test some file IO, you often don't want to permanently create a file. For this
reason there are the TmpDir type and the tmpDir function. These create a temporary directory
somewhere in the zig-cache directory. The caller should call cleanup, probably in a defer statement,
to remove the directory afterwards. This prevents cluttering the zig-cache with new directories
and files.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./tmpdir.zig) -->
<!-- The below code snippet is automatically added from ./tmpdir.zig -->
```zig
const std = @import("std");

test "tmpDir" {
    var dir = std.testing.tmpDir(.{});
    defer dir.cleanup();

    {
        const file = try dir.dir.createFile("file.txt", .{});
        defer file.close();
        try file.writer().writeAll("Hello, World!");
    }

    {
        const file = try dir.dir.openFile("file.txt", .{});
        defer file.close();
        var buffer: ["Hello, World!".len]u8 = undefined;
        _ = try file.reader().readAll(&buffer);
        try std.testing.expectEqualStrings("Hello, World!", &buffer);
    }
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## RefAllDecls

The last function is a convenience function. Often in zig, a struct defines a bunch of other
structs. The tests in these inner structs aren't run automatically, because of zig's lazy analysis.
To run them their are two options. You could reference them in a test with something like
```zig
struct Foo {
    test "someTest" {}
}

test {
    _ = Foo;
}
```
If you have to do this for every struct declaration however this gets tedious. This is the use case
for refAllDecls. All tests in this directory are referenced using it. Keep in mind, only public
inner structs are referenced.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./refalldecls.zig) -->
<!-- The below code snippet is automatically added from ./refalldecls.zig -->
```zig
const std = @import("std");

pub const basics = @import("basics.zig");
pub const strings = @import("strings.zig");
pub const fmt = @import("fmt.zig");
pub const approx = @import("approx.zig");
pub const err = @import("error.zig");
pub const tmpdir = @import("tmpdir.zig");

test {
    std.testing.refAllDecls(@This());
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->
