<?php

namespace App\Controller;


use Symfony\Component\HttpFoundation\Response;
use Psr\Log\LoggerInterface;
use Mysqli;



class MyController
{

    public function test(LoggerInterface $logger)
    {
        $mysqlhost = getenv('MYSQL_HOST');
        $mysqluser = getenv('MYSQL_USER');
        $mysqlpassword = getenv('MYSQL_PASSWORD');
        $mysqldb = getenv('MYSQL_DB');

        $tmpconn =  new mysqli($mysqlhost, $mysqluser, $mysqlpassword);
        $sql = "CREATE DATABASE IF NOT EXISTS mydb;";
        $tmpconn->query($sql);

        $conn = new mysqli($mysqlhost, $mysqluser, $mysqlpassword, $mysqldb);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sqls=["CREATE TABLE IF NOT EXISTS messages (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, msg varchar(20));", "INSERT IGNORE INTO messages (msg) VALUES ('Hello World');"];

        foreach ($sqls as $sql) {
            $conn->query($sql);
        }

        $sql = "SELECT msg FROM messages WHERE id=1;";
        $result = $conn->query($sql)->fetch_object()->msg;

        $msg = "Message from mysql";
        #$out = $msg.'->'.$result;
        $logger->info('This is from the MyController, the applicaton is on its way');
        return new Response($result);
    }
}
