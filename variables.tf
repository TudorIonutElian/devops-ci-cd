variable "startsWith" {
  description = "The prefix of the AMI name"
  type = string
  default = "al2023-ami"
}

variable "endsWith" {
  description = "The suffix of the AMI name"
  type = string
  default = "x86_64"
}

variable "architecture" {
  description = "The architecture of the AMI"
  type = string
  default = "x86_64"
}

variable "teamcity_instance_type" {
  description = "The instance type for the Teamcity EC2 instance"
  type = string
  default = "t2.medium"
}

variable "teamcity_key_name" {
  description = "The key pair name for the Teamcity EC2 instance"
  type = string
  default = "teamcity_key_pair"
}