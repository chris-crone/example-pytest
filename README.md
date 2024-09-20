pytest using Docker Build
---

Running pytest unit tests inside Docker Build allows them to be isolated,
repeatable, and fast.
This repo is a very simple example showing how to do this.

# Prerequisites

It goes without saying but you need a recent version of Docker installed on your
system.
You do not need Python or any other dependencies!

# Running the tests

The tests can be run using `docker buildx bake testall`, optionally with
`--progress plain` to see the full output.

To only run tests that previously failed, run `docker buildx bake testfailed`,
optionally with `--progress plain` to see the full output.

# Clearing the test cache

To clear the test cache, run `docker buildx bake clean`.
