# Zig Cookbook

A collection of [zig](https://www.ziglang.org") samples that demonstrate how to use the standard
library. The format is based on [Rust Cookbook](https://rust-lang-nursery.github.io/rust-cookbook/).

## About

This repository contains samples which demonstrate how to use the zig standard libary. The
samples are grouped to make it easier to navigate.

All the samples are made with tests. This shows how to use them in real code, and makes it possible
to check if the examples work on your zig build. I try to keep the repo up-to-date with the latest
zig release. The samples about randomness don't contain proper tests, because the output is, well,
random. It uses pseudo random number generators, so in principle, they could be tested. However,
I felt this didn't add much value.

## Contents

- Algorithms
    - [Randomness](src/algorithms/randomness)
    - [Sorting](src/algorithms/sorting)


### Notes

- This repo is far from completed. Arguably it will never be completed, but at the moment, it is
  almost empty. I try to add a chapter at least a few times a week, but all help is appreciated.
  Just send a pull request.

- Because the zig standard library is not finalized, and will not be for a while (current focus is
  on the self hosted compiler), these samples are prone to change.

- If anyone knows how to make markdown-auto-docs work with github actions, please let me know,
  because at the moment, code is not embedded in the readme's.
