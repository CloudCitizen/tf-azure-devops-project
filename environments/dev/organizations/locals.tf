locals {
  config = yamldecode(file("${path.module}/../config/dev_config.yaml"))
}
