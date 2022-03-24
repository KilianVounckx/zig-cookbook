const std = @import("std");

test "approx" {
    try std.testing.expectApproxEqAbs(@as(f64, 42.0), 42.04, 0.1);
    try std.testing.expectApproxEqRel(@as(f64, 42.0), 42.04, 0.1);
}
