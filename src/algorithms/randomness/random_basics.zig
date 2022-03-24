const std = @import("std");

test "basics" {
    var rng = std.rand.DefaultPrng.init(0);
    const random = rng.random();

    { // integers
        _ = random.int(u8);
        _ = random.int(u16);
        _ = random.int(u32);
        _ = random.int(i32);
    }

    { // floats
        _ = random.float(f32);
        _ = random.float(f64);
    }

    { // boolean
        _ = random.boolean();
    }

    { // enums
        const Foo = enum {
            foo,
            bar,
            baz,
        };

        _ = random.enumValue(Foo);
    }
}
