FROM ubuntu:16.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy \
    git nasm  python \
    build-essential \
    python-dev python-pip python-setuptools \
    libc6-dbg \
    gdb gdb-multiarch\
    gcc gcc-5-mipsel-linux-gnu \
    wget \
    curl \
    zsh \
    ltrace \
    strace \
    cmake \
    python-capstone \
    socat \
    netcat \
    ruby \
    emacs \
    tmux \
    binfmt* \
    libc6-mipsel-cross \
    qemu qemu-user qemu-user-static \
    lxterminal && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN pip install --no-cache-dir pwntools && \
    gem install one_gadget && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN mkdir /etc/qemu-binfmt
RUN ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel

RUN chsh -s /bin/zsh
ENV LANG C.UTF-8

VOLUME ["/pwn"]
WORKDIR /pwn
CMD ["/bin/zsh"]
