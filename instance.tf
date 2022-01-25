# create elastic IP Address and attach it
# variable to set instance name


resource "aws_instance" "net4io" {
    ami = "ami-09a56048b08f94cdf"
    instance_type = "g4dn.xlarge"
    #instance_type = "t2.micro"
    key_name = "net4io"

    security_groups = [aws_security_group.instancesg.name]

    root_block_device {
         volume_type = "gp2"
         volume_size = 40
      }

    tags = {
      Name = "${var.instance_name}"
    }
}

output "instance_private_ip" {
    description = "AWS Instance private IP"
    value = aws_instance.net4io.private_ip
}
