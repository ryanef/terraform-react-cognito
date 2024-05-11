resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
  tags = {
    Name        = var.bucket_name
  }
}

# resource "aws_s3_bucket_acl" "acl" {
#   bucket = aws_s3_bucket.site.id
#   acl    = "private"
# }



# resource "aws_s3_bucket_ownership_controls" "this" {
#   bucket = aws_s3_bucket.site.id

#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_website_configuration" "example" {
#   bucket = aws_s3_bucket.site.id

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "index.html"
#   }

# }

# resource "aws_s3_bucket_policy" "public" {
#   bucket = aws_s3_bucket.site.id
#   policy = data.aws_iam_policy_document.public.json
#   depends_on = [ aws_s3_bucket_public_access_block.example ]
# }

# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.site.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# data "aws_iam_policy_document" "public" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }

#     actions = [
#       # "s3:GetObject",
#       # "s3:PutObject",
#       # "s3:DeleteObject",
#       # "s3:ListBucket",
#         "s3:*"
#     ]

#     resources = [
#       aws_s3_bucket.site.arn,
#       "${aws_s3_bucket.site.arn}/*",
#     ]
#   }
# }