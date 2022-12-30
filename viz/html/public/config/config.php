<?php

function getConnection(){

    $host = getenv('MYSQL_HOST');
    $user = getenv('MYSQL_USER'); 
    $password = getenv('MYSQL_PASSWORD'); 
    $database = getenv('MYSQL_DATABASE'); 
    $port = getenv('MYSQL_PORT'); 

    $dsn = "mysql:host=$host;port=$port;dbname=$database";

    try {
        $conn = new PDO($dsn, $user, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        die("There was a problem with the connection. Please check your configuration.");
    }
    return $conn;

}

function getConfigPath() {
    $configPath = getenv('CONTENT_PATH');
    return $configPath;
}
