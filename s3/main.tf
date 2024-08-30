resource "random_string" "str" {
  length  = 12
  upper   = false
  special = false

  lifecycle {
    ignore_changes = [
      length,
      upper,
      special
    ]
  }
}

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "tfs3" {
  bucket = random_string.str.id
  tags = {
    created_by = "deva"
  }
}