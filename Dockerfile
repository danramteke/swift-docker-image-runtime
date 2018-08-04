FROM ibmcom/swift-ubuntu-xenial-runtime:latest

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  build-essential \
  clang-3.8 \
  cpp-4.8 \
  dirmngr \
  gcc-4.8 \
  gnupg2 \
  libatomic1 \
  libbsd-dev \
  libbsd0 \
  libcurl4-openssl-dev \
  libicu-dev \
  libicu55 \
  libpq-dev \
  libsqlite3-dev \
  libxml2 \
  pkg-config \
  tzdata \
  zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
  