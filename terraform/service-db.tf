resource "kubernetes_service" "mysql-service" {
  # Définition d'un service Kubernetes pour la base de données MySQL
  # Ce service permettra d'accéder à la base de données depuis d'autres applications

  # Métadonnées du service
  metadata {
    # Nom unique du service dans le cluster Kubernetes
    name = "mysql"
  }

  # Spécification du service
  spec {
    # Sélecteur de pods
    selector = {
      # Le service sélectionnera les pods avec le label "app" ayant la valeur "db"
      app = "db"
    }

    # Port exposé par le service
    port {
      # Protocole utilisé (TCP dans ce cas)
      protocol = "TCP"

      # Port sur lequel le service est accessible (externe)
      port = 3306  # Peut être un port différent selon vos besoins

      # Port cible à l'intérieur des pods (port d'écoute de l'application)
      target_port = 3306
    }
  }
}
