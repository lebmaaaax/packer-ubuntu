token     = "replace-with-oauth-or-iam-token"
folder_id = "replace-with-folder-id"
subnet_id = "replace-with-subnet-id"
zone      = "ru-central1-a"

image_name        = "ubuntu-2204-stable"
image_family      = "ubuntu-2204-stable"
image_description = "Ubuntu 22.04 stable"

source_image_family = "ubuntu-2204-lts"
ssh_username        = "ubuntu"
use_ipv4_nat        = true

disk_type     = "network-ssd"
disk_size_gb  = 20
platform_id   = "standard-v3"
cores         = 2
memory_gb     = 2
core_fraction = 100
preemptible   = false
