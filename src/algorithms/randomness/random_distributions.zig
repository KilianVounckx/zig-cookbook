const std = @import("std");
const testing = std.testing;

test "distributions" {
    var rng = std.rand.DefaultPrng.init(0);
    const random = rng.random();

    { // normal(0, 1)
        const f = random.floatNorm(f64);
        _ = f;
    }

    { // normal(2, 5)
        const f = random.floatNorm(f64) * 5.0 + 2.0;
        _ = f;
    }

    { // exp(1)
        const f = random.floatExp(f64);
        _ = f;
    }

    { // exp(3)
        const f = random.floatExp(f64) / 3.0;
        _ = f;
    }
}
