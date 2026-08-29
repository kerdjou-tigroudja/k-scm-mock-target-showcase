# Mock Enterprise Terraform Infrastructure for K-SCM IaC Compliance Testing

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# VIOLATION 1: GCS Bucket with missing CMEK encryption & inherited public access (GDPR / ISO 27001)
resource "google_storage_bucket" "unsecured_data_bucket" {
  name          = "${var.project_id}-unsecured-customer-data"
  location      = var.region
  force_destroy = true

  # Missing public_access_prevention = "enforced"
  # Missing encryption { default_kms_key_name = ... }
}

# VIOLATION 2: IAM policy granting public access to customer data bucket
resource "google_storage_bucket_iam_binding" "public_read_binding" {
  bucket = google_storage_bucket.unsecured_data_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}

# VIOLATION 3: Compute Firewall allowing unrestricted ingress from 0.0.0.0/0
resource "google_compute_firewall" "allow_ssh_all" {
  name    = "allow-ssh-unrestricted"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# VIOLATION 4: Vertex AI Dataset missing CMEK encryption key (EU AI Act Sovereign Requirement)
resource "google_vertex_ai_dataset" "ai_training_dataset" {
  display_name        = "customer-behavior-ml-dataset"
  metadata_schema_uri = "gs://google-cloud-aiplatform/schema/dataset/metadata/tabular_1.0.0.yaml"
  region              = var.region

  # Missing encryption_spec { kms_key_name = ... }
}
