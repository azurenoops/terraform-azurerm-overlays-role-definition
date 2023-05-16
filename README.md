# Azure Custom Role Definitions Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-template/azurerm/)

This Overlay terraform module can create one or many azure custom role definitions to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

This module can be used in a SCCA compliant Network.

For more information, please read the [SCCA documentation]("https://www.cisa.gov/secure-cloud-computing-architecture").

## Contributing

If you want to contribute to this repository, feel free to to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Resources Supported

This module supports the following resources:

- [Custom Role Definition](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/custom_role_definition)

## Module Usage

```terraform
# Azurerm provider configuration
provider "azurerm" {
  features {}
}

module "custom_role_definitions" {
  source = "git::"

}
```

## Custom Role Definitions

This module can create one or many custom role definitions. The following example will create a custom role definition for a `Reader` role.

**NOTE:** if no `scope` or `assignable_scopes` are defined then the current subscription ID will be used as the scope and assignable scopes.  

```terraform

custom_role_definitions = [
  {
    role_definition_name = "CUSTOM - App Settings Reader"
    scope                = <SCOPE> ## This setting is optional. (If not defined current subscription ID is used).
    description          = "Allows view access for Azure Sites Configuration"
    permissions = {
      actions          = ["Microsoft.Web/sites/config/list/action", "Microsoft.Web/sites/config/read"]
      data_actions     = []
      not_actions      = []
      not_data_actions = []
    }
    assignable_scopes = [<SCOPE1>, <SCOPE2>, <SCOPE3>] ## This setting is optional. (If not defined current subscription ID is used).
  },  
]

```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurenoopsutils"></a> [azurenoopsutils](#requirement\_azurenoopsutils) | ~> 1.0.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.22 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_definition.custom_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_tags"></a> [add\_tags](#input\_add\_tags) | Map of custom tags. | `map(string)` | `{}` | no |
| <a name="input_custom_role_definitions"></a> [custom\_role\_definitions](#input\_custom\_role\_definitions) | List of custom role definitions to be created. | `list(any)` | n/a | yes |
| <a name="input_default_tags_enabled"></a> [default\_tags\_enabled](#input\_default\_tags\_enabled) | Option to enable or disable default tags. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_definition_ids"></a> [role\_definition\_ids](#output\_role\_definition\_ids) | List of Role Definition IDs. |
| <a name="output_role_definition_resource_ids"></a> [role\_definition\_resource\_ids](#output\_role\_definition\_resource\_ids) | List of Azure Resource Manager IDs for the resources. |
<!-- END_TF_DOCS -->