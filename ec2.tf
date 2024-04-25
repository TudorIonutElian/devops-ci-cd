/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "teamcity_ec2_instance" {
  ami           = data.aws_ami.teamcity_ami_filter.id
  instance_type = var.teamcity_instance_type
  key_name      = aws_key_pair.kp.key_name
  user_data     = file("scripts/teamcity_entry.sh")

  tags = {
    Name = "teamcity-ec2-instance"
  }
}