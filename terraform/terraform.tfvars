instance_type = "t2.small" // TODO parameterize

minecraft_server_url = "https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar"

owner_ip = "24.98.230.114" // TODO parameterize

region = "us-east-1" // TODO parameterize

sg_ingress_rules = [ {
      cidr_blocks = ["24.98.230.114/32"] // TODO parameterized
      description = "SSH ingress traffic from server owner"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Minecraft ingress traffic from players"
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