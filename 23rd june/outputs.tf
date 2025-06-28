output "master_public_ip" {
  value = aws_instance.jenkins-master-ec2-sivanithin.public_ip
}

output "agent_public_ip" {
  value = aws_instance.jenkins-agent-ec2-sivanithin.public_ip
}
