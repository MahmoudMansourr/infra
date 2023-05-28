output vpc_id {
  value       = aws_vpc.iti_vpc.id
}

output vpc_cidr {
  value       = aws_vpc.iti_vpc.cidr_block

}

output pub_sub_1 {
  value       = aws_subnet.public_subnet_1.id
}

output pub_sub_2 {
  value       = aws_subnet.public_subnet_2.id
}

output priv_sub_1 {
  value       = aws_subnet.private_subnet_1.id
}

output priv_sub_2 {
  value       = aws_subnet.private_subnet_2.id
}