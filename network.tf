module "network" {
  source         = "./network"
  name           = var.NAME
  cidr           = var.CIDR
  public_1_cidr  = var.PUBLIC_1_CIDR
  public_2_cidr  = var.PUBLIC_2_CIDR
  private_1_cidr = var.PRIVATE_1_CIDR
  private_2_cidr = var.PRIVATE_2_CIDR
  avail_1        = var.AVAIL_1
  avail_2        = var.AVAIL_2

}