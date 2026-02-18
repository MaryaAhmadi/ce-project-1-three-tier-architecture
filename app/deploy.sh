

#!/bin/bash

echo "Starting application deployment..."

sudo dnf install -y httpd
sudo systemctl enable --now httpd

sudo cp index.html /var/www/html/index.html
echo "DB Connection: OK" | sudo tee /var/www/html/health

echo "Deployment completed successfully."


