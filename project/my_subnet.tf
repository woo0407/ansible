resource "aws_subnet" "my_subnet" {
  vpc_id                 = aws_vpc.my_vpc.id  # VPC 리소스를 정확히 참조해야 함
  cidr_block             = "10.0.1.0/24"
  availability_zone      = "ap-northeast-2a"  # 가용 영역 값의 따옴표 수정
  map_public_ip_on_launch = true               # 공인 IP 할당 여부
  tags = {
    Name = "my-subnet"
  }
}

