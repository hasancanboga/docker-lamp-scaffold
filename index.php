<?php

echo "Hello from the docker container";

$serverName = "db";
$dbUsername = "testuser";
$dbUserPassword = "testpass";
$dbName = "testdb";

try {
	$db = new PDO("mysql:dbname=$dbName;host=$serverName;charset=utf8mb4;", $dbUsername, $dbUserPassword);

	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
	exit("Database Connection failed"); // . $e->getMessage());
}

echo '<br><br>MySQL Version: ' . run('SHOW VARIABLES like "version"')->fetch()['Value'];

function run($query, $bind = [])
{
	$db = $GLOBALS['db'];
	$q = $db->prepare($query);
	$q->execute($bind);
	return $q;
}
