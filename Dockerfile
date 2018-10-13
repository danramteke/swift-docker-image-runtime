FROM ubuntu:18.04

ENV SWIFT_TAR_URL https://swift.org/builds/swift-4.2-release/ubuntu1804/swift-4.2-RELEASE/swift-4.2-RELEASE-ubuntu18.04.tar.gz
ENV SWIFT_TAR_FILE swift-4.2-RELEASE-ubuntu18.04.tar.gz

ENV WORK_DIR /
WORKDIR ${WORK_DIR}

RUN apt-get update && apt-get dist-upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  pkg-config \
  gnupg2 \
  dirmngr \
  gnupg2 \
  libatomic1 \
  libbsd-dev \
  libcurl4-openssl-dev \
  libicu-dev \
  libsqlite3-dev \
  libxml2 \
  wget \
  libicu60 \
  libbsd0 \
  libbsd-dev \
  libatomic1 \
  openssl \
  tzdata \
  zlib1g-dev \
  && apt-get clean 

RUN wget $SWIFT_TAR_URL $SWIFT_TAR_URL.sig \
  && gpg --keyserver hkp://p80.pool.sks-keyservers.net:80  \
      --recv-keys \
      '7463 A81A 4B2E EA1B 551F  FBCF D441 C977 412B 37AD' \
      '1BE1 E29A 084C B305 F397  D62A 9F59 7F4D 21A5 6D5F' \
      'A3BA FD35 56A5 9079 C068  94BD 63BC 1CFE 91D3 06C6' \
      '5E4D F843 FB06 5D7F 7E24  FBA2 EF54 30F0 71E1 B235' \
      '8513 444E 2DA3 6B7C 1659  AF4D 7638 F1FB 2B2B 08C4' \
  && gpg --keyserver hkp://p80.pool.sks-keyservers.net:80  --refresh-keys  \
  && gpg --verify $SWIFT_TAR_FILE.sig \
  && tar xzf $SWIFT_TAR_FILE --strip-components=1 \
  && rm $SWIFT_TAR_FILE \
  && rm $SWIFT_TAR_FILE.sig \
  && find /usr/lib/swift/linux -type f ! -name '*.so' -delete \
  && rm -rf /usr/lib/swift/linux/*/ \
  && chmod -R go+r /usr/lib/swift \
  && apt-get remove -y gcc cpp sgml-base icu-devtools gcc-4.8 cpp-4.8 libc6-dev binutils manpages-dev manpages wget pkg-config perl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /bin/bash
