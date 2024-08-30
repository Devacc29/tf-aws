variable "tags" {
  description = "Tags to set on the s3 bucket"
  type        = map(string)
  default     = {}
}
variable "s3_name" {
  description = "s3 bucket prefix name"
  type        = string
  default     = "dev29s3aws"
}