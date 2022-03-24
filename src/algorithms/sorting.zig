const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("sorting/sorting.zig"));
    testing.refAllDecls(@import("sorting/context.zig"));
}
