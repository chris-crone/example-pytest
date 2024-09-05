FROM python:3.12-alpine AS base
WORKDIR /app

FROM base AS testbase
# Use a cache for pip so that we don't need to redownload all the dependencies
# if we update one.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install -r requirements.txt

FROM testbase AS test
# Use a cache for pytest so that between runs we cache test run state. This
# allows us to run only the tests that failed last time using the
# `--last-failed` flag.
RUN --mount=type=cache,target=/pytest_cache \
    --mount=type=bind,target=. \
    py.test -o cache_dir=/pytest_cache -v --last-failed

# Utility to print out the cache state.
# Run `docker buildx bake showcache --progress plain` to see it.
FROM testbase AS showcache
RUN --mount=type=cache,target=/pytest_cache \
    --mount=type=bind,target=. \
    py.test -o cache_dir=/pytest_cache -v --cache-show

FROM alpine AS clearcache
RUN --mount=type=cache,target=/pytest_cache,sharing=locked \
    rm -rf /pytest_cache/*

FROM base AS run
COPY math.py .
COPY main.py .
ENTRYPOINT [ "python3", "/app/main.py" ]
