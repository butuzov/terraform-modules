# Github's A/AAAA records for Github Pages


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

module "gh_pages_made_com_ua" {
  source = "github.com/butuzov/terraform-modules.git//google_dns_record_set_gh_pages"

  zone_name = module.domain_made_com_ua.managed_zone
  name      = module.domain_made_com_ua.dns_name
}
```