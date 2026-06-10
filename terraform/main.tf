terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/user/1000/podman/podman.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:${var.nginx_version}"
}

resource "docker_image" "vulnerables-web-dvwa" {
  name = "vulnerables/web-dvwa:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "gitops-lab-nginx"
  ports {
    internal = 80
    external = var.external_port
  }
}

resource "docker_container" "vulnerables-web-dvwa" {
  image = docker_image.vulnerables-web-dvwa.name
  name  = "gitops-lab-vulnerables-web-dvwa"
  ports {
    internal = 80
    external = var.external_port_2
  }
}
