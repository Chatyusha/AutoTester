# Auto Tester

## Usage

```sh
git clone https://github.com/Chatyusha/AutoTester.git
cd AutoTester/contents/LANGUAGE(example, C,Python)/
./run.sh [options]
```

If you see a message like `permission denied: ./run.sh`, run `chmod 755 ./run.sh`.

## Options

- --is-dockerfile  : Build Docker container from Dockerfile whose path is `./Dockerfile`.

- --is-dockerfile -f \<FILEPATH\>  : Build Docker container from Dockerfile whose path is `<FILEPATH>`.

- --file-name \<FILENAME\>  : Compile or run `<FILENAME>`

- -h , --help  : Show help

## Docker images

- gcc (https://hub.docker.com/repository/docker/unicatflower/gcc)
- python3 (https://hub.docker.com/r/unicatflower/python3)
