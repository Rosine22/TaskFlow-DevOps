variable "resource_group_name" {
  default = "taskflow-rg"
}

variable "location" {
  default = "East US"
}

variable "app_service_plan_name" {
  default = "taskflow-plan"
}

variable "app_name" {
  default = "taskflow-app"
}

variable "acr_name" {
  default = "taskflowacr1234" # Must be globally unique
}

variable "image_name" {
  default = "taskflow-backend"
}
