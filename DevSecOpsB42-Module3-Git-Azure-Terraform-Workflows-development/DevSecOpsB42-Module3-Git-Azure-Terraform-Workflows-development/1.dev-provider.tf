terraform {
  required_version = "1.9.5"

  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.15.3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "common-rg"
    storage_account_name = "devsecopsdevtfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "prod"
  subscription_id = "298f2c19-014b-4195-b821-e3d8fc25c2a8"
  features {}
}

provider "aws" {}
provider "google" {}
provider "mongodbatlas" {}
