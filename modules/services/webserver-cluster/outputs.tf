output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "The domain name of the load balancer"
}

data "terraform_remote_state" "data-store-mysql" {
  backend = "s3"

  config = {
    bucket = "pd-lab-terraformbucket"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"
  }
}