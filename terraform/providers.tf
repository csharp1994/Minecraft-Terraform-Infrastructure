provider "aws" {
  region = var.region

  default_tags {
    tags = {
      CostCenter = "Minecraft"
      ManagedBy  = "Terraform"
    }
  }
}
