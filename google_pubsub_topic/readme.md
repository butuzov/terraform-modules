## Pub/Sub

```hcl
module "pubsub_trigger" {
  source  = "github.com/butuzov/terraform-modules.git//google_pubsub_topic/"
  name    = format("%s-trigger", var.environment)
  project = format("%s-%s", var.project, var.environment)
}
```