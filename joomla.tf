resource "null_resource" "Dockerfile" {

    connection {
    type = "ssh"
    host = aws_instance.shahid-inst.public_ip
    user = "ubuntu"
    private_key = file("mykey")
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
