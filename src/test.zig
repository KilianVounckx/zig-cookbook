const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("algorithms.zig"));
}
