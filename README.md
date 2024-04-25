# Readme
Docker container to setup legacy Tensorflow application

# Build image
```
docker build -t avod_image .
```

# Run container and keep alive
```
docker run -t -d --name avod_container avod_image
```

# Enter container command line
```
docker exec -it avod_container bash
```

# Remove container
```
docker rm -f avod_container
```
