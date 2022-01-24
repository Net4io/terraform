# create elastic IP Address and attach it
# variable to set instance name


resource "aws_instance" "net4io" {
    ami = "ami-0d49e075a6e6db2a1"
    instance_type = "g4dn.xlarge"
    key_name = "net4io"
    security_groups = [aws_security_group.instancesg.name]

    tags = {
      Name = "${var.instance_name}"
    }
}

output "instance_private_ip" {
    description = "AWS Instance private IP"
    value = aws_instance.net4io.private_ip
}
