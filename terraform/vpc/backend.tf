# backend configuration

terraform {
  backend "s3" {
    bucket = "mjkim134-tfstate-bucket"
    key    = "terraform/vpc/terraform.tfstate"
    region = "ap-northeast-2"

    use_lockfile = true
  }
}