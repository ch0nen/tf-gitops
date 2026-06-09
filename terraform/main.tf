terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 4.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/user/1000/podman/podman.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "gitops-lab-nginx"
  ports {
    internal = 80
    external = 8080
  }
}
