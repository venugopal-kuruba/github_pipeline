resource "time_sleep" "delay" {
  depends_on      = [terraform_data.vm-config]
  create_duration = "10s"
}

resource "terraform_data" "vm-config" {
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type     = "ssh"
      user     = "adminsree"
      password = random_password.server_passwords.0.result
      host     = azurerm_public_ip.vm1.ip_address
    }
  }
  provisioner "remote-exec" {
    inline = [
      "bash /tmp/script.sh",
      "sudo apt update ",
      "curl -LO \"https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl\"",
      "chmod 777 /home/adminsree/kubectl && ./kubectl version | head -1",
      "sudo apt install -y nginx jq unzip net-tools python3-pip",
      "sudo snap install certbot --classic",
      "sudo echo '<h1>${azurerm_resource_group.devsecopsb40-rg1.name}-${var.env}-PublicServer-1</h1>' | sudo tee -a  /var/www/html/index.nginx-debian.html"

    ]
    connection {
      type     = "ssh"
      user     = "adminsree"
      password = random_password.server_passwords.0.result
      host     = azurerm_public_ip.vm1.ip_address
    }
  }
  #depends_on = [azurerm_subnet_network_security_group_association.nsg-assosiation-websvr,azurerm_linux_virtual_machine.vms]
}
