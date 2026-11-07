resource "aws_instance" "user" {
    ami = "ami-0c230065b91270bc6"
    instance_type = "t3.medium"
    subnet_id = "subnet-01134070a41b7710a"
    vpc_security_group_ids = [ "sg-0e960cd7944124a17" ]
    tags = {
        Name = "user"
    }
}