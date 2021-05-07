# Graph Noatebook Docker Image

Dockerfile based on https://github.com/aws/graph-notebook

Docker image is available in https://hub.docker.com/repository/docker/barrman/graph-notebook

`docker pull barrman/graph-notebook:latest`

### Using docker-compose
Initially, graph-notebook docker image comes with `GraphVisualization.ipynb` starter notebook that comes with a working example of connecting to gremlin and executing a simple gremlin command.

In order to add custom notebooks, you may use the volumes and override/add to `/root/notebook/destination/dir/`.
```
graph-notebook:
    image: barrman/graph-notebook:latest
    ports:
      - "8888:8888"
    volumes:
      - {pathToIpynbFiles}:/root/notebook/destination/dir/
    depends_on:
      - gremlin
```