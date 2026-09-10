# Private route table (no route to an Internet Gateway - fully isolated subnets)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, { Name = "${var.tags["Project"]}-private-rt" })
}

resource "aws_route_table_association" "backend_assoc" {
  subnet_id      = aws_subnet.backend.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "db_assoc" {
  subnet_id      = aws_subnet.db.id
  route_table_id = aws_route_table.private.id
}
