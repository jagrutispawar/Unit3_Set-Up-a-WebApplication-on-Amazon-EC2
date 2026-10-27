variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Resource name prefix"
  type        = string
  default     = "my-web-server"
}

variable "instance_type" {
  description = "EC2 instance type supported in the selected region/account"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair in this region"
  type        = string
}

variable "my_ip_cidr" {
  description = "Your current public IPv4 address in CIDR notation, e.g. 203.0.113.10/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip_cidr, 0)) && can(regex("/32$", var.my_ip_cidr))
    error_message = "Set my_ip_cidr to a single IPv4 address with /32, e.g. 198.51.100.25/32."
  }
}

variable "site_title" {
  description = "Browser tab title"
  type        = string
  default     = "My EC2 Web App"
}

variable "site_name" {
  description = "Name displayed on the page"
  type        = string
  default     = "YOUR NAME"
}
