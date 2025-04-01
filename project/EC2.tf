resource "aws_instance" "my_ec2" {
  ami                    = "ami-070e986143a3041b6"  # 올바른 AMI ID 사용
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name               = "mmmy"  # 기존 SSH 키 페어

  # Apache 웹 서버 설치 및 EC2 인스턴스 ID로 index.html 수정
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd

  # IMDSv2를 사용하여 인스턴스 ID 가져오기
  TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
  INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/instance-id)

  # index.html 생성
  echo "<html><body><h1>My EC2 Instance: $INSTANCE_ID</h1></body></html>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "my-ec2-instance"
  }
}

