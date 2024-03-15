provider "aws" {
    region = "us-east-1"

}

resource "aws_s3_bucket" "my_bucket" {
    count = length(var.buckets)
    bucket = var.buckets[count.index]
}

output "aws_s3_bucket" {
    value = aws_s3_bucket.my_bucket.*.bucket
    description = "The buckets are"
}
