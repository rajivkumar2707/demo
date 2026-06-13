#this is test var code
variable "employees" {
  type = set(object({
    name  = string
    role  = string
    email = string
  }))
   default = [
    {
      name  = "Alice"
      role  = "HR"
      email = "alice@example.com"
    },
    {
      name  = "Bob"
      role  = "Recruiter"
      email = "bob@example.com"
    }
  ]
}
 resource "null_resource" "employees" {
  for_each = {
    for emp in var.employees : emp.email => emp
  }
 
  triggers = {
    name = each.value.name
    role = each.value.role
  }
}
output "printvalue" {
value = null_resource.employees
}
