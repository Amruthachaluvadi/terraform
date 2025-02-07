variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is RHEL9 ami Id"
}

 variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type of the ec2 instance"
} 


variable "environment"{
   type = string
   default = "development"

}

variable "ec2_tags" {
  type = map(any)
  default = {
    project     = "expense"
    component   = "Backend"
    environment = "prod"
  name = "expense-backend-dev" }


}

variable "from_port" {
  type        = number
  default     = 22
  description = "Ingress from port value"
}

variable "to_port" {
  type        = number
  default     = 22
  description = "Ingress To port value"
}

variable "cidr_block" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "ci dr block default value"
}

variable "sg_tags" {
  type = map(any)
  default = {
    name = "expense-backend-dev"
  }

}
