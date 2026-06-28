terraform {
  required_version = ">= 1.5.0"
}

variable "environment" {
  type = string
}

resource "local_file" "workspace_file" {
  filename = "${path.module}/${terraform.workspace}.txt"
  content  = "Current workspace: ${terraform.workspace}"
}
