variable "project" {
  default     = "jenkins-server"
  description = "desplegando un servidor de jenkins"
}


variable "region" {
  default     = "us-east-1"
  description = "project region"
}

variable "access_key" {
  default = ""
  description = "access key"
}

variable "secret_key" {
  default = ""
  description = "secret key"
}

variable "instance_ami" {
  default = "ami-0712a6105917b9a3c"
}

variable "instance_type" {
  default = "t2.micro"
}

locals {
  subnet_count = length(data.aws_availability_zones.available.names)
}

variable "vpc_cidr" {
  default = "172.32.0.0/16"
  description = "cidr block to create vpc"
}

locals {
  common_tags = {
    project     = var.project
  }
}