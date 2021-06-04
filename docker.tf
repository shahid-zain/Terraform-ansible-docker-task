resource "null_resource" "transferplaybook" {
  
    connection {
    type = "ssh"
    host = aws_instance.shahid-inst.public_ip
    user = "ubuntu"
    private_key = file("mykey")
    }

 
  provisioner "file" {
    source      = "docker.yaml"
    destination = "/tmp/docker.yaml"
  }

 provisioner "file" {
    source      = "docker.sh"
    destination = "/tmp/docker.sh"
  }
provisioner "file" {
    source      = "Dockerfile"
    destination = "/tmp/Dockerfile"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/docker.sh",
      "sh /tmp/docker.sh",
    ]
  }
}
