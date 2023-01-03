

resource "aws_instance" "EC2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance-type
  root_block_device {
    delete_on_termination = true
    volume_size           = var.volume-size
  }
  key_name  = "${var.environment}-key"
  user_data = file("./apache-docker.sh")

  tags = {
    "Name" = var.environment
  }

}

resource "aws_key_pair" "Dev-key" {
  key_name   = "${var.environment}-key"
  public_key = file("./id_rsa.pub")

}


output "Public-IP" {
  value = aws_instance.EC2.public_ip

}
