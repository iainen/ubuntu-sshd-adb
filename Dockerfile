FROM rastasheep/ubuntu-sshd:16.04

RUN mkdir -m 0750 /root/.android
ADD files/insecure_shared_adbkey /root/.android/adbkey
ADD files/insecure_shared_adbkey.pub /root/.android/adbkey.pub

RUN apt-get update && \
    apt-get install -y android-sdk-platform-tools

# Expose default ADB port
EXPOSE 5037

# Hook up tini as the default init system for proper signal handling
ENTRYPOINT ["/sbin/tini", "--"]

# Start the server by default
CMD ["adb", "-a", "-P", "5037", "server", "nodaemon"]