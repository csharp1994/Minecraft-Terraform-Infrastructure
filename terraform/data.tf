data "aws_ami" "linux" {
    most_recent = true
    
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }

    filter {
      name = "owner-alias"
      values = ["amazon"]
    }
}