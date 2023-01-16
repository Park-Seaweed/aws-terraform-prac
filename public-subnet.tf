resource "aws_subnet" "first_subnet" {
    cidr_block = "10.0.1.0/24"

    vpc_id = aws_vpc.terraform_test.id

    availability_zone = "ap-northeast-2a"

    tags = {
      Name = "first-subnet"
    }
}


resource "aws_subnet" "second_subnet" {
  cidr_block = "10.0.2.0/24"

  vpc_id = aws_vpc.terraform_test.id

  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "second-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform_test.id

  tags = {
    Name = "minhyeok-igw"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.terraform_test.id

  tags = {
    Name = "minhyeok-table"
  }
}

resource "aws_route_table_association" "route_table_association_1" {
  subnet_id = aws_subnet.first_subnet.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_route_table_association" "route_table_association_2" {
  subnet_id = aws_subnet.second_subnet.id
  route_table_id = aws_route_table.route_table.id
}