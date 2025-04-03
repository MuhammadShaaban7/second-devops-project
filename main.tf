terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name = "simple-devops-app:latest"
}

resource "docker_container" "app_container" {
  image = docker_image.app.name  # غيرنا "latest" لـ "name"
  name  = "simple-devops-container"
  ports {
    internal = 3000
    external = 3000
  }
}
