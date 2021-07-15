variable "ecr_server" {
    type = string
    default = "123456789.dkr.ecr.eu-west-1.amazonaws.com"
}

source "docker" "packerimage" {
    image = "jenkins/inbound-agent:latest"
    commit = true
    exec_user = "root"
}
build {
    sources = ["source.docker.packerimage"]
    provisioner "file" {
        source = "install.sh"
        destination = "/tmp/install.sh"
    }
    provisioner "shell" {
        inline = ["/tmp/install.sh"]
    }
    post-processors {
        post-processor "docker-tag" {
            repository = "${var.ecr_server}/packer"
            tags = ["latest"]
        }
        post-processor "docker-push" {
            ecr_login = true
            login_server = "${var.ecr_server}"
        }
    }
}
