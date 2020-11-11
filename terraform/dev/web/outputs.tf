# output "vpc_subnets" {
#   value       = module.alb_ansible.public_subnet
#   description = "subnet list"
# }

# # output "asg_taget_group" {
# #   value       = module.asg_ansible.asg_taget_group
# #   description = "target group"
# # }

output "public_dns_lb" {
  value = module.asg_ansible.public_dns_lb
}
