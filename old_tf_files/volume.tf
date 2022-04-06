resource aws_ebs_volume "v1"{
  availability_zone = "ap-southeast-1a"
  size = "10"
  type = "gp2"
  
  tags = {
  Name = "resvolume"
  }
  
}