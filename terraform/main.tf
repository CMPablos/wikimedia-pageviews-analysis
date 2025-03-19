terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
    credentials = file(var.credentials)
    project = "wikimedia-pageviews"
    region = var.region
  # Configuration options
}



resource "google_storage_bucket" "data-lake-bucket" {
  name = "wikimedia-pageviews-bucket"
  location = var.location
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = false
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 1  // days
    }
  }

  force_destroy = true
}

resource "google_bigquery_dataset" "dataset" {
    dataset_id = "pageviewsDataset"
    project = "wikimedia-pageviews"
    location = var.location
}
