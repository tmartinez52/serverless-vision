resource "google_project" "my_project" {
  name       = "tmartinez52-002"
  project_id = "tmartinez52-002"
  billing_account = data.google_billing_account.acct.id

}
data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}

resource "google_compute_network" "vpc_network" {
  name    = "tf-network"
  project = google_project.my_project.project_id

  depends_on = [
    google_project_service.project
  ]
}
resource "google_project_service" "project" {
  project = google_project.my_project.project_id
  service = "compute.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}