provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "/Users/karolmalyszko/.aws/credentials"
  profile                 = "head-devil"
}

resource "aws_instance" "rails" {
  ami                     = "ami-de8fb135"
  instance_type           = "t2.micro"
  key_name                = "onboarder"
  vpc_security_group_ids  = ["${aws_security_group.web.id}"]

#  # install docker
#  provisioner "local-exec" {
#    command = "curl https://releases.rancher.com/install-docker/18.03.sh | sh"
#  }

#  # add ubuntu user do docker group
#  provisioner "local-exec" {
#    command = "sudo usermod -aG docker ubuntu"
#  }

#  # install docker-compose
#  provisioner "local-exec" {
#    command = "sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose"
#  }

#  # create app directory
#  provisioner "local-exec" {
#    command = "sudo mkdir /opt/rails-app && sudo chown ubuntu:docker /opt/rails-app"
#  }

#  # pull application code
#  provisioner "local-exec" {
#    command = "git clone -b master https://github.com/karolmalyszko/ng_onboarding.git"
#  }

#  # run docker-compose
#  provisioner "local-exec" {
#    command = "docker-compose -f /opt/rails-app/docker-compose.yml up -d"
#  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.rails.id}"
}

# security group
resource "aws_security_group" "web" {
  name        = "web"
  description = "Public access security group"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags {
    Name = "web_sg"
  }
}

# key-pair to access
resource "aws_key_pair" "onboarder" {
  key_name = "onboarder"
  public_key = "${var.ssh_public_key}"
}
