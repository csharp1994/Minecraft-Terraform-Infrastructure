output "aws_instance_ip_address" {
    value = aws_instance.minecraft_server.public_ip
}