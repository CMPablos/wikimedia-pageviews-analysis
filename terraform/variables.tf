

variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-credentials.json"
}

variable "project_name" {
  description = "Project"
  default     = "wikimedia-pageviews"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "pageviewsDataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "wikimedia-pageviews-bucket"
}