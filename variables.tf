variable "location_tracker_associations" {
  description = <<EOT
Map of location_tracker_associations, attributes below
Required:
    - consumer_arn
    - tracker_name
Optional:
    - region
EOT

  type = map(object({
    consumer_arn = string
    tracker_name = string
    region       = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.location_tracker_associations : (
        length(v.tracker_name) >= 1 && length(v.tracker_name) <= 100
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

