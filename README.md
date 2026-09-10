# AWS VPC Module

This repository contains a reusable Terraform module for creating an AWS VPC with two private subnets:

- backend subnet
- database subnet

The design is intentionally private-only and does not create a public subnet, Internet Gateway, or NAT Gateway.

## What this module creates

- VPC with CIDR `10.0.0.0/16`
- Backend private subnet: `10.0.1.0/24` in `ap-south-1a`
- Database private subnet: `10.0.2.0/24` in `ap-south-1b`
- Private route table associated with both subnets
- DNS hostnames and DNS support enabled on the VPC

## Module purpose

This module is intended to be published to a private HCP Terraform registry and then consumed by a separate root configuration that supplies environment-specific values such as region and AWS provider settings.

## Inputs

| Name | Description | Type | Default |
| --- | --- | --- | --- |
| `region` | AWS region | `string` | `ap-south-1` |
| `vpc_cidr` | VPC CIDR block | `string` | `10.0.0.0/16` |
| `backend_subnet_cidr` | Backend subnet CIDR | `string` | `10.0.1.0/24` |
| `db_subnet_cidr` | Database subnet CIDR | `string` | `10.0.2.0/24` |
| `backend_az` | Backend subnet AZ | `string` | `ap-south-1a` |
| `db_az` | Database subnet AZ | `string` | `ap-south-1b` |
| `tags` | Tags to apply to resources | `map(string)` | `{ Project = "onestack", Environment = "production" }` |

## Outputs

- `vpc_id`
- `backend_subnet_id`
- `db_subnet_id`
- `backend_subnet_cidr`
- `db_subnet_cidr`

## Example usage

```hcl
module "vpc" {
  source  = "app.terraform.io/onestack/aws_vpc/aws"
  version = "1.0.0"

  region              = "ap-south-1"
  vpc_cidr            = "10.0.0.0/16"
  backend_subnet_cidr = "10.0.1.0/24"
  db_subnet_cidr      = "10.0.2.0/24"
  backend_az          = "ap-south-1a"
  db_az               = "ap-south-1b"

  tags = {
    Project     = "onestack"
    Environment = "production"
  }
}
```

## Notes

- This module is designed for private-only networking.
- There is no public subnet and no route to the Internet Gateway.
- If you later need outbound internet access for package installation or Docker pulls, add a NAT Gateway and public subnet in a separate deployment or update the module accordingly.
- To deploy this module, use a separate root configuration with `provider "aws"` and a Terraform backend.

## Publishing

This repository includes a GitHub Actions workflow that publishes the module to the HCP Terraform private registry when changes are pushed to the `main` branch.

Required GitHub secret:

- `TF_TOKEN` — HCP Terraform API token

## License

This project is provided as-is for infrastructure provisioning use cases.
