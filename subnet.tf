resource "aws_subnet" "backend" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.backend_subnet_cidr
  availability_zone       = var.backend_az
  map_public_ip_on_launch = false

  tags = merge(var.tags, { Name = "${var.tags["Project"]}-backend-subnet" })
}

resource "aws_subnet" "db" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.db_subnet_cidr
  availability_zone       = var.db_az
  map_public_ip_on_launch = false

  tags = merge(var.tags, { Name = "${var.tags["Project"]}-db-subnet" })
}

