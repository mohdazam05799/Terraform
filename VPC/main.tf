resource "aws_vpc" "Test-VPC" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  tags = {
    "Name" = "${var.environment}-vpc"
  }
}

output "vpc-id" {
  value = aws_vpc.Test-VPC.id

}