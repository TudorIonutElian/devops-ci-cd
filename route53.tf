/*****************************************************
 * Data source to get the hosted zone ID
 ****************************************************/
data "aws_route53_zone" "learndevtech" {
  name         = "learndevtech.com"
  private_zone = false
}

/*****************************************************
 * Create a record for the Teamcity subdomain
 ****************************************************/
resource "aws_route53_record" "teamcity_subdomain" {
  allow_overwrite = true
  zone_id = data.aws_route53_zone.learndevtech.zone_id
  name    = "teamcity.learndevtech.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.teamcity_ec2_instance.public_ip]
}