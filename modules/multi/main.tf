provider "aws" {
  region = "us-east-1"
}

module "multi_buckets" {
     source = "./multi_buckets"
}
