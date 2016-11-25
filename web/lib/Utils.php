<?php

/**
 * @author karry
 */
class Utils {

  public static function sendJson($json) {
    header("Content-Type: application/json; charset=UTF-8");
    header("Cache-control: private");
    echo json_encode($json, JSON_UNESCAPED_UNICODE);
    exit();
  }
  
  public static function getIP(){
    global $_SERVER;

    if (array_key_exists("HTTP_X_FORWARDED_FOR", $_SERVER)):
      if ($_SERVER["HTTP_CLIENT_IP"]):
          $proxy = $_SERVER["HTTP_CLIENT_IP"];
      else:
          $proxy = $_SERVER["REMOTE_ADDR"];
      endif;
      $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    else:
      if (array_key_exists("HTTP_CLIENT_IP",$_SERVER)):
          $ip = $_SERVER["HTTP_CLIENT_IP"];
      else:
          $ip = $_SERVER["REMOTE_ADDR"];
      endif;
    endif;
    return $ip;
  }
  
  public static function userAgent(){
    global $_SERVER;
    return array_key_exists('HTTP_USER_AGENT', $_SERVER) ? $_SERVER['HTTP_USER_AGENT'] : "<missing>";
  }
  public static function guid(){
    $data = openssl_random_pseudo_bytes(16);
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40); // set version to 0100
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80); // set bits 6-7 to 10
    return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
  }
}
