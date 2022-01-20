<?php
session_start();
$conn= new mysqli('localhost','root','','php_project');

$id=$_GET['ff'];
$data=$conn->query("DELETE FROM `holiday` WHERE `holidayID`=$id");
$_SESSION['msg']='Deleted successfully!';
$_SESSION['class']='danger';


  header("location:holiday.php");
?>