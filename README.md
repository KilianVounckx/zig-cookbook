# Zig Cookbook

A collection of [zig](https://www.ziglang.org") samples that demonstrate how to use the standard
library. The format is based on [Rust Cookbook](https://rust-lang-nursery.github.io/rust-cookbook/).

## About

This repository contains samples which demonstrate how to use the zig standard library. The
samples are grouped to make it easier to navigate. I try to keep the repo up-to-date with the latest
zig release.

All the samples are made with tests. This shows how to use them in real code, and makes it possible
to check if the examples work on your zig build. If you don't understand how tests work in zig, I
suggest first going through the [testing](src/testing) samples. If not, just skip those. All other
sample groups are not written in any specific order. I try to write them so they can be referenced
in any order.

The samples about randomness don't contain proper tests, because the output is, well,
random. It uses pseudo random number generators, so in principle, they could be tested. However,
I felt this didn't add much value.

This repository assumes you have basic knowledge of zig (at least skimmed through the
[docs](https://ziglang.org/documentation/master/)).

## Contents

- [Testing](src/testing)
- Algorithms
    - [Randomness](src/algorithms/randomness)
    - [Sorting](src/algorithms/sorting)
- Data Structures
    - [Array List](src/datastructures/array_list)


### Notes

- This repo is far from completed. Arguably it will never be completed, but at the moment, it is
  almost empty. I try to add a chapter when I have the time, but all help is appreciated.
  Just send a pull request.

- Because the zig standard library is not finalized, and will not be for a while (current focus is
  on the self hosted compiler), these samples are prone to change.

- If anyone knows how to automate markdown-auto-docs so I don't have to manually enter every
  README file, let me know. An alternative is also welcome.
