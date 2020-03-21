variable cloudflare_email {}
variable cloudflare_api_key {}
variable cloudflare_account_id {}

variable "domain" {
  default = "anolson.org"
}

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
  account_id = var.cloudflare_account_id
}

resource "cloudflare_zone" "anolson_org" {
  zone = "anolson.org"
  plan = "free"
}

resource "cloudflare_record" "CNAME_anolson_org" {
  zone_id = "2af18a243f0966f97a28c591e92c6742"
  name = var.domain
  type = "CNAME"
  ttl = "1"
  proxied = "true"
  value = "anolson.github.io"
}

resource "cloudflare_record" "CNAME_www_anolson_org" {
  zone_id = "2af18a243f0966f97a28c591e92c6742"
  name = "www"
  type = "CNAME"
  ttl = "1"
  proxied = "true"
  value = "anolson.github.io"
}
