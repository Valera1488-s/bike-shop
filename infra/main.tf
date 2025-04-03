terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-d"
  service_account_key_file = "/home/vvv/key.json"
  cloud_id  = "b1grs46moqvvmj93so4m"
  folder_id = "b1gmaap4gg7m6e17glpp"
}


