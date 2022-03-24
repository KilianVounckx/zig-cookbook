const std = @import("std");

test "shuffle" {
    var rng = std.rand.DefaultPrng.init(0);
    const random = rng.random();

    var list = [_]u32{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    random.shuffle(u32, &list);
}
