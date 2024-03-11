variable "region" {
  type = string
  description = "variable for my region"
  default = "eu-west-2"
}

variable "Project_name" {
  type = string
  description = "variable for my Project name"
  default = "GraceIT"
}

variable "vpc_cidr" {
  type = string
  description = "variable for my vpc cidr"
  default = "10.0.0.0/16"
}

variable "Public_subnet_cidr_1" {
  type = string
  description = "variable for my Public subnet cidr 1"
  default = "10.0.1.0/24"
}

variable "Public_subnet_cidr_2" {
  type = string
  description = "variable for my Public subnet cidr 2"
  default = "10.0.2.0/24"
}

variable "Private_subnet_cidr_1" {
  type = string
  description = "variable for my Private subnet cidr 1"
  default = "10.0.3.0/24"
}

variable "Private_subnet_cidr_2" {
  type = string
  description = "variable for my Private subnet cidr 2"
  default = "10.0.4.0/24"
}

variable "gateway_cidr" {
  type = string
  description = "variable for my gateway"
  default = "0.0.0.0/0"
}

variable "instance_tenancy" {
  type = bool
  description = "variable for my instance tenancy"
  default = "default"
}

variable "enable_dns_hostnames" {
  type = bool
  description = "variable for my enable dns hostnames"
  default = "true"
}
