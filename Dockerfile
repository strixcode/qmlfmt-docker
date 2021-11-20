FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update \
 && apt install -y build-essential git cmake qtbase5-dev qtdeclarative5-dev

RUN git clone https://github.com/strixcode/qmlfmt.git
WORKDIR /qmlfmt
RUN git submodule update --init qt-creator

RUN mkdir /qmlfmt/build
WORKDIR /qmlfmt/build
RUN cmake ..
RUN make -j$(nproc)

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ=Europe/Warsaw
RUN apt update \
 && apt install -y libqt5network5 libqt5quickwidgets5 libqt5xml5 \
 && rm -rf /var/lib/{apt,dpkg,cache,log}

ENV PUID=1000
ENV PGID=1000

# create user
RUN groupadd --gid $PGID user \
 && useradd -s /bin/bash --uid $PUID --gid $PGID -m user

COPY --from=builder /qmlfmt/build/qmlfmt /usr/local/bin/
COPY su-user.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/su-user.sh", "/usr/local/bin/qmlfmt" ]
