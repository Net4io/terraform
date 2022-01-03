# create elastic IP Address and attach it
# variable to set instance name


resource "aws_instance" "net4io" {
    ami = "ami-0d49e075a6e6db2a1"
    instance_type = "t2.micro"
    key_name = "net4io"
    security_groups = [aws_security_group.instancesg.name]

    tags = {
      Name = "${var.instance_name}"
    }
}

output "instance_public_ip" {
    description = "AWS Instance public/elastic IP"
    value = aws_instance.net4io.public_ip
}
