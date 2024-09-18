provider "aws" {
  region = "ap-southeast-1"
  access_key = "put_your_access_key"
  secret_key = "put_your_secret_key"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "devsecops-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = ["subnet-0c285b977e48d3980", "subnet-021cea9a54f3067b1"]
  }
}

resource "aws_iam_role" "eks_role" {
  name = "eks-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
