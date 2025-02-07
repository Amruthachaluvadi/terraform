locals {
  ami_id = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  tag_name = "${var.Project}.${var.component}.${var.environment}"
}
