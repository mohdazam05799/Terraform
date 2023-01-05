resource "aws_route_table" "public" {
  vpc_id = aws_vpc.Test-VPC.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Internet-GW.id
  }
  tags = {
    "Name" = "${var.environment}-public-route-table"
  }
  depends_on = [
    aws_internet_gateway.Internet-GW, aws_vpc.Test-VPC
  ]

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.Test-VPC.id
  tags = {
    "Name" = "${var.environment}-private-route-table"
  }
  depends_on = [
    aws_vpc.Test-VPC
  ]

}



resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
  depends_on = [
    aws_route_table.public
  ]

}


resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id

}