resource "aws_instance" "web" {
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.instance_type
    tags = var.ec2_tags

}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  # vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_block #from all server u are alloing only port 22 

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_block

  }

  tags = var.sg_tags
}
