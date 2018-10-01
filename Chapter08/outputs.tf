output "role" { value = "${module.flow-log-prerequisite.rolename}" }
output "loggroup" { value = "${module.flow-log-prerequisite.cloudwatch_log_group_arn}" }
output "alb_url" { value = "${module.webapp-playground.dns_name}"}
