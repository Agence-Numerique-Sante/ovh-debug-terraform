#################################################################################
# Nom du fichier : provider.tf
#
# Créé le       : 27/07/2023 14:16:28
# Créé par      : [Christian Mazeau]
# -------------------------------------------------------------------------------------
# Description   : Définition de tous les èlèments réseau propre à OVH pour la génération 2
#                 Ces élèments sont communs à tous les environnements : prod, preprod,recette
#
# -------------------------------------------------------------------------------------
# Historique    
#
#  20230727 [CM]  : Initialisation
# 
#################################################################################

# Définir les providers et fixer les versions

terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.31.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.49.0"
    }
  }
  required_version = "~> 1.5.4"
}

# Configure le fournisseur OpenStack hébergé par OVHcloud
provider "openstack" {
  auth_url         = var.ovh_auth_url
  domain_name      = var.ovh_domain_name
  user_domain_name = var.ovh_domain_user_name
  user_name        = var.ovh_user_name
  password         = var.ovh_user_password
  region           = var.ovh_region
  tenant_id        = var.ovh_tenant_id
}

provider "ovh" {
  endpoint           = var.ovh_endpoint
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}
