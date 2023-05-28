resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.public_1_cidr
  map_public_ip_on_launch=true
  availability_zone = var.avail_1

  tags = {
    Name = "public_subnet_1"
  }
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.private_1_cidr
  availability_zone = var.avail_1

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.public_2_cidr
  map_public_ip_on_launch=true
  availability_zone = var.avail_2

  tags = {
    Name = "public_subnet_2"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.iti_vpc.id
  cidr_block = var.private_2_cidr
  availability_zone = var.avail_2

  tags = {
    Name = "private_subnet_2"
  }
}