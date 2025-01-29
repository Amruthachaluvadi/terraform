

  Terraform -- Infrastructure as a code ( IAAC)
  
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
    resource "typeof resource" "name of resource{
	   ami=""
	   resource_type="t2.micro"
	   provider="aws"
	
	}
     
	eg:
	
	 resource "aws_resource" "first machine"{
	   ami=" "
	   resource_type='
	 
	 
	 }
