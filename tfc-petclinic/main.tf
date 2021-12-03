resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = "${file("tf-key.pub")}"
}

data "cloudinit_config" "jenkins_conf" {
  gzip = false
  base64_encode = false

  part {
    content = "${file("jenkins-aws.yaml")}"
  }
}

data "cloudinit_config" "deploy_conf" {
  gzip = false
  base64_encode = false

  part {
    content = "${file("deploy-aws.yaml")}"
  }
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0a49b025fffbbdac6"
  instance_type = "t2.micro"
  key_name      = "my_key"
  user_data     = data.cloudinit_config.jenkins_conf.rendered

  tags = {
    Name = "Jenkins"
  }
}

resource "aws_instance" "deploy" {
  ami           = "ami-0a49b025fffbbdac6"
  instance_type = "t2.micro"
  key_name      = "my_key"
  user_data     = data.cloudinit_config.deploy_conf.rendered

  tags = {
    Name = "Deploy"
  }
}
