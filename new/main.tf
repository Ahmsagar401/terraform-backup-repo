provider "aws" {
    region = var.region
}

data "aws_availability_zones" "current" {
      state = "available"
}

resource "aws_vpc" "own" { 
    cidr_block = var.vpc_CIDR


tags = {
    Name = "today_vpc"
  }
}

resource "aws_subnet" "first_subnet" {
    count = length(var.subnet_CIDR)
    vpc_id  = aws_vpc.own.id
    cidr_block = var.subnet_CIDR[count.index]
    availability_zone = element(data.aws_availability_zones.current.names, count.index)
    tags = {
        Name = "subnet-${count.index + 1}"
    }
}

output "my_subnets" {
    value = aws_subnet.first_subnet[*].id
}
