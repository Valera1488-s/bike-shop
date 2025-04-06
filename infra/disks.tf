resource "yandex_compute_disk" "app2-bootdisk" {
  name = "app2-bootdisk"
  type = "network-hdd"
  image_id = "${var.default_image}" 
  size = "${var.default_disk_size}"
  zone = "ru-central1-b"
}

resource "yandex_compute_disk" "db-bootdisk" {
  name = "db-bootdisk"
  type = "network-hdd"
  size = 10
  zone = "ru-central1-b"
}

resource "yandex_compute_disk" "nginx-bootdisk" {
  name = "nginx-bootdisk"
  type = "network-hdd"
  zone = "ru-central1-b"
  size = "${var.default_disk_size}"
  image_id = "${var.default_image}"
}
resource "yandex_compute_disk" "app3-bootdisk" {
  name = "app3-bootdisk"
  type = "network-hdd"
  size = 10
  zone = "ru-central1-b"
}
