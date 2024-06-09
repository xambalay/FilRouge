resource "kubernetes_deployment" "db-deployment" {
  # Définition du nom du déploiement
  metadata {
    name = "db-deployment"
  }

  # Configuration du déploiement
  spec {
    # Nombre de réplicas de pods à créer
    replicas = 1

    # Sélecteur de pods à gérer par ce déploiement
    selector {
      match_labels = {
        app = "db"  # Les pods doivent avoir un label "app" avec la valeur "db"
      }
    }

    # Modèle de pod pour ce déploiement
    template {
      # Métadonnées du pod
      metadata {
        labels = {
          app = "db"  # Assigner le label "app:db" au pod
        }
      }

      # Spécifications du conteneur Docker à exécuter dans le pod
      spec {
        container {
          # Nom du conteneur
          name = "db"

          # Image Docker contenant l'application de base de données MySQL
          image = "aziz293/projetbd1"

          # Port exposé par le conteneur
          port {
            container_port = 3306  # Exposer le port standard MySQL (3306)
          }

          # Variables d'environnement à injecter dans le conteneur
          env {
            # Mot de passe root pour MySQL (**Attention : stocker le mot de passe en clair est déconseillé !**)
            name = "MYSQL_ROOT_PASSWORD"
            value = "root"
                }
          env {
            # Nom de la base de données MySQL
            name = "MYSQL_DATABASE"
            value = "profil"
          }
        }
      }
    }
  }
}
