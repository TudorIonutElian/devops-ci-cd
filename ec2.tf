/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "teamcity_ec2_instance" {
  ami           = data.aws_ami.teamcity_ami_filter.id
  instance_type = var.teamcity_instance_type
  key_name      = var.teamcity_key_name 
  user_data     = file("scripts/teamcity_entry.sh")

  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "~/docker-compose.yml"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("teamcity-key.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "teamcity-ec2-instance"
  }
}