output "jenkins_ip" {
  description = "Jenkins' public ip"
  value       = aws_instance.jenkins.public_ip
}

output "deploy_ip" {
  description = "Deploy's public ip"
  value       = aws_instance.deploy.public_ip
}
