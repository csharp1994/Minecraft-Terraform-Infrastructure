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

resource "aws_security_group" "server_security_group" {
  name = "Server security group"
}

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.sg_ingress_rules)

  type = "ingress"
  from_port = var.sg_ingress_rules[count.index].from_port
  to_port = var.sg_ingress_rules[count.index].to_port
  protocol = var.sg_ingress_rules[count.index].protocol
  cidr_blocks       = var.sg_ingress_rules[count.index].cidr_blocks
  description       = var.sg_ingress_rules[count.index].description
  security_group_id = aws_security_group.server_security_group.id
}

resource "aws_security_group_rule" "egress_rules" {
  count = length(var.sg_egress_rules)

  type = "ingress"
  from_port = var.sg_egress_rules[count.index].from_port
  to_port = var.sg_egress_rules[count.index].to_port
  protocol = var.sg_egress_rules[count.index].protocol
  cidr_blocks       = var.sg_egress_rules[count.index].cidr_blocks
  description       = var.sg_egress_rules[count.index].description
  security_group_id = aws_security_group.server_security_group.id
}

resource "aws_instance" "minecraft_server" {
    ami = data.aws_ami.linux.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.server_security_group.id]

    tags = {
        Name = "MinecraftServer"
        CostCenter = "Minecraft"
    }
}