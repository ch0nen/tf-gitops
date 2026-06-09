variable "container_name" {
  description = "Name of container"
  type = string
  default = "gitops-nginx"
}

variable "external_port" {
  description = "External port"
  type = number
  default = 8080
}
