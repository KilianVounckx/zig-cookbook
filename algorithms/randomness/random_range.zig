const std = @import("std");

pub fn main() !void {
    const rng = std.rand.DefaultPrng.init(0);
    defer rng.deinit();
    const random = rng.random();

    std.debug.print("[0..10): {}\n", .{random.uintLessThan(u32, 10)});
    std.debug.print("[10..20): {}\n", .{random.intRangeLessThan(u32, 10, 20)});
    std.debug.print("[-10..10): {}\n", .{random.intRangeLessThan(i32, -10, 20)});

    std.debug.print("[0.0 .. 10.0): {}\n", .{floatRange(random, f64, 0, 10)});
    std.debug.print("[-10.0 .. 10.0): {}\n", .{floatRange(random, f64, -10, 10)});
}

fn floatRange(random: std.rand.Random, comptime T: type, min: T, max: T) T {
    min + random.float(max - min);
}
