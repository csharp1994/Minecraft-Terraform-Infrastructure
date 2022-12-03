instance_type = "t2.small" // TODO parameterize

sg_ingress_rules = [ {
      cidr_blocks = ["${var.owner_ip}/32"]
      description = "SSH Ingress"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Minecraft Ingress"
      from_port = 25565
      protocol = "tcp"
      to_port = 25565
    } 
]


sg_egress_rules = [ {
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allows outbound traffic to anywhere"
  from_port = 0
  protocol = "all"
  to_port = 0
} ]