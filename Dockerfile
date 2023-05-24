ARG FROM_IMAGE
FROM ${FROM_IMAGE}


RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y --no-install-recommends ninja-build build-essential cmake libopenblas-dev

COPY --link . /llama.cpp
RUN mkdir /llama.cpp/build
WORKDIR /llama.cpp/build
ARG CMAKE_ARGS=
RUN cmake .. ${CMAKE_ARGS}
RUN cmake --build . --config Release

WORKDIR /llama.cpp/build/bin
ENV PATH="PATH=$PATH:/llama.cpp/build/bin"
