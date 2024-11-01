data "aws_region" "current" {}

data "aws_vpc_ipam_pool" "ipam_pool" {
  filter {
    name   = "address-family"
    values = ["ipv4"]
  }

  filter {
    name   = "locale"
    values = ["us-west-1"]
  }

  filter {
    name   = "description"
    values = ["${data.aws_region.current.name} non-prod"]
  }

  tags = {
    environment = "nonprod"
  }
}

resource "aws_key_pair" "brianmoore" {
  key_name   = "brianmoore"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+HxnuN1D7vtkxABtAxRizT2RrUha45M3qBABWKBJAEJqev9gUC0zRxAwW6Eh8lhfv9jKcnekMkOZNPrR/Bx5cuv0hACDxF4nb2trcFTK2IOuaGidk3zld71jQYDnpVes9BSqcMkn9nmx8Nl7p5KPt1foTSezdZq/neiOZ/vV5r8iPmSOwxigYFP2G70P2dMFTY+KyoWDk60WAjr2g6EHSdI4GgR6kghgMAcVuljnseDJVLmYn8I/B2FSXH7APtd0h6J673S8wPZuNzIEYzm/KEobBn0EpnhyqfOjN5VLdNOUGpXb/VPNXeKaB3KoOzEh20FkaVJmNXlN0WKC1hyCl brian@DESKTOP-SFIVOEU"
}

# resource "aws_vpc_ipam_pool" "ipam_pool" {
#   address_family = "ipv4"
#   ipam_scope_id  = data.aws_vpc_ipam_pool.ipam_pool.ipam_scope_id
#   source_ipam_pool_id = data.aws_vpc_ipam_pool.ipam_pool.id
#   locale = data.aws_region.current.name
#   description = "${data.aws_region.current.name} sandbox"
#   tags = {
#     "environment" = "nonprod"
#   }
# }

# resource "aws_vpc_ipam_preview_next_cidr" "private_subnet_cidr" {
#   ipam_pool_id   = aws_vpc_ipam_pool.ipam_pool.id
#   netmask_length = var.private_subnet_netmask_length
# }

# resource "aws_vpc_ipam_pool_cidr" "private_subnet_cidr" {
#   ipam_pool_id = aws_vpc_ipam_pool.ipam_pool.id
#   cidr         = aws_vpc_ipam_preview_next_cidr.private_subnet_cidr.cidr
# }

# resource "aws_vpc_ipam_preview_next_cidr" "public_subnet_cidr" {
#   ipam_pool_id   = aws_vpc_ipam_pool.ipam_pool.id
#   netmask_length = var.public_subnet_netmask_length
# }

# resource "aws_vpc_ipam_pool_cidr" "public_subnet_cidr" {
#   ipam_pool_id = aws_vpc_ipam_pool.ipam_pool.id
#   cidr         = aws_vpc_ipam_preview_next_cidr.private_subnet_cidr.cidr
# }

# data "aws_key_pair" "key_pair" {
#   key_name = var.key_pair_name
#   # filter {
#   #   name   = "tag:Component"
#   #   values = ["web"]
#   # }
# }

# module "aws_k8s" {
#   source = "../terraform-aws-k8s"
#   #source                                   = "app.terraform.io/cloudruler/k8s/aws"
#   #version                                 = ">= 0.0.1"
#   #landing_zone_name                        = var.landing_zone_name
#   #resource_group_name                      = azurerm_resource_group.rg.name
#   #location                                 = var.location
#   ipam_pool_id   = data.aws_vpc_ipam_pool.ipam_pool.id
#   admin_username = var.admin_username
#   #connectivity_resource_group_name         = var.connectivity_resource_group_name
#   identity_resource_group_name = var.identity_resource_group_name
#   key_vault_name               = var.key_vault_name
#   certificate_names            = var.certificate_names
#   ssh_public_key               = var.ssh_public_key
#   cluster_public_ip            = var.cluster_public_ip
#   master_nodes_config          = var.master_nodes_config
#   worker_nodes_config          = var.worker_nodes_config
#   #vnet_cidr                                = var.vnet_cidr
#   #subnet_cidr                              = var.subnet_cidr
#   vpc_netmask_length                       = var.vpc_netmask_length
#   pods_cidr                                = var.pods_cidr
#   bootstrap_token_secret_name              = var.bootstrap_token_secret_name
#   discovery_token_ca_cert_hash_secret_name = var.discovery_token_ca_cert_hash_secret_name
#   api_server_name                          = var.api_server_name
#   k8s_service_subnet                       = var.k8s_service_subnet
#   cluster_dns                              = var.cluster_dns
#   crio_version                             = var.crio_version
#   crio_os_version                          = var.crio_os_version
#   #vm_image_publisher                       = var.vm_image_publisher
#   resources_path      = var.resources_path
#   helm_version        = var.helm_version
#   key_pair_id         = aws_key_pair.brianmoore.key_name
#   private_subnet_cidr = aws_vpc_ipam_pool_cidr.private_subnet_cidr.cidr
#   public_subnet_cidr  = aws_vpc_ipam_pool_cidr.public_subnet_cidr.cidr
#   tags                = {}
# }
