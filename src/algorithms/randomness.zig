const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("randomness/random_numbers.zig"));
    testing.refAllDecls(@import("randomness/random_range.zig"));
    testing.refAllDecls(@import("randomness/random_distributions.zig"));
}
