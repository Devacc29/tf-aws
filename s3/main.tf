resource "random_string" "str" {
  length  = 5
  upper   = false
  special = false

  lifecycle {
    ignore_changes = [
      upper,
      special
    ]
  }
}

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "tfs3" {
  bucket = "${var.s3_name}-${random_string.str.id}"
  tags   = var.tags
}