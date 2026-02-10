# backend configuration with locking

terraform {
  required_version = ">= 1.14.0"

  backend "s3" {
    bucket = "mjkim134-tfstate-bucket"
    key    = "terraform/init/terraform.tfstate"
    region = "ap-northeast-2"
    encrypt = true
    use_lockfile = true
  }
}