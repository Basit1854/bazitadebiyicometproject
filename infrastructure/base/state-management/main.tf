resource "aws_s3_bucket" "this" {
  bucket = "my-tf-test-bucket"
}


resource "aws_dynamodb_table" "this" {
  name             = tfstatelockcomet
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
