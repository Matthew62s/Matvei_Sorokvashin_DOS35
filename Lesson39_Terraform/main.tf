provider "aws" {
        access_key = var.AWS_access
        secret_key = var.AWS_secret
        region     = var.region
}

resource "aws_instance" "AWS_machine" {
	ami           = "data.aws_ami.ubuntu.id"
	instance_type = var.instance_type
	tags = { 
		Name = "My AWS server"
		Owner = "Matvei"
		Project = "Terraform"
	}
}


