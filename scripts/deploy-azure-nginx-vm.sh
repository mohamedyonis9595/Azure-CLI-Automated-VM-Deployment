cat << 'EOF' > cloud-init.txt
#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
EOF

az group list --output table

az vm create \
  --resource-group kml_rg_main-53b5574529c94ea6 \
  --name xfusion-vm \
  --image Ubuntu2204 \
  --location eastus \
  --size Standard_B1s \
  --storage-sku Standard_LRS \
  --os-disk-size-gb 30 \
  --custom-data cloud-init.txt \
  --generate-ssh-keys \
  --public-ip-sku Standard

az vm open-port \
  --resource-group kml_rg_main-53b5574529c94ea6 \
  --name xfusion-vm \
  --port 80 \
  --priority 1010

az vm list-ip-addresses \
  --resource-group kml_rg_main-53b5574529c94ea6 \
  --name xfusion-vm \
  --output table


http://20.124.231.209/
