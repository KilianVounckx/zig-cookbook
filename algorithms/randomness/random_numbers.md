Generate random values with the help of random number generators (rng). In zig, you have to be
specific about which rng to use. There are however good defaults. Rng's in zig use a pattern
for interfaces which is common in the standard library. It uses fat pointers behind the scenes. It
is definitely worth reading the source.

Integers are uniformly distributed over the range of the type. Floats are uniformly distributed from
0 (included) to 1 (excluded). Bools have an equal change to be true or false.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./random_values.zig) -->
<!-- MARKDOWN-AUTO-DOCS:END -->
