FROM ubuntu:18.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . doc/
WORKDIR doc/

RUN cmake .
RUN make

ENV LOG_PATH /home/raz/logs/log.txt

VOLUME /home/raz/logs

ENTRYPOINT ./solver

# на моих системах принт отказывается полностью собираться, поэтому я собрал solver в Docker-container, а CMake собирает для всего  (солвер и принт)
# а логи у меня не появляются нигде 
#FROM ubuntu:18.04
#
#RUN apt update
#RUN apt install -yy gcc g++ cmake
#
#COPY . doc/
#WORKDIR doc/
#
#COPY . print/
#WORKDIR print
#
#
#RUN cmake .
#RUN make
#
#ENV LOG_PATH /home/logs/log.txt
#VOLUME /home/logs
#WORKDIR _install/bin
#ENTRYPOINT ./demo
#
#RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
#RUN cmake --build _build
#RUN cmake --build _build --target install
#
#VOLUME /home/logs
#
#ENTRYPOINT ./solver
