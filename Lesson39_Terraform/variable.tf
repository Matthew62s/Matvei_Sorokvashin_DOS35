variable "region" {
        description = "AWS region"
        default     = "eu-north-1"
}

variable "instance_type" {
        description = "EC2 instance type"
        default     = "t3.micro"
}

variable "AWS_access" {
        description = "AWS ami access key"
        default     = "************"
}

variable "AWS_secret" {
        description = "AWS ami secret key"
        default     = "*************"
}
