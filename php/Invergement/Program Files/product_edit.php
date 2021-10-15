<?php

 include 'conn.php';

 if(isset($_POST['done'])){

 $product_id = $_GET['product_id'];
 $product_name = $_POST['product_name'];
 $p_quantity = $_POST['p_quantity'];
 $p_lower = $_POST['p_lower'];
 $p_price = $_POST['p_price'];
 $q = " update product_info set product_id=$product_id, product_name='$product_name', p_quantity='$p_quantity' , p_lower='$p_lower' , p_price='$p_price' where product_id=$product_id  ";

 $query = mysqli_query($conn,$q);

 header('location:product_view.php');
 }
 ?>

<!DOCTYPE html>
<html>
<head>
 <title></title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>

 <div class="form_style">
 
 <form method="post">
 
 <br><br><div class="card">
 
 <div class="card-header bg-dark">
 <h1 class="text-white text-center">  Update Operation </h1>
 </div><br>

 <label> Product Name: </label>
 <input type="text" name="product_name" class="form-control"> <br>

 <label> Quantity </label>
 <input type="text" name="p_quantity" class="form-control"> <br>

  <label> Lower Limit: </label>
 <input type="text" name="p_lower" class="form-control"> <br>

  <label> Price: </label>
 <input type="text" name="p_price" class="form-control"> <br>

 <button class="btn btn-success" type="submit" name="done"> Submit </button><br>

 </div>
 </form>

 </div>
</body>
</html>