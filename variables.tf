variable "vpc_cidr" {
  type        = string
  default     = "10.20.0.0/16"
  description = "Choose cidr for vpc"
}

variable "region" {
  description = "Choose region for your stack"
  type        = string
  default     = "us-east-1"
}

variable "nat_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-0c2b8ca1dad447f8a"
    us-east-2 = "ami-0443305dabd4be2bc"
  }
}