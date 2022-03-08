## How to run this?
on RHEL-based system
```
yum groupinstall 'Container Management' -y
```

after clonning the repo
```
cd podman-monerod
buildah build -f Dockerfile -t monerod .
```

```
podman run --rm -v /var/monero-blockchain:/home/monero/.bitmonero \
--entrypoint chown --user root localhost/monerod monerod:monerod -R /home/monero/.bitmonero
```

```
podman run -p18089:18089,18080:18080 --restart=always -v /var/monero-blockchain:/home/monerod/.bitmonero/ localhost/monerod
```
