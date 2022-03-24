const std = @import("std");

test "range int" {
    var rng = std.rand.DefaultPrng.init(0);
    const random = rng.random();

    { // unsigned with upper (exclusive) bound
        const n = random.uintLessThan(u32, 10);
        try std.testing.expect(n < 10);
    }

    { // unsigned or signed with lower (inclusive) and upper (exclusive) bound
        const n1 = random.intRangeLessThan(u32, 10, 20);
        try std.testing.expect(10 <= n1 and n1 < 20);

        const n2 = random.intRangeLessThan(i32, -10, 10);
        try std.testing.expect(-10 <= n2 and n2 < 10);
    }
}

test "range float" {
    var rng = std.rand.DefaultPrng.init(0);
    const random = rng.random();

    const f1 = floatRange(random, f64, 0, 10);
    try std.testing.expect(0.0 <= f1 and f1 < 10.0);

    const f2 = floatRange(random, f64, -10, 10);
    try std.testing.expect(-10.0 <= f2 and f2 < 10.0);
}

fn floatRange(random: std.rand.Random, comptime T: type, min: T, max: T) T {
    return min + random.float(T) * (max - min);
}
