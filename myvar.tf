variable "region" {
  default = "ap-south-1"
}
variable "ec2_ami" {
  type = "map"
  default = {
    ap-south-1 = "ami-0b44050b2d893d5f7"
    us-east-1 = "ami-0b44050b2d893d5f8" 
 }
}
