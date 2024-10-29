## DevSecOpsB40-Module3-Git-Terraform-Azure
resource => Create a resource using Terraform.

data sources => to get the data from the existing resources 
                which are not created by terraform

### Bash shell Env Variables for Terraform Azure 
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"  
export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"  
export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"  
export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"  

### PowerShell Env Variables for Terraform Azure 
$env:ARM_CLIENT_ID = "00000000-0000-0000-0000-000000000000"  
$env:ARM_CLIENT_SECRET = "12345678-0000-0000-0000-000000000000"  
$env:ARM_TENANT_ID = "10000000-0000-0000-0000-000000000000"  
$env:ARM_SUBSCRIPTION_ID = "20000000-0000-0000-0000-000000000000"  

### Terraform Lifecycle Commands  
terraform init #Download Provider Binaries & Plugins  
terraform fmt #Formats the code to be inline  
terraform validate #Validate for any syntax or errors.  
terraform plan #Perfrorm Dry Run to check the what is going to get deployed.  
terraform apply (or) terraform apply --auto-approve  



