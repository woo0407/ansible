resource "aws_route_table_association" "my_route_table_assoc" {
  subnet_id      = aws_subnet.my_subnet.id  # 서브넷 ID 참조
  route_table_id = aws_route_table.my_route_table.id  # 라우팅 테이블 ID 참조
}
