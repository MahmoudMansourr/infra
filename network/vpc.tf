resource "aws_vpc" "iti_vpc" {
  cidr_block       = var.cidr
  
  tags = {
    Name = var.name
  }
}