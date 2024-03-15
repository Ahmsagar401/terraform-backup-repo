provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "static_server" {
    ami = "ami-03f4878755434977f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_security_group.id]
    user_data = file("static.sh")

    tags = {
        "Name" = "static"
    }
}

resource "aws_security_group" "my_security_group" {
    name = "security"
    description = " allow ssh and http port"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}
output "server_public_ip" {
        value = aws_instance.static_server.public_ip
}

