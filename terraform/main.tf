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

  type = "egress"
  from_port = var.sg_egress_rules[count.index].from_port
  to_port = var.sg_egress_rules[count.index].to_port
  protocol = var.sg_egress_rules[count.index].protocol
  cidr_blocks       = var.sg_egress_rules[count.index].cidr_blocks
  description       = var.sg_egress_rules[count.index].description
  security_group_id = aws_security_group.server_security_group.id
}

resource "aws_key_pair" "home" {
  key_name = "Home"
  public_key = var.owner_public_key
}

resource "aws_instance" "minecraft_server" {
    ami = data.aws_ami.linux.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.server_security_group.id]
    associate_public_ip_address = true
    key_name = aws_key_pair.home.key_name

    user_data = <<-EOF
     #!/bin/bash
      sudo yum -y update
      sudo rpm --import https://yum.corretto.aws/corretto.key
      sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
      sudo yum install -y java-17-amazon-corretto-devel.x86_64
      wget -O server.jar ${var.minecraft_server_url}
      java -Xmx1024M -Xms1024M -jar server.jar nogui
      sed -i 's/eula=false/eula=true/' eula.txt
      java -Xmx1024M -Xms1024M -jar server.jar nogui
      EOF

    tags = {
        Name = "MinecraftServer"
        CostCenter = "Minecraft"
    }
}