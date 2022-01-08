provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAXQEM2AZM7T6N2CA3"
  secret_key = "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"
}


resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC"
  }
}

resource "aws_internet_gateway" "nyigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "sample-igw"
  }
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "subnet-1"
  }
}

                                  resource "aws_security_group" "security_group" {
  name        = "security_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sample-SG"
  }
}


resource "aws_instance" "myinstance" {
  count                       = 2
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = "saarit"
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  subnet_id                   = aws_subnet.mysubnet.id

  tags = {
    Name = "VM-${count.index}"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nyigw.id
  }

  tags = {
    Name = "public-rtb"
  }
}

resource "aws_route_table_association" "rtassociation" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.myrt.id
}
