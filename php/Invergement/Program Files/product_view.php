<!DOCTYPE html>
<html>
<head>
 <title></title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

 <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
   <script type="text/javascript" charset="utf8" src="https://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		 <span class="navbar-brand mb-0 h1"><img src="inventory_icon.png" width="45px" height="45px"> INVERGEMENT </span>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="customer_insert.php">Add Customer</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="product_insert.php">Add Product</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="customer_view.php">Customer Info</a>
      </li>
	</ul>
	</div>
	</nav>

 <div class="container">
 <div class="col-lg-12">
 <br><br>
 <h1 class="text-warning text-center" > Product Data </h1>
 <br>
 <table  id="tabledata" class=" table table-striped table-hover table-bordered">
 
 <tr class="bg-dark text-white text-center">
 
 <th> Id </th>
 <th> Product Name </th>
 <th> Quantity</th>
 <th> Quantity Lower Limit</th>
 <th> Price</th>
 <th> Delete </th>
 <th> Update </th>

 </tr >

 <?php

 include 'conn.php'; 
 $q = "select * from product_info";

 $query = mysqli_query($conn,$q);

 while($res = mysqli_fetch_array($query)){
 ?>
 <tr class="text-center">
 <td> <?php echo $res['product_id'];  ?> </td>
 <td> <?php echo $res['product_name'];  ?> </td>
 <td> <?php echo $res['p_quantity'];  ?> </td>
 <td> <?php echo $res['p_lower'];  ?> </td>
 <td> <?php echo $res['p_price'];  ?> </td>
 <td> <button class="btn-danger btn"> <a href="product_delete.php?product_id=<?php echo $res['product_id']; ?>" class="text-white"> Delete </a>  </button> </td>
 <td> <button class="btn-primary btn"> <a href="product_edit.php?product_id=<?php echo $res['product_id']; ?>" class="text-white"> Update </a> </button> </td>

 </tr>

 <?php 
 }
  ?>
 
 </table>  

 </div>
 </div>

 <script type="text/javascript">
 
 $(document).ready(function(){
 $('#tabledata').DataTable();
 }) 
 
 </script>

</body>
</html>