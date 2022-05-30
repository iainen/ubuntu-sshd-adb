# ubuntu-sshd-adb
Dockerized SSH and adb service

## Image tags

- iainen/ubuntu-sshd-adb:16.04 (xenial)

Config:

  - `PermitRootLogin yes`
  - `UsePAM no`
  - exposed port 22
  - default command: `/usr/sbin/sshd -D`
  - root password: `root`

## Run example

```bash
$ sudo docker run -d -P --name test_sshd iainen/ubuntu-sshd-adb:16.04
$ sudo docker port test_sshd 22
  0.0.0.0:49154

$ ssh root@localhost -p 49154
# The password is `root`
root@test_sshd $
```

## Security
Change the root password:  
```
docker exec -ti test_sshd passwd
```