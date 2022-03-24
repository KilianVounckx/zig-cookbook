const testing = @import("std").testing;

test {
    _ = @import("randomness/basics.zig");
    _ = @import("randomness/range.zig");
    _ = @import("randomness/distributions.zig");
}
