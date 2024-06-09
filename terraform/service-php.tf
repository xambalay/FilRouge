resource "kubernetes_service" "php-service" {
  # Définition d'un service Kubernetes pour l'application PHP
  # Ce service permettra d'accéder à l'application depuis l'extérieur du cluster

  # Métadonnées du service
  metadata {
    # Nom unique du service dans le cluster Kubernetes
    name = "php-service"
  }

  # Spécification du service
  spec {
    # Sélecteur de pods
    selector = {
      # Le service sélectionnera les pods avec le label "app" ayant la valeur "php"
      app = "php"
    }

    # Port exposé par le service
    port {
      # Protocole utilisé (TCP dans ce cas)
      protocol = "TCP"

      # Port sur lequel le service est accessible (externe)
      port = 80  # Port standard HTTP

      # Port cible à l'intérieur des pods (port d'écoute de l'application)
      target_port = 80
    }

    # Type de service - NodePort permet d'accéder au service depuis l'extérieur du cluster
    type = "NodePort"
  }
}
