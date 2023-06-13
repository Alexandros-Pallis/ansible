FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -m apallis
RUN echo "apallis:1234" | chpasswd
RUN usermod -aG sudo apallis

COPY . /home/apallis/ansible

RUN chown -R apallis:apallis /home/apallis/ansible

RUN apt update
RUN apt install -y \
    curl \
    software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install python3.8 -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o /home/apallis/get-pip.py
RUN apt install sudo

USER apallis
WORKDIR /home/apallis
