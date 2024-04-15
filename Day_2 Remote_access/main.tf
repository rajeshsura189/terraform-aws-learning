provider "aws" {

  region     = "ap-south-1" # Update with your desired AWS region
}

resource "aws_instance" "clear" {
  ami           = "ami-09298640a92b2d12c" # Update with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = "Project_Mario_game"

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id              = aws_subnet.default.id

  tags = {
    Name = "example-instance"
  }

  provisioner "file" {
    source      = "./script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh"
    ]
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow-all"
  description = "Allow all traffic"

  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_subnet" "default" {
  vpc_id = aws_default_vpc.default.id

}
