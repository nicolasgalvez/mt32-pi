FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y vim build-essential git cmake net-tools gdb clang wget make libglib2.0-dev zip unzip pip

# add cpio
RUN apt-get install cpio libncurses5 -y

# get gdown for grabbing the softsynth package
RUN pip install gdown

# get the toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-elf.tar.xz -O aarch.tar.gz

# unpack the archive to a neatly named target directory
RUN mkdir aarch64-none-elf && tar xfv aarch.tar.gz -C aarch64-none-elf --strip-components 1

# remove the archive
RUN rm aarch.tar.gz


# add the tools to the path
ENV PATH="/aarch64-none-elf/bin:${PATH}"

WORKDIR /work