provider "aws" {
  region     = var.REGION_AWS
  access_key = "my-access-key"
  secret_key = "my-secret-key"
  default_tags {
    tags = {
      Server     = "apache-web"
      Department = "online bank"
    }
  }
} 