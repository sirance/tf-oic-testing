terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.23.0"
    }
  }
}

resource "oci_identity_compartment" "tf-compartment" {
  # Required
  compartment_id = var.tenancy_ocid
  description    = "Compartment for Terraform resources."
  name           = "tf-sr-01"
}

# resource "oci_core_instance" "ubuntu_instance" {
#   # Required
#   availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
#   compartment_id      = oci_identity_compartment.tf-compartment.id
#   shape               = "VM.Standard.E2.1.Micro"
#   source_details {
#     source_id   = "ocid1.image.oc1.uk-london-1.aaaaaaaakwergew2qtbvebnso6bypojbbggrmoi4skrxsofmqevwfnei5lpa"
#     source_type = "image"
#   }

#   # Optional
#   display_name = "tf-sr-vm-01"
#   create_vnic_details {
#     assign_public_ip = true
#     subnet_id        = oci_core_subnet.vcn-public-subnet.id
#   }
#   metadata = {
#     ssh_authorized_keys = file(var.public_ssh_key_path)
#   }
#   preserve_boot_volume = false
# }
