# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool

resource "oci_containerengine_node_pool" "oke-node-pool" {
  # Required
  cluster_id         = oci_containerengine_cluster.oke-cluster.id
  compartment_id     = oci_identity_compartment.tf-compartment.id
  kubernetes_version = "v1.31.1"
  name               = "tf-sr-oke-node-pool-01"
  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = oci_core_subnet.vcn-private-subnet.id
    }
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
      subnet_id           = oci_core_subnet.vcn-private-subnet.id
    }
    # placement_configs {
    #   availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
    #   subnet_id           = oci_core_subnet.vcn-private-subnet.id
    # }
    size = 3
  }
  node_shape = "VM.Standard2.1"

  # Using image Oracle-Linux-7.x-<date>
  # Find image OCID for your region from https://docs.oracle.com/iaas/images/ 
  node_source_details {
    image_id    = "ocid1.image.oc1.uk-london-1.aaaaaaaaan4bty6bws5kcc6vfhmhpy7k2p7wbiisu7tarpkj2doe5gbednrq"
    source_type = "image"
  }

  # Optional
  initial_node_labels {
    key   = "name"
    value = "tf-sr-oke-node-pool-01"
  }
}
