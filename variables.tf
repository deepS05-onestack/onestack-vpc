variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "backend_subnet_cidr" {
  description = "CIDR block for the backend private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  description = "CIDR block for the database private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "backend_az" {
  description = "Availability Zone for the backend subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "db_az" {
  description = "Availability Zone for the database subnet"
  type        = string
  default     = "ap-south-1b"
}

variable "tags" {
  description = "Tags to apply to created resources"
  type        = map(string)
  default = {
    Project     = "onestack"
    Environment = "production"
  }
}
