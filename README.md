# Testing repo for learning OCI with terraform

## Authentication

For auth you need the following environment variables set:

| var name | description |
|----------|------------|
|TF_VAR_tenancy_ocid | Tenancy OCID |
|TF_VAR_user_ocid | User's OCID |
|TF_VAR_fingerprint | API fingerprint |
|TF_VAR_private_key_path | Path to TLS cert for API access |
|TF_VAR_region | name of default region |
|TF_VAR_public_ssh_key_path | path to an ssh public key for vm access |

## Functionality

Currently this create the following:

- A new Compartment for TF testing

- A Virtual  Cloud Network with:

  - Public subnet
  
  - Private subnet

  - internet gateway

  - nat gateway

  - service gateway

  - public security list

  - private security list

- A free tier ubuntu vm instance
