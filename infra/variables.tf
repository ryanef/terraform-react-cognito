variable "aws_region" {
    default = "us-east-1"
    type = string
}

variable "environment" {
  default = "dev"
  type = string
  description = "used for naming and tagging resources"
}

variable "name" {
    default = "cogneato"
    type = string
    description = "used for naming and tagging resources"
}


