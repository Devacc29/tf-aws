output "random_str_id" {
  description = "Random id generated for s3 name"
  value       = random_string.str.id
}

output "s3_id" {
  description = "created s3 name"
  value       = aws_s3_bucket.tfs3.id
}