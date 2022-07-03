resource "google_storage_bucket" "upload" {
  project       = var.project
  name          = "${var.project}-upload"
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true
  depends_on = [
    google_project.project
  ]
}
resource "google_storage_bucket" "approved" {
  project       = var.project
  name          = "${var.project}-approved"
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true
  depends_on = [
    google_project.project
  ]
}
resource "google_storage_bucket" "flagged" {
  project       = var.project
  name          = "${var.project}-flagged"
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true
  depends_on = [
    google_project.project
  ]
}
resource "google_storage_bucket" "function_bucket" {
  project       = var.project
  name          = "${var.project}-function"
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true
  depends_on = [
    google_project.project
  ]
}