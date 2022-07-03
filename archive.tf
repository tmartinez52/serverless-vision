resource "google_storage_bucket_object" "zip" {
  source       = data.archive_file.source.output_path
  content_type = "application/zip"

  name   = "src-${data.archive_file.source.output_md5}.zip"
  bucket = google_storage_bucket.function_bucket.name

  depends_on = [
    google_storage_bucket.function_bucket,
    data.archive_file.source
  ]
}
data "archive_file" "source" {
  type        = "zip"
  source_dir  = "src"
  output_path = "/tmp/function.zip"
}