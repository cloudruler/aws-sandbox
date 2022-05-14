terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.12.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.49"
    }
  }
  cloud {
    organization = "cloudruler"
    workspaces {
      name = "aws-sandbox"
    }
  }
}

provider "aws" {
}

provider "azurerm" {
  features {

  }
}