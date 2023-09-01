output "server_public_ipv4" {
  description = "Public ip to connect"
  value       = aws_eip.apache_eip.public_ip
}

output "instance_id" {
  description = "EC2 id instance"
  value       = aws_instance.apache-server.id
}

output "public_dns" {
  description = "DNS public to access"
  value       = aws_eip.apache_eip.public_dns
} 