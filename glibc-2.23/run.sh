docker run -it --cap-add sys_ptrace --security-opt seccomp=unconfined -v $(pwd):/pwn pwn:23
