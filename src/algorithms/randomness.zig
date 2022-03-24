const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("randomness/random_basics.zig"));
    testing.refAllDecls(@import("randomness/random_range.zig"));
    testing.refAllDecls(@import("randomness/random_distributions.zig"));
}
