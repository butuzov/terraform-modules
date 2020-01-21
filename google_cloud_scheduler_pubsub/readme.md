## Cloud Scheduler

```hcl
module "ping" {
  source = "github.com/butuzov/terraform-modules.git//google_cloud_scheduler_pubsub/"

  name        = format("%s-cron", var.environment)
  description = "Pub/Sub message ping"

  schedule = "0 */8 * * 1-5"
  timezone = var.TIME_ZONE

  # see github.com/butuzov/terraform-modules.git//google_pubsub_topic/
  topic_id = module.pubsub_trigger.id

  # labels
  project = format("%s-%s", var.project, var.environment)
}
```