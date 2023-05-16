# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.


##################################################
# VARIABLES                                      #
##################################################
variable "custom_role_definitions" {
  type        = list(any)
  description = "List of custom role definitions to be created."
}