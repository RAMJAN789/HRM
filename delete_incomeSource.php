<?php 
require_once("header.php");
require_once("sidebar.php");

$id=$_GET['id'];
$conn->query("DELETE FROM `income_source` WHERE `income_source`.`id` = '$id'");

header('location:add_incomeSource.php');
  

?>