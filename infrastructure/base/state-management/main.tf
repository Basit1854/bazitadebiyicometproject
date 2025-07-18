# data "aws_s3_bucket" "statebucket" {
#     bucket = terraformstatemanagementcomet
  
# }

# data "aws_dynamodb_table" "tf_lock" {
#   name = tfstatelockcomet
# }

resource "aws_s3_bucket" "this" {
  bucket = "my-tf-test-bucket"
}


resource "aws_dynamodb_table" "this" {
  name             = tfstatelockcomet
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true

}

# ## implement the recommended fixes for the IAM role modules first before proqceeding with this
# module "iam" {
#   source = "./modules/iam"

#   cluster_name         = var.cluster_name
#   enable_irsa          = true
#   irsa_service_account = "comet-irsa-sa"
#   irsa_namespace       = "default"
#   irsa_policy_json     = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect   = "Allow",
#       Action   = ["s3:ListBucket"],
#       Resource = "*"
#     }]
#   })
#   tags = var.tags
# }