resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.Test-VPC.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  cidr_block              = cidrsubnet(var.cidr, 2, count.index)

  tags = {
    "Name" = "${var.environment}-vpc-public-subnet-${count.index + 1}"
  }

  depends_on = [
    aws_vpc.Test-VPC
  ]

}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.Test-VPC.id
  count             = 2
  cidr_block        = cidrsubnet(var.cidr, 2, format("%d", count.index + 2))
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    "Name" = "${var.environment}-vpc-private-subnet-${count.index + 1}"
  }

  depends_on = [
    aws_vpc.Test-VPC
  ]

}
