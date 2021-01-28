<?php

return new Nette\Database\Connection(
        "mysql:host=localhost;dbname=osmscout", 
        "osmscout", 
        "password", 
        array('lazy' => TRUE));

