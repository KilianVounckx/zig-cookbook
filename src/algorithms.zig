const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("algorithms/randomness.zig"));
    testing.refAllDecls(@import("algorithms/sorting.zig"));
}
