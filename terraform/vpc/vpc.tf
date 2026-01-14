# default vpc configuration
resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"

    tags = {
      Name = "mjkim134-vpc"
    }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "mjkim134-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.10.0/24"

  tags = {
    Name = "mjkim134-private-subnet"
  }
}

# igw for vpc
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

    tags = {
        Name = "mjkim134-igw"
    }
}

resource "aws_nat_gateway" "ngw" {
  subnet_id = aws_subnet.private_subnet.id
}