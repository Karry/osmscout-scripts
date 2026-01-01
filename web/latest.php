<?php

////////////////////////////////////////////////////////////////////////////////
// setup properties
////////////////////////////////////////////////////////////////////////////////

$wwwDir = dirname(__FILE__);
$rootDir = $wwwDir . '/';
date_default_timezone_set('UTC');

////////////////////////////////////////////////////////////////////////////////
// Load libs
////////////////////////////////////////////////////////////////////////////////

require_once $rootDir . '/vendor/autoload.php';
require_once $rootDir . '/lib/Utils.php';

////////////////////////////////////////////////////////////////////////////////
// arguments
////////////////////////////////////////////////////////////////////////////////

$fromVersion = array_key_exists('fromVersion', $_GET) ? intval($_GET['fromVersion']) : 0;
$toVersion = array_key_exists('toVersion', $_GET) ? intval($_GET['toVersion']) : 1<<30;
$locale = array_key_exists('locale', $_GET) ? $_GET['locale'] : 'undefined';

$guid = array_key_exists('guid', $_COOKIE) ? $_COOKIE['guid'] : \Utils::guid();
setcookie("guid", $guid,  time()+(365*24*3600));

////////////////////////////////////////////////////////////////////////////////
// initialize common libraries
////////////////////////////////////////////////////////////////////////////////

$database = include( $rootDir . '/database.php' );

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

header("Expires: ".GMDate("D, d M Y H:i:s", time() + (3600))." GMT");


$mapRes = $database->queryArgs(
            "SELECT * FROM `map` AS `out` WHERE `creation` = (".
            "   SELECT MAX(`creation`) ".
            "   FROM  `map` AS `in`" .
            "   WHERE `version` >= ? AND `version` <= ? ".
            "     AND NOT `deleted` " .
            "     AND `out`.`map` = `in`.`map` ".
            "  )".
            "  AND `version` >= ? AND `version` <= ? ".
            "  AND NOT `deleted`",
            array($fromVersion, $toVersion, $fromVersion, $toVersion));

if (!$mapRes->valid()){
  $mapRes=array();
}

$l10nRes = $database->queryArgs(
            "SELECT * ".
            "FROM l10n AS `out` ".
            "WHERE `locale` IN (?) ".
            "  AND locale = ( ".
            "  SELECT locale FROM l10n  ".
            "  WHERE `locale` IN (?) ".
            "    AND `out`.`path` = `path` ".
            "  ORDER BY IF(`locale` = ?, 2, IF(`locale` = 'en',1,0)) DESC ".
            "  LIMIT 1 ".
            ")", array(array($locale, 'en'), array($locale, 'en'), $locale));

if (!$l10nRes->valid()){
  $l10nRes=array();
}
$l10n = array();
foreach ($l10nRes as $row) {
  $l10n[$row['path']] = $row;
}

$json = array();
$dirs = array();
foreach ($mapRes as $row) {

  // browse parent directories
  $path = preg_split("/\\//", $row['map']);
  $prefix = "";
  for ($i=0; $i<sizeof($path)-1; $i++){
    $prefix.= ($i>0 ? "/":""). $path[$i];
    if (!in_array($prefix, $dirs)){
      array_push($dirs, $prefix);
    }
  }

  $obj = array(
      'map'=>$row['map'],
      'version'=>$row['version'],
      'directory'=>$row['directory'],
      'timestamp'=>$row['creation']->getTimestamp(),
      'size'=>$row['size']
    );
  if (array_key_exists($row['map'], $l10n)){
    $l10nRow = $l10n[$row['map']];
    $obj['name'] = $l10nRow['name'];
    if (property_exists($l10nRow, 'description') && $l10nRow['description'] != null){
      $obj['description'] = $l10nRow['description'];
    }
  }else{
    $obj['name'] = $path[sizeof($path)-1];
  }
  array_push($json, $obj);
}

foreach ($dirs as $dir) {
  $obj = array('dir' => $dir);
  if (array_key_exists($dir, $l10n)){
    $l10nRow = $l10n[$dir];
    $obj['name'] = $l10nRow['name'];
    if (property_exists($l10nRow, 'description') && $l10nRow['description'] != null){
      $obj['description'] = $l10nRow['description'];
    }
  }else{
    $obj['name'] = $dir;
  }
  array_push($json, $obj);
}

$database->query("INSERT INTO `ping`", 
  array(
    'ip' => \Utils::getIP(), 
    'user_agent' => \Utils::userAgent(), 
    'guid_cookie' => $guid, 
    'locale' => $locale,
    'from_version' => $fromVersion,
    'to_version' => $toVersion,
    'time' => new \DateTime('now', new \DateTimeZone('UTC'))));


\Utils::sendJson($json);
