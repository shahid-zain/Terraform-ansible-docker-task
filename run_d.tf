resource "null_resource" "run_doc" {

    connection {
    type = "ssh"
    host = aws_instance.shahid-inst.public_ip
    user = "ubuntu"
    private_key = file("mykey")
    }


  provisioner "file" {
    source      = "docker_run.sh"
    destination = "/tmp/docker_run.sh"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/docker_run.sh",
      "sh /tmp/docker_run.sh",
    ]
  }

  }

