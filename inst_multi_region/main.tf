provider "aws" {
    region = "ap-south-1"
}

provider "aws" {
    region = "eu-north-1"
    alias = "Stockholm_region"
}

resource "aws_instance" "Mumbai" {
    ami = "ami-03f4878755434977f"
    instance_type = "t2.micro"

    tags = { 
        Name = "test_server_mumbai"
    }
}

resource "aws_instance" "Stockholm" {
    ami = "ami-0014ce3e52359afbd"
    instance_type = "t3.micro"
    provider = aws.Stockholm_region

    tags = { 
        Name = "test_server_stockholm"
    }
}

