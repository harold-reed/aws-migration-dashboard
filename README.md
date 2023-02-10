# aws-migration-dashboard
Mechanism for ingesting VM CSV into AWS, creating VMs (working on this: , and creating a dashboard for viewing)

Creates a VPC and landing zone in current AWS account  
Config file on fields to import from CSV  
Run .tf file with CSV file as input  
Creates VMs (working on this: and dashboard file to show migration status)
VM_Name	vCPU	RAM_MB	Disk	ami  (can be changed/extended)
cvsdecode https://www.terraform.io/language/functions/csvdecode  

