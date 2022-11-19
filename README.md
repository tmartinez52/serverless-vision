# serverless-vision
Python App that uses Cloud Vision to sort images using into GCS



This repository includes all the code required to deploy a managed solution within GCP using the following services
- Cloud Vision
- Cloud Storage
- Cloud Function


1. Ensure that have a machine with Terraform, gcloud CLI (authenticated)

2. The following variables would need to be defined in a terraform.tfvars
  - billing_account
  - project
  - zone
  
Having the correct information would allow for this project to do
  1. Create a project for resources
  2. Enable Billing account on projects
  3. Enable APIs
  4. Create the resources needed.
  
Once Terraform has completed running test by uploading files into cloud storage. This should trigger cloud function to call Cloud Vision using python and extract information from images provided

  
