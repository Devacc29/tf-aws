variable "tags" {
  description = "Tages to set on the bucket"
  type        = map(string)
}

variable "vpcs" {
  type        = list(string)
}

variable "subnets" {
  type = map(object({
    name = string
    region = string
  }))
}