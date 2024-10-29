rgname              = "devsecopsb42-rg1"
location            = "eastus"
env                 = "prod"
batch               = 41
owner               = "JavaAppTeam"
vnet1_address_space = ["172.16.0.0/16"]
subnet1_cidr_block  = ["172.16.1.0/24"]
subnet2_cidr_block  = ["172.16.2.0/24"]
subnet3_cidr_block  = ["172.16.3.0/24"]
subnet4_cidr_block  = ["172.16.4.0/24"]
vm_size = "Standard_B1s"
admin_username = "adminsree"
dns_zone = "azureb45.xyz"