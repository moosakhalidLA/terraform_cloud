provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
resource "aws_instance" "example" {
  ami           = data.aws_ssm_parameter.ami_id.value
  instance_type = "t2.micro"
}

