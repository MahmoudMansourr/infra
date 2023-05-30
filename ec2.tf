resource "aws_instance" "bastionHost_instance" {
  ami                    = var.AMI
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = module.network.pub_sub_1
  key_name               = aws_key_pair.tf-key-pair.id

  user_data = <<-EOF
              #!/bin/bash
                echo '${tls_private_key.rsa-key.private_key_pem}' > /home/ec2-user/tf-key-pair.pem
                chmod 400 tf-key-pair.pem
              EOF

  provisioner "local-exec" {
    command = "echo ${aws_instance.bastionHost_instance.public_ip}"
  }

  tags = {
    Name = "bastionHost_instance"
  }
}



resource "aws_instance" "application_instance_1" {
  ami                    = var.AMI
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_port.id]
  subnet_id              = module.network.priv_sub_1
  key_name               = aws_key_pair.tf-key-pair.id

  tags = {
    Name = "application_instance_1"
  }
}

resource "aws_instance" "application_instance_2" {
  ami                    = var.AMI
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_port.id]
  subnet_id              = module.network.priv_sub_2
  key_name               = aws_key_pair.tf-key-pair.id

  tags = {
    Name = "application_instance_2"
  }
}


resource "null_resource" "get_instance_ip" {
  depends_on = [
    aws_instance.bastionHost_instance
  ]
  provisioner "local-exec" {
    command = "echo ${aws_instance.bastionHost_instance.public_ip} "
  }
}