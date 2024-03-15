resource "aws_s3_bucket" "new_demo" {
    count = length(var.s3_buckets)
    bucket = var.s3_buckets[count.index]
}

