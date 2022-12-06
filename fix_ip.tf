#Fix IP
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eip#search-by-public-ip-ec2-classic-or-vpc
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association

data "aws_ami_ids" "ubuntu" {
    owners = ["099720109477"]
  
    filter {
      name   = "name"
      values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
    }
  }

resource "aws_eip" "eip_project1" {
    vpc = true
    tags = {
      Name = "EC2-fix-IP"
    }
}

data "aws_eip" "eip_project1" {
    depends_on = [
    aws_eip.eip_project1
  ]
    tags = {
    Name = "EC2-fix-IP"
  }
}

resource "aws_eip_association" "eip_assoc_appserv" {
  instance_id   = aws_instance.app_serv.id
  allocation_id = data.aws_eip.eip_project1.id
}

resource "aws_instance" "app_serv" {
  ami           = data.aws_ami_ids.ubuntu.id
#  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
    Name    = "EC2-fix-IP"
    Creator = "Sukkarin"
  }
}



