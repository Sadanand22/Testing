terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA5NPRD34I6RM7KOBW"
  secret_key = "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"
}