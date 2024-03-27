provider "postgresql" {
  host             = var.provider_config["host"]
  port             = var.provider_config["port"]
  database         = var.provider_config["database"]
  username         = var.provider_config["username"]
  password         = var.provider_pass
  sslmode          = var.provider_config["sslmode"]
  connect_timeout  = var.provider_config["connect_timeout"]
  expected_version = 11
}

terraform {
  backend "local" {}
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.13.0"
    }
  }
}
