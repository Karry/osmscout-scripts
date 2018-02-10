<?php

////////////////////////////////////////////////////////////////////////////////
// setup properties
////////////////////////////////////////////////////////////////////////////////

$wwwDir = dirname(__FILE__);
$rootDir = $wwwDir . '/';

////////////////////////////////////////////////////////////////////////////////
// Load libs
////////////////////////////////////////////////////////////////////////////////

require_once $rootDir . '/lib/Nette/loader.php';
require_once $rootDir . '/lib/Utils.php';

////////////////////////////////////////////////////////////////////////////////
// initialize common libraries
////////////////////////////////////////////////////////////////////////////////

$database = include( $rootDir . '/database.php' );

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

header("Expires: ".GMDate("D, d M Y H:i:s", time() + (3600))." GMT");


$mapRes = $database->query(
            "SELECT * FROM (" .
            "  SELECT * FROM (" .
            "     SELECT `id`, `map`, `version`, `directory`, `creation`, `size` " .
            "     FROM  `map` " .
            "     WHERE NOT `deleted` " .
            "     ORDER BY `creation` DESC " .
            "  ) AS `subselect` " .
            "  GROUP BY `map`" . 
            "  ) AS `sub2` ". 
            "ORDER BY `creation` " .
            "LIMIT 1");

if (!$mapRes->valid()){
  $mapRes=array();
}
$json = array();
foreach ($mapRes as $row) {

  $obj = array(
      'map'=>$row['map'],
      'version'=>$row['version'],
      'directory'=>$row['directory'],
      'timestamp'=>$row['creation']->getTimestamp(),
      'size'=>$row['size']
    );

  array_push($json, $obj);
}

\Utils::sendJson($json);
