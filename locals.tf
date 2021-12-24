locals {
  vpc_name     = terraform.workspace == "dev" ? "javahome-dev" : "javahome-prod"
  pub_sub_ids  = aws_subnet.public.*.id
  az_names     = data.aws_availability_zones.azs.names
  priv_sub_ids = aws_subnet.private.*.id
}

