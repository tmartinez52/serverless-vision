resource "google_cloudfunctions_function" "function" {
    project = var.project
  name    = "fuction-trigger-on-gcs"
  runtime = "python39"
  region  = var.location

  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.zip.name

  entry_point = "check_images"

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = google_storage_bucket.upload.name
  }
  depends_on = [
    google_project_service.functions,
    google_project_service.compute,
    google_project_service.build,
    google_storage_bucket.function_bucket,
    google_storage_bucket.upload,
    google_storage_bucket.flagged,
    google_storage_bucket.approved,
    google_storage_bucket_object.zip
  ]

  environment_variables = {
    "FLAGGED_BUCKET"  = google_storage_bucket.approved.name
    "APPROVED_BUCKET" = google_storage_bucket.flagged.name
  }
}