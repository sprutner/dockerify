# core provider info

provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "${var.aws_cred_file_path}"
}

# create vpc
resource "aws_vpc" "docker-vpc" {
  cidr_block = "10.69.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "Docker VPC"
    Project = "docker-vpc"
  }
}

resource "aws_instance" "docker_test" {
  ami 		= "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  security_groups = ["allow_me"]
  key_name = "darksim"

  provisioner "file" {
    connection {
      user = "ubuntu"
      host = "${aws_instance.docker_test.public_ip}"
      timeout = "1m"
      key_file = "~/.ssh/lodi-dodi-darksim.pem"
    }
    source = "files/install.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    connection {
      user = "ubuntu"
      host = "${aws_instance.docker_test.public_ip}"
      timeout = "1m"
      key_file = "~/.ssh/lodi-dodi-darksim.pem"
    }
    inline = [
    "sh /tmp/install.sh"
    ]
  }
}
output "ip" {
  value = "${aws_instance.docker_test.public_ip}"
}
