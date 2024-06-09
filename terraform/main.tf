provider "kubernetes" {
  # Définition du fournisseur Kubernetes
  # Ce bloc indique à Terraform comment se connecter à votre cluster Kubernetes

  # Nom du contexte du cluster Kubernetes à utiliser
  # Dans ce cas, il s'agit du cluster "minikube"
  config_context_cluster = "minikube"

  # Chemin d'accès au fichier de configuration Kubernetes
  # Ce fichier contient les informations d'authentification et de connexion pour vos clusters
  config_path = "~/.kube/config"
}
