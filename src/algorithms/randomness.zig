const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("randomness/basics.zig"));
    testing.refAllDecls(@import("randomness/range.zig"));
    testing.refAllDecls(@import("randomness/distributions.zig"));
}
