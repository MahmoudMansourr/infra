terraform {
  backend "s3" {
    bucket         = "mahmoud-ccp"
    dynamodb_table = "terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
