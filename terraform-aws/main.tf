resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "${var.environment}-${var.application_name}-vpc"
    Location = "${var.location}"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-${var.application_name}-public_subnet"
    Location = "${var.location}"
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Name = "${var.environment}-${var.application_name}-igw"
    Location = "${var.location}"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-${var.application_name}-route-table-public"
    Location = "${var.location}"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id

}



resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 51820
    to_port     = 51820
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-${var.application_name}-web-sg"
    Location = "${var.location}"
    Environment = "${var.environment}"
  }
}

resource "aws_key_pair" "pskirde" {
  key_name   = "pskirde-dev-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1hqLBO9/XaymjShXE4Q5aUkhgBdKibRZCMN1TbUT5IacKAl9wsmcEhnD0wzGo7TLiG28l/6WKQROv95lBqVG75SOqT5YPtP0tkdgfEaL2M68kjkKj8R3TTvq4mElx8K3RD6DibKOCw9Ih7NjTnTbl7agAMLxxXRkotgFOo0a8HaqCzgm3jdRnks207xgvnV1FeeCHNRuiENPD+KAjO9giRiOvmcxhOdGPJ5KIS/9kMZiW4ZBUoYzhE9YJUMVuJUeEhbUCkeueWEnmgH+Ue+mAuwgQQaEMLDMCq2cpJoxp4/BiZAzfKyS22zGhjjw7zoU/16++vKeJY/97A0g5oOjKlE+wd1nmWTpdbJgJolPen7MRh6Ql0SKLwgIzG2C1eoAzAXGmBhqx7jo82NaUU8a8qE8kIedPRu3Q5FrlcWVmud5TF10q2TDR1hsMLVpkbw+4E7CxsEb2RIBEhtPPw1w2Czo35a/MFzcEl2ITeohtXm2ySCEkdZkqLv9Zt8T9lBU= pascal@Pascals-Air"
}

resource "aws_instance" "public_instance" {
  ami           = "ami-0b0c5a84b89c4bf99"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.pskirde.key_name

  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]

  tags = {
    Name = "${var.environment}-${var.application_name}-public-wireguard-instance"
    Location = "${var.location}"
    Environment = "${var.environment}"
  }
}
