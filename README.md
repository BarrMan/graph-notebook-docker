# Graph Noatebook Docker Image

Dockerfile based on https://github.com/aws/graph-notebook

Docker image is available in https://hub.docker.com/repository/docker/barrman/graph-notebook

`docker pull barrman/graph-notebook:latest`

### Using docker-compose
```
graph-notebook:
    image: barrman/graph-notebook:latest
    ports:
      - "8888:8888"
    volumes:
      - {pathToIpynbFiles}:/root/notebook/host
    depends_on:
      - gremlin
```

You can also use it via command line to mount the local ~/notebook folder within the docker image:
`docker run -p 8888:8888 -v ~/notebook:/root/notebook barrman/graph-notebook:latest`
