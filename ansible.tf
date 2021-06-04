resource "null_resource" "install-ansible" {
  
    connection {
    type = "ssh"
    host = aws_instance.shahid-inst.public_ip
    user = "ubuntu"
    private_key = file("mykey")
    }

 
  provisioner "file" {
    source      = "ansible.sh"
    destination = "/tmp/ansible.sh"
  }
  
   provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/ansible.sh",
      "sh /tmp/ansible.sh",
    ]
  }
  
  }
