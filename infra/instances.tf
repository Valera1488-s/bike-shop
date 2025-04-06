resource "yandex_compute_instance" "app1" {
  zone = "ru-central1-b"
  name = "app1"  

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.app2-bootdisk.id
  }
  
  network_interface {
    subnet_id = var.default_subnet
    nat       = true
  }

  metadata = {
    user-data = "${file("./admin_uxer.txt")}" 
  }

  labels = {
    role = "app"
  }

   provisioner "local-exec" {
     command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' /home/vvv/Valeron1487/bike-shop/infra/ansible/app.yml"
   }
}


resource "yandex_compute_instance" "app2" {
  zone = "ru-central1-b"
  name = "app2"

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

  labels = {
    role = "app"
  }  

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' /home/vvv/Valeron1487/bike-shop/infra/ansible/app.yml"
  }
}

resource "yandex_compute_instance" "db" {
  zone = "ru-central1-b"
  name = "db"

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
  
  labels = {
    role = "db"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' /home/vvv/Valeron1487/bike-shop/infra/ansible/db.yml"
  }
}

resource "yandex_compute_instance" "proxy" {
  zone = "ru-central1-b"
  name = "proxy"

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
  
  labels = {
    role = "proxy"
  }
  
  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.network_interface.0.nat_ip_address},' /home/vvv/Valeron1487/bike-shop/infra/ansible/proxy.yml"
  }
}
