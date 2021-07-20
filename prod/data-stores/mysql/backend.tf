terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "pd-lab-terraformbucket"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "pd-lab-dynamodb-lock"
    encrypt        = true
  }
}