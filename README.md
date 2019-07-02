# Dockerfile for libra

## setup

```
git clone git@github.com:matsubo/libra-docker.git
cd libra-docker
docker build -t libra-docker . 
docker run -it libra-docker /libra/scripts/cli/start_cli_testnet.sh
```

## Issues

- `./scripts/dev_setup.sh` does not finish as expected.


