terraform {
  backend "remote" {
    organization = "example-org-3e3d7d"

    workspaces {
      name = "petclinic"
    }
  }
}
