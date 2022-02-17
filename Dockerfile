FROM rastasheep/ubuntu-sshd:16.04

RUN apt-get update

RUN apt-get install -y android-sdk-platform-tools