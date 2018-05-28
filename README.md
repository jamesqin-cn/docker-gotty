# Intro
Integrate gotty with docker inside docker, then you can do everything with docker throught webbrowser

## Usage

- docker inside docker mode
  ```
  docker run --privileged -d -p8080:8080 cnjamesqin/docker-gotty
  ```
  
- docker outside of docker mode
  ```
  docker run --privileged -d -p8080:8080 -v /var/run/docker.sock:/var/run/docker.sock cnjamesqin/docker-gotty
  ```
