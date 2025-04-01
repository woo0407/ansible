resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id
  
  # Outbound 규칙 (egress)
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # 모든 프로토콜 허용
  }
  
  # Inbound 규칙 1 (SSH - 포트 22)
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  
  # Inbound 규칙 2 (HTTP - 포트 80)
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  
  # 태그 설정
  tags = {
    Name = "my-sg"
  }
}

