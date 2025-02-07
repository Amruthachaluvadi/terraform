terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84"
    }
  }


  backend "s3" {
    bucket = "81s-feb-tf-state-mgmt"
    key    = "expense-backend-dev"  #you should have unique keys with in the bucket same key should not be
                                   # used in other repos or tf files
    region = "us-east-1"
    dynamodb_table = "tf-lock-state"

  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}