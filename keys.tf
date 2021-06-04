  
resource "aws_key_pair" "mykeypair" {
 key_name = "shahid_key"
 public_key = file(var.public_key_path)
} 
