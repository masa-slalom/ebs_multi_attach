# Outputs file

output "public_key_pem" {
  value = tls_private_key.hashicat.public_key_pem
}

output "private_key_pem" {
  value     = tls_private_key.hashicat.private_key_pem
  sensitive = true
}

output "ssh_connection" {
  value = <<EOF

To connect to hashicat1:
ssh -i ${local.private_key_filename}.pem ubuntu@${aws_instance.hashicat1.public_dns}

To connect to hashicat2:
ssh -i ${local.private_key_filename}.pem ubuntu@${aws_instance.hashicat2.public_dns}

EOF
}
