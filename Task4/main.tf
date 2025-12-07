terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.90"
    }
  }

  required_version = ">= 1.5.0"
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.yc_zone
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_vpc_network" "this" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "public" {
  name           = var.subnet_name
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.subnet_cidr
}

resource "yandex_compute_disk" "platform" {
  name     = "${var.vm_name}-disk"
  type     = "network-ssd"
  zone     = var.yc_zone
  size     = var.vm_disk_size_gb
  image_id = data.yandex_compute_image.ubuntu.image_id
}

resource "yandex_compute_instance" "platform" {
  name = var.vm_name
  zone = var.yc_zone

  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.platform.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key_path)}"
  }

  labels = {
    project     = "future2"
    environment = "dev"
  }
}
