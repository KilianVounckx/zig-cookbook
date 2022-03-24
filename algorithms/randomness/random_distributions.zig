const std = @import("std");

pub fn main() !void {
    const rng = std.rand.DefaultPrng.init(0);
    defer rng.deinit();
    const random = rng.random();

    std.debug.print("normal(0, 1): {}\n", .{random.floatNorm(f64)});
    std.debug.print("normal(2, 5): {}\n", .{random.floatNorm(f64) * 5.0 + 2.0});
    std.debug.print("exp(1): {}\n", .{random.floatExp(f64)});
    std.debug.print("exp(3): {}\n", .{random.floatExp(f64) / 3.0});
}
