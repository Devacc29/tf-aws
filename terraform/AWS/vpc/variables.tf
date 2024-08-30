variable "tags" {
  description = "Tages to set on the bucket"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "value"
  type = list(string)
  default = {}
}