# Terraform deploy steps

1. Install Terraform and AWS CLI.
2. Run `aws configure` and provide credentials locally (never paste credentials into this repository).
3. Copy `terraform.tfvars.example` to `terraform.tfvars`.
4. Set `key_name` to an existing EC2 key pair in the chosen AWS region.
5. Set `my_ip_cidr` to your public IPv4 address followed by `/32`.
6. Run:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

7. Open the `website_url` output in a browser.
8. When finished, run `terraform destroy` and confirm after reviewing the plan.

This package has not run `terraform apply` against your AWS account. Verify region, key pair, account permissions, and potential AWS charges before deployment.
