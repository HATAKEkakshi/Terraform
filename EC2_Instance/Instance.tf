resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id
  instance_type          = "t3.micro"
  key_name               = "dove-key"
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = "us-east-1a"
  count = 5
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}

resource "aws_ec2_instance_state" "web_state" {
  count       = length(aws_instance.web)
  instance_id = aws_instance.web[count.index].id
  state       = "running"
}