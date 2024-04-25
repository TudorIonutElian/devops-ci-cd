resource "tls_private_key" "teamcity_private_key" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "aws_key_pair" "kp" {
  key_name   = "teamcity_key_pair"      
  public_key = tls_private_key.teamcity_private_key.public_key_openssh

  provisioner "local-exec" { 
    command = "echo '${tls_private_key.teamcity_private_key.private_key_pem}' > ./teamcity_key_pair.pem"
  }
}