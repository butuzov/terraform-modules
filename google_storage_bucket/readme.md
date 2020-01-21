## Google Storage Bucket

```hcl
# Google Storage Bucket
module "cloud_functions_bucket" {
  source   = "github.com/butuzov/terraform-modules.git//google_storage_bucket/"
  name     = var.GS_BUCKET
  location = var.GOOGLE_REGION

  # labels
  project = format("%s-%s", var.project, var.environment)
}
```
