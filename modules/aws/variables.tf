# AWS-specific variables for Tyche Tagging
# These variables are passed from the root module

variable "tags" {
  description = "Standard tags from root module"
  type        = map(string)
  default     = {}
}

variable "tags_compute" {
  description = "Compute-specific tags from root module"
  type        = map(string)
  default     = {}
}

variable "tags_storage" {
  description = "Storage-specific tags from root module"
  type        = map(string)
  default     = {}
}

variable "tags_database" {
  description = "Database-specific tags from root module"
  type        = map(string)
  default     = {}
}

variable "tags_network" {
  description = "Network-specific tags from root module"
  type        = map(string)
  default     = {}
}
