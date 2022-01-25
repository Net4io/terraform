# create elastic IP Address and attach it
# variable to set instance name


resource "aws_instance" "net4io" {
    ami = "ami-09a56048b08f94cdf"
    instance_type = "g4dn.xlarge"
    key_name = "net4io"

    security_groups = [aws_security_group.instancesg.name]

    ebs_block_device  {
      device_name = "/dev/sdh"
      volume_type = "gp2"
      volume_size = "30"
    }

    tags = {
      Name = "${var.instance_name}"
    }
}

output "instance_private_ip" {
    description = "AWS Instance private IP"
    value = aws_instance.net4io.private_ip
}
