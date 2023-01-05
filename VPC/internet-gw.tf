resource "aws_internet_gateway" "Internet-GW" {
  vpc_id = aws_vpc.Test-VPC.id
  tags = {
    "Name" = "${var.environment}-gateway"
  }

}