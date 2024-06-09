resource "kubernetes_deployment" "php-deployment" {

  # Définition du nom du déploiement
  metadata {
    name = "php-deployment"
  }

  # Configuration du déploiement
  spec {
    # Nombre de réplicas de pods à créer (déploiement de 2 pods identiques)
    replicas = 2

    # Sélecteur de pods à gérer par ce déploiement
    selector {
      match_labels = {
        app = "php"  # Les pods doivent avoir un label "app" avec la valeur "php"
      }
    }

    # Modèle de pod pour ce déploiement
    template {
      # Métadonnées du pod
      metadata {
        labels = {
          app = "php"  # Assigner le label "app:php" au pod
        }
      }

      # Spécifications du conteneur Docker à exécuter dans le pod
      spec {
        container {
          # Nom du conteneur
          name = "php"

          # Image Docker contenant l'application PHP
          image = "aziz293/projetphp1"

          # Port exposé par le conteneur (port standard HTTP)
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
