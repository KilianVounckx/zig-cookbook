const std = @import("std");

pub fn main() !void {
    const rng = std.rand.DefaultPrng.init(0);
    defer rng.deinit();
    const random = rng.random();

    const n1 = random.int(u8);
    const n2 = random.int(u16);

    std.debug.print("Random u8: {}\n", .{n1});
    std.debug.print("Random u16: {}\n", .{n2});
    std.debug.print("Random u32: {}\n", .{random.int(u32)});
    std.debug.print("Random i32: {}\n", .{random.int(i32)});
    std.debug.print("Random float: {}\n", .{random.float(f64)});
    std.debug.print("Random bool: {}\n", .{random.boolean()});
}
