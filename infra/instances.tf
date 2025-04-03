resource "yandex_compute_instance" "app1" {
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.app2-bootdisk.id
  }
  
  network_interface {
    subnet_id = "e9b8hescbr0nq5ou6gen"
    nat       = true
  }

  metadata = {
    user-data = "${file("./admin_uxer.txt")}" 
  }
   provisioner "local-exec" {
     command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' ../ansible/app.yml"
   }
}


resource "yandex_compute_instance" "app2" {
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.app3-bootdisk.id
  }

  network_interface {
    subnet_id = var.default_subnet
    nat       = true
  }

  metadata = {
    user-data = file("./admin_uxer.txt")
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' ../ansible/app.yml"
  }
}

resource "yandex_compute_instance" "db" {
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.db-bootdisk.id
  }

  network_interface {
    subnet_id = var.default_subnet
    nat       = true
  }

  metadata = {
    user-data = file("./admin_uxer.txt")
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' ../ansible/db.yml"
  }
}

resource "yandex_compute_instance" "proxy" {
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.nginx-bootdisk.id
  }

  network_interface {
    subnet_id = var.default_subnet
    nat       = true
  }

  metadata = {
    user-data = file("./admin_uxer.txt")
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' ../ansible/proxy.yml"
  }
}
