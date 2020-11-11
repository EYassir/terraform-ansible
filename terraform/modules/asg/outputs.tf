# output "private_subnet" {
#   description = "subnet list"
#   value       = data.aws_subnet_ids.custom_vpc_subnets_ids
# }

output "asg_taget_group" {
  value = aws_lb_target_group.tf_wp_tg
}
