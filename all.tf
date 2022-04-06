
//create vpc

resource aws_vpc "vpc1"{
   cidr_block="10.0.0.0/24"
   
   tags = {
   Name = "myvpc1"
   }
}

// create subnet1
resource aws_subnet "sn1"{
   vpc_id=aws_vpc.vpc1.id
   cidr_block="10.0.0.0/25"
   availability_zone="ap-southeast-1a"
   map_public_ip_on_launch = true
   tags = {
      Name = "vpc1-sn1"
   }
}

resource aws_subnet "sn2"{
   vpc_id = aws_vpc.vpc1.id
   cidr_block = "10.0.0.128/25"
   availability_zone="ap-southeast-1b"
   tags = {
      Name = "vpc1_sn2"
   }
}

//create route_table1:

resource aws_route_table "rt1"{
  vpc_id=aws_vpc.vpc1.id
  
  route {
  cidr_block ="0.0.0.0/0"
  gateway_id=aws_internet_gateway.igw.id
  }
 tags = {
		Name = "vpc-rt1"
 }
}

//create routetable2:

resource aws_route_table "rt2"{
  vpc_id=aws_vpc.vpc1.id
  
  route {
  cidr_block ="0.0.0.0/0"
  nat_gateway_id=aws_nat_gateway.ngw.id
  }
 tags = {
		Name = "vpc-rt2"
 }
}


//create internet gateway:

resource aws_internet_gateway "igw" {
    tags = {
	   Name = "vpc-igw"
	}
}

//internetgateway attachment to vpc:

resource aws_internet_gateway_attachment "igattch"{
		vpc_id = aws_vpc.vpc1.id
        internet_gateway_id = aws_internet_gateway.igw.id		
}

//routetable association with subnet:

resource aws_route_table_association "rtasn1"{
	subnet_id = aws_subnet.sn1.id
	route_table_id = aws_route_table.rt1.id
      
}

//create eip(elasticip)

resource aws_eip "eip"{
}

// create nat_gateway:
resource aws_nat_gateway "ngw"{
    subnet_id=aws_subnet.sn1.id
	allocation_id=aws_eip.eip.allocation_id
	
	 tags = {
    Name = "gw NAT"
  }

}  

// routetable association subnet

resource aws_route_table_association "rtasn2"{
   subnet_id=aws_subnet.sn2.id
   route_table_id=aws_route_table.rt2.id

}

