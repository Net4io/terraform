# create elastic IP Address and attach it
# variable to set instance name
variable "instance_name" {
        description = "Instance Name for the client"
        type = string
    }


resource "aws_instance" "net4io" {
    ami = "ami-0a19ee9fe8c518fbf"
    instance_type = "t2.micro"
    key_name = "net4io"

    tags = {
      Name = "${var.instance_name}"
    }
}

output "instance_private_ip" {
    description = "AWS Instance private IP"
    value = aws_instance.net4io.private_ip
}
