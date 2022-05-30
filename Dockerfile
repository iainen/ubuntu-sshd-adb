FROM rastasheep/ubuntu-sshd:16.04

RUN mkdir -m 0750 /root/.android
ADD files/insecure_shared_adbkey /root/.android/adbkey
ADD files/insecure_shared_adbkey.pub /root/.android/adbkey.pub

RUN sed -i s@/archive.ubuntu.com/@/mirrors.cloud.tencent.com/@g /etc/apt/sources.list && \
    sed -i s@/security.ubuntu.com/@/mirrors.cloud.tencent.com/@g /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y android-sdk-platform-tools

# Expose default ADB port
EXPOSE 5037

# Start the server by default
CMD ["adb", "-a", "-P", "5037", "server", "nodaemon"]