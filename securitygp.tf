resource "aws_security_group" "allow-ssh-http" {
 vpc_id = aws_vpc.shahid-vpc.id
 name = "allow-ssh-http"
 description = "security group that allows ssh,http and all egress traffic"
 egress {
 from_port = 0
 to_port = 0
 protocol = "-1"
 cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
 from_port = 22
 to_port = 22
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
 from_port = 80
 to_port = 80
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
 }

 tags = {
 Name = "shahid-sg"
 }
}
