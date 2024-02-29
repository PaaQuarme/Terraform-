# Networking for Application
# Create VPC
resource "aws_vpc" "Grace_IT" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Grace_IT"
    env = "prod"
  }
}

# Create 2 public subnets
resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id = aws_vpc.Grace_IT.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Prod-pub-sub1"
    env = "prod"
  }
}

resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id = aws_vpc.Grace_IT.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Prod-pub-sub2"
    env = "prod"
  }
}

# Create 2 private subnets
resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id = aws_vpc.Grace_IT.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Prod-priv-sub1"
    env = "prod"
  }
}

resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id = aws_vpc.Grace_IT.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Prod-priv-sub2"
    env = "prod"
  }
}

# Create 1 public Route table
resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.Grace_IT.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id =aws_internet_gateway.Prod-igw.id
  }

  tags = {
    Name = "Grace_IT"
    env = "prod"
  }
}

# Create 1 private route
resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.Grace_IT.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id =aws_nat_gateway.Prod-Nat-gateway.id
  }

  tags = {
    Name = "Grace_IT"
    env = "prod"
  }
}

# Associate Routes to subnets
resource "aws_route_table_association" "Public-RT1" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

resource "aws_route_table_association" "Public-RT2" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

resource "aws_route_table_association" "Private-RT1" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

resource "aws_route_table_association" "Private-RT2" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

# Create IGW
resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.Grace_IT.id

  tags = {
    Name = "Grace_IT"
    env = "prod"
  }
}

# Creating EIPs for NAt Gateway
resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.Prod-igw]
}

#Create a Nat Gateway
resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.Prod-pub-sub1.id

  tags = {
    Name = "Prod-Nat-gateway"
  }
}

