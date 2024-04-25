/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "cloudwatch_ec2_instances" {
  ami           = data.aws_ami.teamcity_ami_filter.id
  instance_type = var.teamcity_instance_type
  key_name      = var.teamcity_key_name 

  tags = {
    Name = "teamcity-ec2-instance"
  }
}