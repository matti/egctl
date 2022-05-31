# egctl docker wrapper

```bash
$ docker run -it ghcr.io/matti/egctl 192.168.56.65
socket 1 - off
socket 2 - off
socket 3 - off
socket 4 - off
```

```bash
$ docker run -it ghcr.io/matti/egctl 192.168.56.65 on off left left
socket 1 - on
socket 2 - off
socket 3 - <whatever it was>
socket 4 - <whatever it was>
```
