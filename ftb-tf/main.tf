provider "aws" {
  region = "ap-southeast-2"
}

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

module "minecraft-spot" {
  source = "github.com/Lemmons/minecraft-spot//terraform?ref=1.1"

  username = "charliegrc"
  pub_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDSDM9xMSqA5aLxJJTroCJBnqO5sLvnhbvblj0K/TQ2om4hUgwDJpRsVL1TnFERY7nLUwN9p1PRjcykCL8pmNfUNd+800UVr8Rje7Lg4boxzIUKttiUDuDo0gna/kncv5I40+Yp1zArlT5U967iewVnlKQpTcC/S/RQiywIDi6al8+gDWi6HIA/+90Voh4MkwIynoxjC25mXaCi2vDiLoCSVWa6qbzZ7IXpkYjt/KuNKO8/EV5AsuLMGlYXsp9nKQp7fW5WXaPqvTOS8cZFwGbUNW3KxNNT7gDwRX1LyjLztat0ARFw6u1/Qdh5Ncjw7GD1lyXKVtYZoy/0U+joZS8ASdz8+ukaQ3tE8c8Zr4a4K/rGFt0pjtSlJ70JjPklK3vHqDidBPPgBhB7jXADDQN4RpAQI5Rd54AoHHZ5xYoJPsgvejkmAKSJJQI+9wV9i9qeCe8wGY5bxwyiBRtBBrtJZ51RHfSaNDvaK2Q/GzIjBlWdOxy0VIRNjb84oyeyXRRCeKjEAuaDINdfgvGW82qU1v3afOrbEvnFZdAuBjK9u8E6Pf8qJh57lAdDkMvYSPUz1F20pJabHLazB28tGn+4cxOaENqZCpeo9Xj/4l5C28cXefnk2XrTxZFQXehWEsnN2TuVNsieOKPLla7xZY2hcT9hsj4wnWomkORm2C5xUQ== charltongroves@gmail.com"

  hosted_zone_id = "Z14O8UHZP5Z5N4"
  api_subdomain= "api"
  minecraft_subdomain= "yeet"
  domain_ssl_certificate_arn = ""

  aws_region = "ap-southeast-2"

  ftb_modpack_version = "https://www.feed-the-beast.com/projects/ftb-ultimate-reloaded/files/2714054"

  spot_price = "0.035"
  instance_type = "t2.medium"

  public_subnets = "${data.aws_subnet_ids.all.ids}"

  bucket_name = "my-minecraft-data"

  vpc_id = "${data.aws_vpc.default.id}"

  auth_audience = "https://api.boyztown.com"
  auth_jwks_uri = "https://boyztown.auth0.com/.well-known/jwks.json"
  auth_token_issuer = "https://boyztown.auth0.com/"
}

output "webapp-distribution-id" {
  value = "${module.minecraft-spot.webapp-distribution-id}"
}