provider "aws" {
  region = var.aws-region
}

terraform {
  required_providers {                        //explicitly using this block as Hashicorp does not maintain IBM provider
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.77.0"
    }
  }
}

provider "ibm" {
  region = var.ibm-region
}

