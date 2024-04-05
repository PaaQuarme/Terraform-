# Generate VPC output ID
output "vpc-out" {
    value = aws_vpc.Grace_IT.id
}

# Generate Subnet output ID
output "pub-sub1-out" {
    value = aws_subnet.Prod-pub-sub1.id
}

output "pub-sub2-out" {
    value = aws_subnet.Prod-pub-sub2.id
}

output "priv-sub1-out" {
    value = aws_subnet.Prod-priv-sub1.id
}

output "priv-sub2-out" {
    value = aws_subnet.Prod-priv-sub2.id
}

# Generate Router output ID
output "pub-router-out" {
    value = aws_route_table.Prod-pub-route-table.id
}

output "priv-router-out" {
    value = aws_route_table.Prod-priv-route-table.id
}

#Generate IGW output ID
output "IGW-out" {
    value = aws_internet_gateway.Prod-igw.id
}
#Generate IGW output ID
output "NGW-out" {
    value = aws_nat_gateway.Prod-Nat-gateway.id
}

#Generate Security Group output ID
output "Sec-group-out" {
    value = aws_security_group.Grace_IT_sg.id
}