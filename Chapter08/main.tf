module "flow-log-prerequisite" {
  source = "github.com/giuseppeborgese/effective_devops_with_aws__second_edition//terraform-modules//vpc-flow-logs-prerequisite"
  prefix = "devops2nd"
}
module "webapp-playground" {
  source = "github.com/giuseppeborgese/effective_devops_with_aws__second_edition//terraform-modules//webapp-playground"
  subnet_public_A = "subnet-a94cabf4"
  subnet_public_B = "subnet-54840730"
  subnet_private  = "subnet-54840730"
  vpc_id          = "vpc-3901d841"
  my_ami          = "ami-b70554c8"
  pem_key_name    = "effectivedevops"
}

module "limit_admin_WAF" {
  source       = "github.com/giuseppeborgese/effective_devops_with_aws__second_edition//terraform-modules//limit-the-admin-area"
  alb_arn      = "${module.webapp-playground.alb_arn}"
  my_office_ip = "146.241.179.87/32"
  admin_suburl = "/subdir"
}
/*
module "ddos_protection_WAF" {
  source       = "github.com/giuseppeborgese/effective_devops_with_aws__second_edition//terraform-modules//ddos_protection"
  alb_arn      = "${module.webapp-playground.alb_arn}"
  url = "subdir"
}
*/
