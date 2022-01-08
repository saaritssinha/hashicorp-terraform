variable "ami_id" {
  description = "mention ami id here"
  type        = string
  default     = "ami-01f87c43e618bf8f0"
}

variable "instance_type" {
  default = "t2.micro"
}
