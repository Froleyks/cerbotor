FROM ubuntu:24.04

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends cmake make g++ git meson m4 ca-certificates && \
  apt-get clean

COPY . /cerbotor
WORKDIR /cerbotor
RUN \
  rm -rf build && \
  cmake -DCMAKE_BUILD_TYPE=Release -DTOOLS=ON -B build && \
  make -j$(nproc) -C build

ENTRYPOINT ["/cerbotor/build/bin/check"]
