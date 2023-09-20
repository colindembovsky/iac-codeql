variable "resource_group_location" {
  type        = string
  default     = "southcentralus"
  description = "Location of the resource group."
}

variable "agent_count" {
  type    = number
  default = 2
}

variable "dns_prefix" {
  type    = string
  default = "cdmindaro"
}

variable "cluster_name" {
  type    = string
  default = "cdmindaro"
}

variable "resource_group_name" {
  type    = string
  default = "cd-mindaro"
}

variable "log_analytics_workspace_name" {
  type    = string
  default = "AKSLogAnalyticsWorkspace"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable "log_analytics_workspace_location" {
  type    = string
  default = "southcentralus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable "log_analytics_workspace_sku" {
  type    = string
  default = "PerGB2018"
}

variable "domain_name_label" {
  type    = string
  default = "cdmindaro"
}

variable "namespace" {
  type    = string
  default = "bikeapp"
}