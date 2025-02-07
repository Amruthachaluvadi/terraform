

  Terraform -- Infrastructure as a code ( IAAC)

  Terraform Cmds:

  terraform init
  terraform validate 
  terraform plan 
  terraform apply -autoa-approve
  terraform show
  terraform fmt


  
  AWS --> Cloud formation template
  Azure --> Resource Manager
  Open Stak --> Heat template
  
  Some template  to create infra -- It is is IAAC
  
  But if we use any of the above then we  need to stick to that cloud provider. Where as terraform can be used to create infra in any cloud  provider. No need to stick to only one
  cloud.
  
  universarl Approach --Terraform  ( HCL- harshicorp language)- Uses API as code concept
  Terraform  -->  Similar tools cross plane  , but terraform has good community and largest market
  
   
  Extension : .tf
    
  Advantages of Terraform
  
  1. Version controlling
  2. Its is declarative not imperative
  
  eg: If we get into an auto we will tell him where to go but not how or which road to take to reach the destination, This is declarative.
  So similarly in terraform we will tell to create a resource but not step by step approach which we will give in ansible.
  
  3. We can avoid human errors and using module we can impelmennt re-usability
  
  4. Plan and apply -  which will allow to view the preview before creating hence we can avoid errors in infra creation
  
  5. HCL - Haricorp  configuration language , very simple and easy to understand
  
  6. Cost and time effective - Easy to create and easy to destory which does not take much time
  
  7. Dependency management - No need for the user to write dependency, it will follow the path correctly 
  
  eg: to create ec2 instance what are the dependency things to create first.
  
  
  
  Terraform  Providers:  It is is plug-in, which will allow terraform to connect and create the required resources in that  provider
  
  Official - full support will be provided
   parnter  -- limited
  community  - managed by open source
  
  
  Provider Configuration:
  
  Resource  :
    resource "typeof resource" "name of resource"{
	   ami=""
	   resource_type="t2.micro"
	   provider="aws"
	
	}
     
	eg:
	
	 resource "aws_resource" "first machine"{
	   ami=" "
	   resource_type="t2.micro"
}

Terraform Setup:
1. Create user in aws IAM with adminaccess
2. Install terraform and set the path (Only for windows) in environment varaibles
3. Install aws cli
4. aws configure  ( by giving user access key and secret)
5. Write provider.tf  ( to configure aws during init phase)
6. Write ec2.tf ( to create ec2 instance and security group with ingress and egress rules)

Day 2: Variables

variable "<variable-name>"{
    type =""
    default=""

}


1. terraform init  ( it will set the or install the provider)
2. terraform plan ( it will create a plan for our review , but will not create any instance, it will chk syntax also)
i.e terramform validate ( will run expliciity as part of terraform plan)
    terraform plan -out=tsfplan ( plan will be generate and u can apply the same plan later by using apply cmd and this tsfplan file)
3. terraform fmt ( to format the code in correct style)
4. terraform apply -auto-approve ( it will create the resources with out getting the approval itself)
or terraform apply ( it will create when you enter 'yes' )
5. terraform show ( it will show the  state file info)
6. terraform destroy  ( to delete the instances)

Variable Preferences


Different ways to define the variables:

.tfvars file, cmd line, environment variables, default, 

how to override default variables
1. We can write those variables in filename.tfvars  , which will override the default variables

eg:  filename.tfvars
     instance_type = "t3.small"  # program will take this value and overrie the default t3.micro value

2. Command line arguments

  -var "<var-name>=<var-value>"

  eg: terraform plan -var="instance_type=t3.large"
  o/p: instance_type                        = "t3.micro" -> "t3.large"


3.  environment variables
  export  TF_VAR_<var_name> = <var_value>

  export TF_VAR_instance_type = t3.xlarge
  unset TF_VAR_instance_type ( to remove the environment variable)  # unset <Var-name>

  Note: If .tfvars file exists then preference will be given for that file.

4. default

5. user prompt


PREFERENCE:

1. CMD line variables
2. tfvars file
3. environment variables
4. default
5. If none of the above are defined then it will ask as prompt for the user during terraform plan.

===================


CONDITIONS:

expression ? " " : " " 

eg:
instance_type = var.environment =="development" ? "t3.micro" : "t3.small"  
As it is dev, it will take t3.micro,else it will create t3.small ec2 instances


====================

LOOPS

3 types

1. Count based loops
2. For each loop
3. Dynamic block


Scenario: 
Want to create 3 ec2 instances ( backend, mysql frontend)
want to create 3 r53 private ip records
1 r53 public ip record

1 Eg:  count = 3
       count.index  ---> 0,1,2
       count size -- > 3

1. Sample code for COUNT to create 3 instances

 resource "aws_instance" "web" {
   count = 3
   ami           = "ami-09c813fb71547fc4f"
   vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"

   tags = {
     Name = var.instance_name[count.index]
     purpose = "Create expense required ec2 instannces"
   }
 }

 In variable.tf define instance_name with string of variables

   variable instance_name{
        type=list(string)
        default=["mysql","backend","frontend"]

   }

2. To create rr53 we need ip addresss, these can be taken after creating the instances

3. To show the created instances or resource as output we need to create another file outputs.tf

output "ec2_info" {
  value       = aws_instance.expense  #created instances will be shown
}

=====================

Interpolation - You can concatenate variables with text  with ${} 

eg: var1.var2 i.e sqlplus.awsdevops25.online

 name    = "${var.instance_name [count.index]}.${var.zone_name}""


Functions:
In terraform we can not write custom functions
we can use the existing functions from terraform
which will accepts inputs and gives inputs to us.

============

Data Sources: They are used to query the existing information provided by the provider

Instead of hardcoding ami id we can get the detail from the provider using data source

Eg: define data.tf file with below details

data "aws_ami" "expense" {
  most_recent = true

  owners = ["973714476881"]
  
 filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvn"]
  }

 
}
Output Blocks: 
They are used to view the data fetched by the data source blocks. Used in module development

Eg: 
output "ami_info" {
   value = data.aws_ami.joindevops.id

}
========================
Locals:   They are used to run the expression or functions and save the results to a variables

Locals are used to store expressions and also store key value pairs
Can refer local variables.
They can't be overriden

Variables: Can't store expressions.  Can be overriden, Can not refer other variables


Locals are defined inside locals.tf file and can be referred as local.key_name

eg:  locals {
       ami_id = "o987988879087"
       instance_type ="t3.micro"
}
    local.ami_id  ( to get the value)

=========================

STATE MANAGEMENT:

Declared/desired infra --> .tf file . Whatever user writes in tf files that is what userwants.
actual infra --> what terraform is creating in provider

desired infra <===> actual infra

terraform.tfstate --> It is a file terraform creates to know what it is created. This is actual infra created by the terraform

If u update few parameters it will not recreate the resources it will just update the details
For some resources, updating few parameters it will try to delete the existsing and recreate the new one with new details

