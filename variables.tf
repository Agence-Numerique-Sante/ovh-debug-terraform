#################################################################################
# Nom du fichier : variables.tf
#
# Créé le       : 31/07/2023 15:35:28
# Créé par      : [Christian Mazeau]
# -------------------------------------------------------------------------------------
# Description   : Définition de toutes les variables utiles pour network
#                 Ces élèments sont communs à tous les environnements : prod, preprod,recette
#
#                 Par choix, une seule région cible pour les infras GRA11
#
# -------------------------------------------------------------------------------------
# Historique    
#
#  20230731 [CM]  : Mise à place à partir de l'expérience acquise sur terraform
# 
#################################################################################

# ---------------------------------------------------------------------------------------------------------------------
# Paramètres obligatoires
# Ces paramètres doivent être renseigné impérativement lors de l'appel des commandes TERAFFORM
# Ils doivent tous être présent dans des variables d'environnements du type TF_VAR_<nom de la variable>
# ---------------------------------------------------------------------------------------------------------------------

variable "ovh_endpoint" {
  description="Endpoint OVH"
  type = string
}

variable "ovh_application_key" {
  description="Application key OVH"
  type = string
}

variable "ovh_application_secret" {
  description="Application secret OVH"
  type = string
}

variable "ovh_consumer_key" {
  description="Clé consommateur OVH"
  type = string
}

variable "ovh_auth_url" {
  description="URL OVH gestion des accès pour OpenStack"
  type = string
}

variable "ovh_domain_name" {
  description="Nom de domaine OVH"
  type = string
}

variable "ovh_user_domain_name" {
  description="Nom de domaine utilisateur OVH"
  type = string
}

variable "ovh_user_name" {
  description="Nom utilisateur OVH"
  type = string
}

variable "ovh_user_password" {
  description="Mot de passe utilisateur OVH"
  type = string
}

variable "ovh_region" {
  description="Region cible OVH"
  type = string
}

variable "ovh_tenant_id" {
  description="tenant_id = Public cloud projet ID"
  type = string
}

variable "ovh_vrack_id" {
  type = string
  description = "the vrack_id pn_xxxxxxx"
}

# ---------------------------------------------------------------------------------------------------------------------
# Paramètres optionnels
# Ces paramètres ont tous des valeurs par défaut définies.
# Ils peuvent être surchargés lors de l'appel des commandes TERAFFORM
# ---------------------------------------------------------------------------------------------------------------------

variable "user_desc_prefix" {
  type    = string
  default = "[TF] User created by s3 terraform script"
}

variable "vlan_id" {
  type    = number
  default = "42"
}

########################################################################################
#     User / Credential
########################################################################################
resource "ovh_cloud_project_user" "user" {
  service_name = var.ovh_tenant_id
  description  = "${var.user_desc_prefix} that is used to manage network"
  role_name    = "network_operator"
}