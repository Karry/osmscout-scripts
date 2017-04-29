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
header("Content-Type: application/xml");

$mapRes = $database->query(
            "SELECT `id`, `map`, `version`, `directory`, `creation`, `size`, `name`, `description` " .
            "   FROM  `map` " .
            "LEFT JOIN `l10n` ON `map` = `path`" .
            "WHERE `locale` = 'en'" .
            "ORDER BY `map`.`creation` DESC " .
            "LIMIT 100");

if (!$mapRes->valid()){
  $mapRes=array();
}

////////////////////////////////////////////////////////////////////////////////
// OUTPUT
////////////////////////////////////////////////////////////////////////////////

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
echo "<rss version=\"2.0\">\n";
echo "    <channel>\n";
echo "        <title>OSM Scout map updates</title>\n";

foreach ($mapRes as $row) {
  echo "        <item>\n";
  echo "            <title>".$row['name']."</title>\n";
  echo "\n";
  echo "            <link>https://". $_SERVER['HTTP_HOST'] ."/". $row['directory'] ."</link>\n";
  echo "\n";
  echo "            <description><![CDATA[\n";
  echo "            <ul>\n";
  echo "              <li>Size: ". round($row['size']/(1024*1024))." MiB</li>\n";
  echo "              <li>Data version: ". $row['version'] ."</li>\n";
  echo "            </ul>\n";
  if (array_key_exists('description', $row) && $row['description'] != null){
    echo "               <p>".$row['description']."</p>\n";
  }
  echo "            ]]></description>\n";
  echo "\n";
  echo "            <author>lukas.karas@centrum.cz (Lukáš Karas)</author>\n";
  echo "            <pubDate>". $row['creation']->format("D, d M Y H:i:s T") ."</pubDate>\n";
  echo "        </item>\n";
}

echo "    </channel>\n";
echo "</rss>";

