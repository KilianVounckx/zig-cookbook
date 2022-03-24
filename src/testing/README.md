## Basics

The std.testing namespace exports a lot of functions to be used in tests. All examples in this
repository use tests, so there are a lot of examples. The ones here are specifically to show
the test functions.

There are a lot of expect functions. These test if some assumption is correct. The basic expect
function checks if a bool is true. ExpectEqual tests if two variables are the same.
ExpectEqualSlices checks if two slices of a given type are the same, and expectEqualSentinel checks
if two sentinel terminated slices are the same. This last function also checks that they have the
correct sentinel. When using an expectEqualFoo function which compares two types, the first
argument is always the expected value, and the second the actual value. If you get this wrong,
the same tests will fail, or succeed. However, the messages on fail will be confusing if you get
the order wrong.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./basics.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->

## Strings

There are three functions for testing string properties. These are expectEqualStrings,
expectStringStartsWith, and expectStringEndsWith. Their names are pretty self explanatory.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./strings.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->

## Fmt

Whenever you want to test if some writer formatting works as expected, you can use expectFmt.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./fmt.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->

## Error

You can test whether a function returned an error with the expectError function.

## Approx

Floating point numbers are almost never exact. Too do tests to compare floating point numbers, use
expectApproxEqRel and expectApproxEqAbs.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./fmt.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->
