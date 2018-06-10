FROM ibmcom/swift-ubuntu-xenial-runtime

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  pkg-config \
  cpp-4.8 \
  gcc-4.8 \
  gnupg2 \
  dirmngr \
  libbsd-dev \
  libcurl4-openssl-dev \
  libicu-dev \
  libpq-dev \
  libsqlite3-dev \
  libxml2 \
  wget \
  zlib1g-dev \
  libicu55 \
  libicu52 \
  libbsd0 \
  libatomic1 \
  && apt-get clean 