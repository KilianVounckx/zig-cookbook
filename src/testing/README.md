## Basics

The std.testing namespace exports a lot of functions to be used in tests. All examples in this
repository use tests, so there are a lot of examples. The ones here are specifically to show
the test functions.

There are a lot of expect functions. These test if some assumption is correct. The basic expect
function checks if a bool is true. ExpectEqual tests if two variables are the same.
ExpectEqualSlices checks if two slices of a given type are the same, and expectEqualSentinel checks
if two sentinel terminated slices are the same. This last function also checks that they have the
correct sentinel.
