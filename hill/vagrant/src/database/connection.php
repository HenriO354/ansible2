<?php

function dbconnect(){

    $hostname = "localhost";
    $usernamedb = "cogip";
    $passworddb = "cogippass";
    $dbname = "cogip";

    $conn = mysqli_connect($hostname, $usernamedb, $passworddb, $dbname) or die ("unable to connect");
    return $conn;
}
?>
