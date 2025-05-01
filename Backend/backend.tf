terraform {
  backend "s3" {
    bucket = "terraform-backend-state-hemant-curadocs"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}