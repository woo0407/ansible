resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id  # VPC ID를 정확히 참조합니다.
  tags = {
    Name = "my-igw"
  }
}

