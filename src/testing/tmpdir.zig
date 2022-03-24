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
