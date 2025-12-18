variable "nics" {
  type = map(object({
    nic_name    = string
    rg_name     = string
    location    = string
    vnet_name   = string
    subnet_name = string

    ip_configurations = map(object({
      ip_config_name        = string
      private_ip_allocation = string
      private_ip_address    = optional(string)
      primary               = optional(bool)
      public_ip_name        = optional(string) # 👈 bas naam pass karna hai
    }))
  }))
}

variable "pip_ids" {
  type = map(string)
}




















