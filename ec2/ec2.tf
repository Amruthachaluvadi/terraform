 resource "aws_instance" "web" {
   ami           = "ami-09c813fb71547fc4f"
   vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"

   tags = {
     Name = "HelloWorld"
   }
 }


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
 # vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   #from all server u are alloing only port 22 

  } 


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }
}
