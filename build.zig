const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("zig-cookbook", "src/test.zig");
    lib.setBuildMode(mode);
    lib.install();

    const main_tests = b.addTest("src/test.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run cookbook tests");
    test_step.dependOn(&main_tests.step);
}
