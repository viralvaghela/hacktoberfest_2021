<?php

include 'conn.php';

$product_id = $_GET['product_id'];

$q = " DELETE FROM `product_info` WHERE product_id = $product_id ";

mysqli_query($conn, $q);

header('location:product_view.php');

?>