terraform {
  backend "s3" {
    bucket  = "rs-tfstste"
    key     = "state/terraform.tfstate"
    region  = "eu-north-1"
    encrypt = true
  }
}
