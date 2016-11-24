<?php

$connection = new Nette\Database\Connection(
        "mysql:host=localhost;dbname=osmscout", 
        "osmscout", 
        "password", 
        array('lazy' => TRUE));

return new Nette\Database\Context($connection);

