variable "vpc_cidr_block" {
  default = ""
}

variable "m_batch" {}

variable "m_private_subnet_cidr_blocks" {
  type        = list(any)
  default     = [""]
  description = "list of CIDR for Private subnets."
}

variable "m_public_subnet_cidr_blocks" {
  type        = list(any)
  default     = [""]
  description = "list of CIDR for Public subnets."
}

variable "m_availability_zones" {
  default     = ["ap-south-1a"]
  type        = list(any)
  description = "List of availability zones"
}

