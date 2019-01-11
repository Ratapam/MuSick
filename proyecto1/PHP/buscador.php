<?php
$servername = "localhost";
$username = "root";
$password = "12345";
$dbname = "demos";
$sql = "SELECT employee_name FROM employee WHERE employee_name LIKE '%".$_GET['query']."%' LIMIT 20";
$resultset = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
$json = array();
while( $rows = mysqli_fetch_assoc($resultset) ) {
$json[] = $rows["employee_name"];
}
echo json_encode($json);
?>