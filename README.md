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
      - {pathToIpynbFiles}:/root/notebook/destination/dir/GraphVisualization.ipynb
    depends_on:
      - gremlin
```