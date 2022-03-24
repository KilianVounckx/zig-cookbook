const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("testing/basics.zig"));
    testing.refAllDecls(@import("testing/strings.zig"));
    testing.refAllDecls(@import("testing/fmt.zig"));
    testing.refAllDecls(@import("testing/error.zig"));
    testing.refAllDecls(@import("testing/approx.zig"));
    testing.refAllDecls(@import("testing/tmpdir.zig"));
}
