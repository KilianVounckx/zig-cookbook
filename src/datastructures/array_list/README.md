# ArrayList

An ArrayList is the most common data structure in computer science. In other languages is might be
known as a Vector, a List, an Array, or other names. It represents a sorted and growable list of items,
stored contiguously in memory.


## ArrayList Initialization

To initialize an ArrayList, you need to pass an allocator. Otherwise, zig does not know where to
get memory to store the list. In all the examples, the testing allocator is used. The one you want
to use depends on the use case. You might want to read
[the section in the docs on choosing an allocator](https://ziglang.org/documentation/master/#Choosing-an-Allocator)
if you don't know which one to use.

An ArrayList can be initialized with a given capacity. This will reserve memory for growing the list
later. The length of the list will still be zero, but the underlying memory will be greater. You
can use this to allocate the list beforehand and save a lot of small allocations later on. However,
if you are certain you don't have to grow or shrink the list afterwards, you should just allocate
a regular slice.

<!-- MARKDOWN-AUTO-DOCS:START (CODE:src=./init.zig) -->