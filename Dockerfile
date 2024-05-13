# Use a base image with a C++ development environment
FROM gcc:latest

# Set the working directory inside the container
WORKDIR /app
RUN mkdir boost
COPY ./boost boost
ENV BOOST_ROOT="/app/boost"
ENV Boost_INCLUDE_DIR="/app/boost"

# Install necessary dependencies
RUN apt-get update
RUN apt-get -y install lsb-release wget software-properties-common gnupg
RUN wget https://github.com/Kitware/CMake/releases/download/v3.29.2/cmake-3.29.2-linux-x86_64.sh
RUN chmod +x cmake-3.29.2-linux-x86_64.sh
RUN mkdir cmake
RUN ./cmake-3.29.2-linux-x86_64.sh --skip-license --prefix=cmake
RUN echo "deb http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-18 main \n deb-src http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-18 main" >> /etc/apt/sources.list
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 18 all
RUN apt-get install -y libssl-dev libcurl4-gnutls-dev
RUN apt-get install -y ninja-build
RUN apt-get install -y libpq-dev
RUN apt-get install -y openssl
