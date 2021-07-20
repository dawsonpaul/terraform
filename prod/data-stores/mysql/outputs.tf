output "address" {
  value       = aws_db_instance.prod_example.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = aws_db_instance.prod_example.port
  description = "The port the database is listening on"
}
