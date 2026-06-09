output "container_name" {
  description = "The name of the Nginx container"
  value = docker_container.nginx.name
}

output "container_port" {
  description = "The port the Nginx container is listening on"
  value = docker_container.nginx.ports[0].external
}
