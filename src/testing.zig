const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("testing/basics.zig"));
}
