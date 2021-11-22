# create elastic IP Address and attach it
# variable to set instance name
variable "instance_name" {
        description = "Instance Name for the client"
        type = string
    }


resource "aws_instance" "net4io" {
    ami = "ami-09a56048b08f94cdf"
    instance_type = "t2.micro"
    security_groups = [ "dynamic-sg" ]

    tags = {
      Name = "${var.instance_name}"
    }
}

output "instance_public_ip" {
    description = "AWS Instance public/elastic IP"
    value = aws_instance.net4io.public_ip
}