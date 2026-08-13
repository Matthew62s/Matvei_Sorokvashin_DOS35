## Установим opentofu
```
# Download the installer script:
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
# Alternatively: wget --secure-protocol=TLSv1_2 --https-only https://get.opentofu.org/install-opentofu.sh -O install-opentofu.sh

# Give it execution permissions:
chmod +x install-opentofu.sh

# Please inspect the downloaded script

# Run the installer:
./install-opentofu.sh --install-method deb

# Remove the installer:
rm -f install-opentofu.sh
```

## Задание
Создадим главный конфиг main.tf с такой конфигурацией.

```
provider "aws" {
        access_key = var.AWS_access
        secret_key = var.AWS_secret
        region     = var.region
}

resource "aws_instance" "AWS_machine" {
        ami           = "ami-0734cbe7f841a2e9b"
        instance_type = var.instance_type
        tags = {
                Name = "My AWS server"
                Owner = "Matvei"
                Project = "Terraform"
        }
}

```

Создадим variable.tf с такой конфигурацией.

```
variable "region" {
        description = "AWS region"
        default     = "eu-north-1"
}

variable "instance_type" {
        description = "EC2 instance type"
        default     = "t2.micro"
}

variable "AWS_access" {
        description = "AWS ami access key"
        default     = "******************"
}

variable "AWS_secret" {
        description = "AWS ami secret key"
        default     = "******************"
}
```

Для скачивания провайдера AWS с yandex-mirror изменим ~/.tofurc на
```
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.opentofu.org/*/*"]
  }
  direct {
    exclude = ["registry.opentofu.org/*/*"]
  }
}
```

Применяем tofu apply
Вывод:
```
OpenTofu used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

OpenTofu will perform the following actions:

  # aws_instance.AWS_machine will be created
  + resource "aws_instance" "AWS_machine" {
      + ami                                  = "ami-0734cbe7f841a2e9b"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "eu-north-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name"    = "My AWS server"
          + "Owner"   = "Matvei"
          + "Project" = "Terraform"
        }
      + tags_all                             = {
          + "Name"    = "My AWS server"
          + "Owner"   = "Matvei"
          + "Project" = "Terraform"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)

      + secondary_network_interface (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  OpenTofu will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.AWS_machine: Creating...
aws_instance.AWS_machine: Still creating... [10s elapsed]
aws_instance.AWS_machine: Creation complete after 13s [id=i-0a591303daf85135e]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
<img width="1727" height="258" alt="Screenshot_2" src="https://github.com/user-attachments/assets/4c5fdb8e-b9c9-4022-8315-85eb14c60d11" />


