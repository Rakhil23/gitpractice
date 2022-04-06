resource aws_subnet "subnet1"{
   vpc_id = "${aws_vpc.vpc1.id}"
   cidr_block = "10.0.0.0/25"
   availability_zone = "ap-southeast-1a"
   
   tags = {
      Name = "subnet1"
   }
}
resource aws_subnet "subnet2"{
  vpc_id = "${aws_vpc.vpc1.id}"
  cidr_block = "10.0.0.128/25"
  availability_zone = "ap-southeast-1b"
  
  tags = {
    Name = "subnet2"
  
  }
}