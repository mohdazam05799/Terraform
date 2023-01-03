data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "name"
    values = ["ubuntu/*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "ami" {
  value = data.aws_ami.ubuntu.id

}