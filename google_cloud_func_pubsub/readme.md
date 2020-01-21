## Cloud Func with pubSub trigger

```hcl
module "cloud_func" {
  source = "github.com/butuzov/terraform-modules.git//google_cloud_func_pubsub/"

  name        = "func-name"
  description = "function description"

  path_from = "../functions/func-source/"
  path_to   = "../build"
  handler   = "HelloPubSub"
  runtime   = "go111"
  memory    = 128

  # dependent vars
  bucket = module.cloud_funcs_bucket.name
  topic  = module.pubsub_trigger.name

  # labels
  project = format("%s-%s", var.project, var.environment)

  # ENV VARS
  ENV_VARS = {
    GS_BUCKET  = module.cloud_funcs_bucket.name
    URLS_TOPIC = module.pubsub_fnc.name
  }
}
``