resource "aws_instance" "EC2Instance" {
  ami                    = "ami-09ba48996007c8b50"
  count                  = 2
<<<<<<< HEAD
  instance_type          = "t2.medium"
=======
  instance_type          = "t2.micro"
>>>>>>> 04a3c65 ( new files added)
  availability_zone      = "ap-south-1b"
  tenancy                = "default"
  subnet_id              = aws_subnet.Office_Public.id
  ebs_optimized          = false
  vpc_security_group_ids = [aws_security_group.Test_SG.id]
  source_dest_check      = true
  root_block_device {
    volume_size           = 10
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = {
    name = "My_EC2"
  }
}