provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "pd-lab-terraformbucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "pd-lab-dynamodb-lock"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "pd-lab-terraformbucket"
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "pd-lab-dynamodb-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


