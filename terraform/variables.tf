

variable "credentials" {
  description = "json key file location"
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
  description = "BigQuery Dataset Name"
  default     = "pageviewsDataset"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name"
  default     = "wikimedia-pageviews-bucket"
}