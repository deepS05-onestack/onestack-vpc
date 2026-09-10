output "vpc_id" {
  description = "Created VPC ID"
  value       = aws_vpc.this.id
}

output "backend_subnet_id" {
  description = "Backend private subnet ID"
  value       = aws_subnet.backend.id
}

output "db_subnet_id" {
  description = "Database private subnet ID"
  value       = aws_subnet.db.id
}

output "backend_subnet_cidr" {
  description = "Backend subnet CIDR"
  value       = aws_subnet.backend.cidr_block
}

output "db_subnet_cidr" {
  description = "Database subnet CIDR"
  value       = aws_subnet.db.cidr_block
}
