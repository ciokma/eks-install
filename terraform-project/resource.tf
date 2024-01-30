resource "tls_private_key" "mathanga" {
  algorithm = "RSA"
  rsa_bits = 4096
}


resource "aws_key_pair" "mathanga" {

  key_name   = "test-key"
  public_key = tls_private_key.mathanga.public_key_openssh
  provisioner "local-exec" {

    command = "echo '${tls_private_key.mathanga.private_key_openssh}' > ./test-key ; chmod 400 ./test-key"

  }

  provisioner "local-exec" {

    when    = destroy

    command = "rm -rf ./test-key"

  }


  tags = {

    Name = "test-key"

  }
}


resource "aws_instance" "ec2" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.mathanga.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet.1.id
  vpc_security_group_ids      = [aws_security_group.my-sg.id]
  user_data                   = file("jenkins.sh")


  tags = {
    Name = "${var.project}-Jenkins"
  }
}