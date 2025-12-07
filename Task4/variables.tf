variable "yc_token" {
  description = "Yandex Cloud OAuth or IAM token with permission to manage resources in the target folder"
  type        = string
}

variable "yc_cloud_id" {
  description = "Yandex Cloud cloud ID"
  type        = string
}

variable "yc_folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "yc_zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "network_name" {
  description = "Name of the VPC network for Future 2.0"
  type        = string
  default     = "future2-vpc"
}

variable "subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "future2-public-subnet"
}

variable "subnet_cidr" {
  description = "IPv4 CIDR blocks for the public subnet"
  type        = list(string)
  default     = ["10.10.0.0/24"]
}

variable "vm_name" {
  description = "Name of the VM that will host the data platform stack"
  type        = string
  default     = "future2-data-platform-dev"
}

variable "vm_cores" {
  description = "Number of vCPUs for the VM"
  type        = number
  default     = 4
}

variable "vm_memory" {
  description = "Amount of RAM for the VM in GB"
  type        = number
  default     = 8
}

variable "vm_disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 50
}

variable "ssh_user" {
  description = "Linux user name for SSH access"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key used to connect to the VM"
  type        = string
  default     = "/home/ubuntu/.ssh/id_ed25519.pub"
}
