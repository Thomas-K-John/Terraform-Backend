variable "environment" {
  type        = string
  description = "The environment"
  default     = "prod"
}
variable "region" {
  type        = string
  description = "AWS region for all resources."
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Name of the project."
  default     = "Terraform Backend"
}
