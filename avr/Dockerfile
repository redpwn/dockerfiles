FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python-dev \
    picocom git gdb gcc-avr binutils-avr gdb-avr avr-libc avrdude \
    make gcc freeglut3-dev libelf-dev libncurses5-dev libncursesw5-dev \
    simavr \
    radare2 \
    tmux vim wget 

WORKDIR /src

RUN git clone https://github.com/buserror/simavr

ENV TERM xterm-256color

# the build fails midway through but it's ok
RUN cd simavr && (make || echo 0)

ENV SIMAVR_UART_XTERM=1

VOLUME ["/pwn"]
WORKDIR /pwn

CMD ["/bin/bash"]
