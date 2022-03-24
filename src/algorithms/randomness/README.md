## Random numbers

Generate random values with the help of random number generators (rng). In zig, you have to be
specific about which rng to use. There are however good defaults. Rng's in zig use a pattern
for interfaces which is common in the standard library. It uses fat pointers behind the scenes. It
is definitely worth reading the
[source](https://github.com/ziglang/zig/blob/master/lib/std/rand.zig).

Integers are uniformly distributed over the range of the type. Floats are uniformly distributed from
0 (included) to 1 (excluded). Bools have an equal change to be true or false.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./random_basics.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->

## Random numbers in a range

Zig provides functions for generating random integers within a range. Each function has a normal
and a biased version. The normal version is uniformly distributed, but does not run in constant
time. The biased version runs in constant time, but is not uniform. For most use cases however,
the biased versions are uniform enough. There are also the 'atMost' variants, which have an
inclusive upper bound.

For floating point numbers, zig does not provide range functions. However, it is really easy to
implement one yourself.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./random_range.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->

## Random distributions

Besides uniform distributions, zig provides normal and exponential distribution functions.
Normal distributions have a default mean of 0, and standard deviation of 1. To use other mean
and deviation, multiply by the standard deviation, then add the mean.
Exponential distributions have default rate parameter of 1. To use a different rate parameter,
divide by it. For other distributions, you have to provide your own implementation.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./random_distributions.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->
