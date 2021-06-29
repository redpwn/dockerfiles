FROM DOCKER_FROM_LABEL 

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qy \
  python3 python3-pip python3-dev \
  git \
  libssl-dev libffi-dev build-essential \
  gdb \
  wget curl tmux vim \
  zsh \
  ruby \
  gcc && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN python3 -m pip install --no-cache-dir --upgrade pip pwntools && \
  gem install one_gadget && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh 

RUN wget -q -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
RUN chsh -s /bin/zsh

RUN cd ~/ && \
    git clone https://github.com/chen-robert/dot-files && \
    cd ./dot-files && \
    cp .vimrc ../ && \
    cp .tmux.conf ../ && \
    cp .zshrc ../ && \
    cd .. && rm -rf dot-files

ENV LANG C.UTF-8

VOLUME ["/pwn"]
WORKDIR /pwn

CMD ["/bin/zsh"]
