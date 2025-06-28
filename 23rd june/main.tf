provider "aws" {
  region  = "ap-south-1"
  profile = "AdminAccess-644608486460"
}

resource "aws_vpc" "vpc-sivanithin" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-sivanithin"
  }
}

resource "aws_subnet" "subnet-sivanithin" {
  vpc_id                  = aws_vpc.vpc-sivanithin.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-sivanithin"
  }
}

resource "aws_internet_gateway" "igw-sivanithin" {
  vpc_id = aws_vpc.vpc-sivanithin.id
  tags = {
    Name = "igw-sivanithin"
  }
}

resource "aws_route_table" "rt-sivanithin" {
  vpc_id = aws_vpc.vpc-sivanithin.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-sivanithin.id
  }

  tags = {
    Name = "rt-sivanithin"
  }
}

resource "aws_route_table_association" "rta-sivanithin" {
  subnet_id      = aws_subnet.subnet-sivanithin.id
  route_table_id = aws_route_table.rt-sivanithin.id
}

resource "aws_security_group" "jenkins-master-sg-sivanithin" {
  name        = "jenkins-master-sg-sivanithin"
  description = "Allow SSH and Jenkins UI"
  vpc_id      = aws_vpc.vpc-sivanithin.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-master-sg-sivanithin"
  }
}

resource "aws_security_group" "jenkins-agent-sg-sivanithin" {
  name        = "jenkins-agent-sg-sivanithin"
  description = "Allow SSH for Jenkins Agent"
  vpc_id      = aws_vpc.vpc-sivanithin.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-agent-sg-sivanithin"
  }
}

resource "aws_instance" "jenkins-master-ec2-sivanithin" {
  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-sivanithin.id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.jenkins-master-sg-sivanithin.id]
  associate_public_ip_address = true

  tags = {
    Name = "jenkins-master-sivanithin"
  }
}

resource "aws_instance" "jenkins-agent-ec2-sivanithin" {
  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-sivanithin.id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.jenkins-agent-sg-sivanithin.id]
  associate_public_ip_address = true

  tags = {
    Name = "jenkins-agent-sivanithin"
  }
}
