source "yandex" "ubuntu" {
  token               = var.token
  folder_id           = var.folder_id
  subnet_id           = var.subnet_id
  zone                = var.zone
  use_ipv4_nat        = var.use_ipv4_nat
  image_name          = "${var.image_name}-${formatdate("YYYY-MM-DD-hhmmss", timestamp())}"
  image_family        = var.image_family
  image_description   = var.image_description
  source_image_family = var.source_image_family
  ssh_username        = var.ssh_username
  disk_type           = var.disk_type
  disk_size_gb        = var.disk_size_gb
  platform_id         = var.platform_id
  instance_cores      = var.cores
  instance_mem_gb     = var.memory_gb
  instance_core_fraction = var.core_fraction
  preemptible         = var.preemptible
}

build {
  name    = "ubuntu-2204-golden-yc"
  sources = ["source.yandex.ubuntu"]

  provisioner "shell" {
    execute_command = "sudo -S env {{ .Vars }} bash '{{ .Path }}'"
    scripts = [
      "${abspath(path.root)}/scripts/01-system-update.sh",
      "${abspath(path.root)}/scripts/02-base-packages.sh",
      "${abspath(path.root)}/scripts/03-cloud-init.sh",
      "${abspath(path.root)}/scripts/04-ssh-hardening.sh",
      "${abspath(path.root)}/scripts/05-firewall.sh",
      "${abspath(path.root)}/scripts/06-journald.sh",
      "${abspath(path.root)}/scripts/08-smoke-test.sh",
      "${abspath(path.root)}/scripts/07-cleanup.sh"
    ]
  }
}
