output "vm_external_ip_address" {
  description = "Public IP address of the Future 2.0 data platform VM"
  value       = yandex_compute_instance.platform.network_interface[0].nat_ip_address
}

output "vm_internal_ip_address" {
  description = "Internal IP address of the Future 2.0 data platform VM"
  value       = yandex_compute_instance.platform.network_interface[0].ip_address
}

output "subnet_id" {
  description = "ID of the public subnet where the VM is located"
  value       = yandex_vpc_subnet.public.id
}

output "network_id" {
  description = "ID of the VPC network used by the solution"
  value       = yandex_vpc_network.this.id
}

output "vm_name" {
  description = "Name of the created VM"
  value       = yandex_compute_instance.platform.name
}
