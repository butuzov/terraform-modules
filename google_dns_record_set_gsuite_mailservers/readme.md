# Google's MX records for G Suite Domains


```hcl
provider "google" {
  credentials = file(var.ACCOUNT_JSON)
  project     = var.PROJECT_ID
}

module "domain_made_com_ua" {
  source = "github.com/butuzov/terraform-modules.git//google_dns_managed_zone_public"
  domain = "made.com.ua"
}

module "gsuit_mail_made_com_ua" {
  source = "github.com/butuzov/terraform-modules.git//google_dns_record_set_gsuite_mailservers"

  zone_name = module.domain_made_com_ua.managed_zone
  name      = module.domain_made_com_ua.dns_name
}
```