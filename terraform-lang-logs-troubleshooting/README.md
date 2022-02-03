# Learn Terraform Troubleshooting

This is a companion repository for the [Learn Terraform Troubleshooting](https://learn.hashicorp.com/tutorials/terraform/troubleshooting-workflow) tutorial on HashiCorp Learn. Follow along to learn more about configuration language troubleshooting.


###
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_instance" "web_app" 
  user_data              = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

resource "aws_security_group" "sg_ping" 
resource "aws_security_group" "sg_8080" 
resource "aws_security_group_rule" "allow_localhost_8080" 
resource "aws_security_group_rule" "allow_localhost_ping" 

