#bucket creation
resource "aws_s3_bucket" "paviS3" {
  bucket = "pavi-bucket-from-githubaction"
  tags = {
    Name        = "pavi-bucket-from-githubaction"
    Createdby   = "pavi"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket = "pavi-terraform-states"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "pavi-terra-stlock"
    encrypt = true
  }
}
