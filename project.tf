resource "google_project" "project" {
  name            = var.project
  project_id      = var.project
  billing_account = data.google_billing_account.billing.id

}
data "google_billing_account" "billing" {
  display_name = var.billing_account
  open         = true
}