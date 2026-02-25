terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Keeps version consistency
    }
  }
}

provider "aws" {
  region = "us-east-1" # As suggested in your AWS Console
}
