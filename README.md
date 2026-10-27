# Set Up a Web Application on Amazon EC2 (Terraform)

This repository packages the assignment report screenshots and Terraform code for deploying a basic Nginx website on AWS EC2.

## Architecture
Browser → Internet → AWS Security Group (SSH 22 restricted to your IP, HTTP 80 public) → Ubuntu EC2 → Nginx → `index.html`

## Prerequisites
- An AWS account with permissions to create EC2 instances and security groups
- Terraform installed
- AWS CLI installed and configured (`aws configure`)
- An SSH key pair in AWS, or let Terraform create one locally (see below)
- A valid public IPv4 address for SSH access

## Before you apply
1. Open `terraform/terraform.tfvars.example` and save a copy as `terraform/terraform.tfvars`.
2. Set `my_ip_cidr` to your public IP in CIDR format, for example `203.0.113.10/32` (replace this example).
3. Set `key_name` to an existing EC2 key pair name in your AWS region.
4. Review `terraform/variables.tf` and `terraform/main.tf`. The configuration uses Ubuntu 24.04 LTS and a small EC2 instance.
5. Do not commit `terraform.tfvars`, private keys, AWS credentials, or state files to GitHub.

## Deploy
From the repository root:

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Type `yes` when Terraform asks for confirmation. The output `website_url` gives the HTTP URL, and `ssh_command` shows the SSH command. It may take a minute for cloud-init to finish installing Nginx.

## Test
- Open the `website_url` output in a browser.
- SSH using the command shown by Terraform. Your `.pem` key must be available locally and have suitable permissions.
- If the page is not ready, wait 1–2 minutes and refresh.

## Cleanup (important)
To avoid ongoing AWS charges, remove the resources when finished:

```bash
cd terraform
terraform destroy
```

Review the plan before confirming destruction.

## Screenshots
The `screenshots/` folder contains screenshots extracted from the submitted PDF report. These document the original assignment workflow; they are not proof that a new Terraform deployment has been run.

## Notes
- The original report describes SSH access restricted to “My IP”, public HTTP access, and an Ubuntu/Nginx HTML site.
- Replace `YOUR NAME` in the website if desired (`website/index.html`).
- Terraform creates the EC2 instance and security group. It uses the key pair name you provide; it does not upload or generate your AWS private key.
