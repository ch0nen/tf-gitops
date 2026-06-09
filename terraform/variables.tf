variable "container_name" {
  description = "Name of container"
  type = string
  default = "gitops-nginx"
}

variable "external_port" {
  description = "External port"
  type = number
  default = 9090
}

variable "nginx_version" {
  description = "Version of nginx"
  type = string
  default = "latest"
}
