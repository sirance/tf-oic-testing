variable "tenancy_ocid" {
  description = "value of <tenancy-ocid> for the compartment OCID"
}
variable "public_ssh_key_path" {
  description = "Path to the public ssh key file"

}
variable "region" {
  description = "Region where the resources will be created"
  default     = "uk-london-1"

}
