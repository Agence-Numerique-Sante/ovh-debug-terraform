#################################################################################
# Nom du fichier : output.tf
#
# Créé le       : 31/07/2022 16:35:28
# Créé par      : [Christian Mazeau]
# -------------------------------------------------------------------------------------
# Description   : Visualisation des paramètres de sortie
#
# -------------------------------------------------------------------------------------
# Historique    
#
#  20230731 [CM]  : Mise à place à partir de l'expérience acquise sur terraform
# 
#################################################################################


output "region" {
  value = var.ovh_region
  description = "Region OpenStack Cible" 
}

output "endpoint" {
  value = var.ovh_endpoint
  description = "Provider OVH : endpoint" 
}

output "application_key" {
  value = var.ovh_application_key
  description = "Provider OVH : application_key" 
}

output "application_secret" {
  value = var.ovh_application_secret
  description = "Provider OVH : application_secret" 
}

output "consumer_key" {
  value = var.ovh_consumer_key
  description = "Provider OVH : endpoint" 
}
