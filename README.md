# aws-migration-dashboard
Mechanism for ingesting VM CSV into AWS, creating VMs, and creating a dashboard for viewing

Creates a VPC and landing zone in current AWS account
Deploys terraform server
Creates code repo in Cloud 9
Config file on fields to import from CSV
Commit to repo: CSV, terraform code
Pipeline deploys .tf and CSV files to server
Runs .tf file with CSV file as input
Creates VMs and dashboard file to show migration status
Name,State,Status,Provisioned Space,Used Space,Host CPU,Host Mem,Guest Mem %
cvsdecode https://www.terraform.io/language/functions/csvdecode
