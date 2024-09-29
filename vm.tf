resource "aws_instance" "example" {
  ami = "ami-089146c5626baa6bf"
  instance_type = "t2.nano"

  tags = {
    Name = "example-instance"
  }
}