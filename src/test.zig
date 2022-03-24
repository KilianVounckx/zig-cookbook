const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("algorithms.zig"));
    testing.refAllDecls(@import("testing.zig"));
}
