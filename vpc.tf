provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "terraform_test" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "minhyeok-vpc"
  }
}

