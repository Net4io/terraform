terraform {
  backend "s3" {
    bucket = "net4io-terraform-state"
    key    = "instance/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "terraform"
  }
}
