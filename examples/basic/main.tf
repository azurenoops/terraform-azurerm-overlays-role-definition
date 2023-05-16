

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

module "mod_custom_roles" {
  source                  = "../.."
  custom_role_definitions = [
  {
    role_definition_name = "Custom - Network Operations (NetOps)"
    scope                = data.azurerm_client_config.current.subscription_id  
    description          = "Platform-wide global connectivity management: virtual networks, UDRs, NSGs, NVAs, VPN, Azure ExpressRoute, and others."
    permissions = {
      actions          = [
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read",
      "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write",
      "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete",
      "Microsoft.Network/virtualNetworks/peer/action",
      "Microsoft.Resources/deployments/operationStatuses/read",
      "Microsoft.Resources/deployments/write",
      "Microsoft.Resources/deployments/read"
    ]
      data_actions     = []
      not_actions      = []
      not_data_actions = []
    }
    assignable_scopes = [["${module.mod_management_group.0.management_groups["/providers/Microsoft.Management/managementGroups/platforms"].id}"]] ## This setting is optional. (If not defined current subscription ID is used).
  }
]
}