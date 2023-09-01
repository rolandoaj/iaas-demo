provider "aws" {
  region     = var.REGION_AWS
  access_key = "your-access-key"
  secret_key = "your-secret-key"
  default_tags {
    tags = {
      Server     = "apache-web"
      Department = "online bank"
    }
  }
} 