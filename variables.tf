variable "AWS_REGION" {
  default = "us-west-1"
}

variable "private_key_path" {
 default = "mykey"
}
variable "public_key_path" {
 default = "mykey.pub"
}
variable "AMIS" {
 type = map(string)
 default = {
 us-east-2 = "ami-0b9064170e32bde34"
 us-west-2 = "ami-0a7d051a1c4b54f65"
 eu-west-1 = "ami-04c58523038d79132"
 }
}
