variable "token" {
  type        = string
  description = "OAuth token or IAM token used to authenticate in Yandex Cloud."
  sensitive   = true
}

variable "folder_id" {
  type        = string
  description = "Folder ID where the temporary VM and resulting image will be created."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the temporary build VM."
}

variable "zone" {
  type        = string
  description = "Availability zone for the temporary build VM, for example ru-central1-a."
}

variable "image_name" {
  type        = string
  description = "Base name for the generated image."
}

variable "image_family" {
  type        = string
  description = "Image family used to reference the latest built image."
}

variable "image_description" {
  type        = string
  description = "Description stored with the resulting image."
  default     = "Ubuntu 22.04 golden image baseline for Yandex Cloud"
}

variable "source_image_family" {
  type        = string
  description = "Public source image family used as the build base."
  default     = "ubuntu-2204-lts"
}

variable "ssh_username" {
  type        = string
  description = "SSH user used by Packer during provisioning."
  default     = "ubuntu"
}

variable "use_ipv4_nat" {
  type        = bool
  description = "Whether to assign a public IPv4 address to the temporary build VM."
  default     = true
}

variable "disk_type" {
  type        = string
  description = "Disk type for the temporary build VM."
  default     = "network-ssd"
}

variable "disk_size_gb" {
  type        = number
  description = "Boot disk size in GB for the temporary build VM."
  default     = 20
}

variable "platform_id" {
  type        = string
  description = "Platform for the temporary build VM."
  default     = "standard-v3"
}

variable "cores" {
  type        = number
  description = "CPU core count for the temporary build VM."
  default     = 2
}

variable "memory_gb" {
  type        = number
  description = "Memory in GB for the temporary build VM."
  default     = 2
}

variable "core_fraction" {
  type        = number
  description = "Guaranteed CPU fraction for the temporary build VM."
  default     = 100
}

variable "preemptible" {
  type        = bool
  description = "Whether to use a preemptible VM for the build."
  default     = false
}
