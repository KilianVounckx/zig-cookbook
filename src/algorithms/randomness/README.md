## Basics

Generate random values with the help of random number generators (rng). In zig, you have to be
specific about which rng to use. There are however good defaults. Rng's in zig use a pattern
for interfaces which is common in the standard library. It uses fat pointers behind the scenes. It
is definitely worth reading the
[source](https://github.com/ziglang/zig/blob/master/lib/std/rand.zig).

Integers are uniformly distributed over the range of the type. Floats are uniformly distributed from
0 (included) to 1 (excluded). Bools have an equal change to be true or false.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./basics.zig) -->
<!-- The below code snippet is automatically added from ./basics.zig -->
```zig
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
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Numbers in a range

Zig provides functions for generating random integers within a range. Each function has a normal
and a biased version. The normal version is uniformly distributed, but does not run in constant
time. The biased version runs in constant time, but is not uniform. For most use cases however,
the biased versions are uniform enough. There are also the 'atMost' variants, which have an
inclusive upper bound.

For floating point numbers, zig does not provide range functions. However, it is really easy to
implement one yourself.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./range.zig) -->
<!-- The below code snippet is automatically added from ./range.zig -->
```zig
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
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Distributions

Besides uniform distributions, zig provides normal and exponential distribution functions.
Normal distributions have a default mean of 0, and standard deviation of 1. To use other mean
and deviation, multiply by the standard deviation, then add the mean.
Exponential distributions have default rate parameter of 1. To use a different rate parameter,
divide by it. For other distributions, you have to provide your own implementation.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./distributions.zig) -->
<!-- The below code snippet is automatically added from ./distributions.zig -->
```zig
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
```
<!-- MARKDOWN-AUTO-DOCS:END -->

## Shuffle

The last function in the Random interface is shuffle. This function takes a slice, and shuffles
it in place to a random permutation.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./shuffle.zig) -->
<!-- The below code snippet is automatically added from ./shuffle.zig -->
```zig
const std = @import("std");

test "shuffle" {
    var rng = std.rand.DefaultPrng.init(0);
    const random = rng.random();

    var list = [_]u32{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    random.shuffle(u32, &list);
}
```
<!-- MARKDOWN-AUTO-DOCS:END -->
