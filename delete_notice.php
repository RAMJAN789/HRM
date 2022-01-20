<?php 
require_once("header.php");
require_once("sidebar.php");

$id=$_GET['id'];
$conn->query("DELETE FROM `notice` WHERE `notice`.`id` = '$id'");

header('location:add_notice.php');
  

?>


