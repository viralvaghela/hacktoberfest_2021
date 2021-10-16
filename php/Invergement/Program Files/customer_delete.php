<?php

include 'conn.php';

$customer_id = $_GET['customer_id'];

$q = " DELETE FROM `customer_info` WHERE customer_id = $customer_id ";

mysqli_query($conn, $q);

header('location:customer_view.php');

?>
