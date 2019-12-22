# Google Managed Zone


```hcl
provider "google" {
  credentials = file(var.ACCOUNT_JSON)
  project     = var.PROJECT_ID
}

# example domain
module "domain_made_com_ua" {
  source = "github.com/butuzov/terraform-modules.git//google_dns_managed_zone_public"
  domain = "made.com.ua"
}

output "ns_made_com_ua" {
  value = module.domain_made_com_ua.name_servers
}
```