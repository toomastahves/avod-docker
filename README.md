# Build image
```
docker build -t avod_image .
```

# Run container and keep alive
```
docker run -v /home/tom/Projects/avod-docker:/avod-docker -t -d --name avod_container avod_image
```

# Enter container command line
```
docker exec -it avod_container bash
```

# Remove container
```
docker rm -f $(docker ps -a | grep 'avod_container')
```
