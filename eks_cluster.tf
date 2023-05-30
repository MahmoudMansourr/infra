resource "aws_security_group" "private_cluster_sg" {
  name_prefix = "private-cluster-sg"
  vpc_id      = module.network.vpc_id
  #   endpoint_public_access = false

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eks_cluster" "private_cluster" {
  name     = "private-eks-cluster"
  role_arn = aws_iam_role.private_cluster.arn

  vpc_config {
    subnet_ids = [module.network.priv_sub_1, module.network.priv_sub_2]
  }

  depends_on = [aws_security_group.private_cluster_sg]
}

resource "aws_iam_role" "private_cluster" {
  name = "private-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "private_cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.private_cluster.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.private_cluster.name

}
