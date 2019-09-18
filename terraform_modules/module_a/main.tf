
variable "port" {
  default = 8080
}


resource "local_file" "foo" {
  content  = templatefile("${path.module}/template_a.tmpl", { port = var.port, ip_addrs = ["10.0.0.1", "10.0.0.2"] })
  filename = "${path.module}/foo.bar"
}

output "port" {
  value = var.port
}
