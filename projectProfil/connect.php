<?php
$dbHost = 'mydb-service'; // Remplacez par votre hôte de base de donnes
$dbName = 'mydb'; // Remplacez par le nom de votre base de donnes
$dbUser = 'root'; // Remplacez par le nom d'utilisateur de la base de donnes
$dbPass = 'redhat'; // Remplacez par le mot de passe de la base de donnes

try {
    $db = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
    // Configurer PDO pour qu'il gnre des exceptions en cas d'erreur
    
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Erreur de connexion à la base de données : " . $e->getMessage();
}
?>
