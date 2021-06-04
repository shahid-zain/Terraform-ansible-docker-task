resource "aws_instance" "shahid-inst" {
 ami = "ami-07b068f843ec78e72"
 instance_type = "t2.micro"
 # VPC subnet
 subnet_id = aws_subnet.shahid-public-subnet.id
 # security group
 vpc_security_group_ids = [aws_security_group.allow-ssh-http.id]
 # the public SSH key
 key_name = aws_key_pair.mykeypair.key_name
tags = {
        Name = "shahid-DOCKER"
    }
}
