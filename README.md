# Minecraft-Server-Infrastructure

This is a terraform project that anyone can use to quickly host a Minecraft server on AWS.

## Required Prerequisite Setup

* Create an AWS account if you do not already have one. Steps: https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/
* [Install Terraform] Hashicorp provides installation steps here: https://learn.hashicorp.com/tutorials/terraform/install-cli
* [Install AWS CLI] Amazon provides installation steps here: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
* [Configure AWS CLI] Follow the quick start steps documented here: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

## How to run the project

- Clone/download this project to your computer
- Open any terminal to the terraform folder in this project
- Run `terraform init`
- 
![preview](/graphics/terraform-init.PNG)

- Run `terraform plan -var-file="terraform.tfvars"`
- 
![preview](/graphics/terraform-plan.PNG)

- Run `terraform apply`
- 
![preview](/graphics/terraform-apply.PNG)

- Wait a few minutes after the apply for the minecraft server to start up. 
- Connect via the minecraft_server_ip that was output after `terraform apply`
- 
 ![preview](/graphics/client.PNG)
 
- You can permanently shut down everything this project created by running `terraform destroy`. This will ensure you don't accrue any unexpected bills from AWS
