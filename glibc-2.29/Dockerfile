FROM ubuntu:19.04

# Apt packages
RUN dpkg --add-architecture i386 && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy \
    git nasm  python \
    build-essential \
    python-dev python-pip python-setuptools \
    libc6-dbg \
    libc6-dbg:i386 \
    gcc-multilib \
    gdb \
    gcc \
    wget \
    curl \
    zsh \
    ltrace \
    strace \
    cmake \
    radare2 \
    python-capstone \
    socat \
    netcat \
    ruby \
    vim \
    tmux \
    libc6:i386 libncurses5:i386 libstdc++6:i386 \
    lxterminal && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
# python/ruby packages & gdb-plugin
RUN pip install --no-cache-dir pwntools && \
    gem install one_gadget && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# git installaing package
RUN cd ~/ && \
    git clone https://github.com/pwndbg/pwndbg.git && \
    cd ~/pwndbg/ && ./setup.sh && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN chsh -s /bin/zsh
RUN cd ~/ && \
    git clone https://github.com/chen-robert/dot-files && \
    cd ./dot-files && \
    cp .vimrc ../ && \
    cd .. && rm -rf dot-files

ENV LANG C.UTF-8

VOLUME ["/pwn"]
WORKDIR /pwn

CMD ["/bin/zsh"]
