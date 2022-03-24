const testing = @import("std").testing;

test {
    testing.refAllDecls(@import("sorting/sorting.zig"));
    testing.refAllDecls(@import("sorting/context.zig"));
    testing.refAllDecls(@import("sorting/sort_context.zig"));
    testing.refAllDecls(@import("sorting/binary_search.zig"));
}
