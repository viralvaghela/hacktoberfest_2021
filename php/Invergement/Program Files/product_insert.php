<!DOCTYPE html>
<html>
<head>
	<title>Inventory Management Page</title>
	<link rel="stylesheet" type="text/css" href="form.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
        <a class="nav-link" href="customer_view.php">Customer Info</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="product_view.php">Product Info</a>
      </li>
	</ul>
	</div>
	</nav>
	<center>
 	<div class="container">
  		<form class="add-product" action="" method="POST"><br>
  		<h2>Add Product</h2><br>
  	<div class="form-check form-check-inline">
  		<i class="material-icons">shopping_cart</i>&nbsp;
	    <input type="text" name="product_name" placeholder="Product Name" required/>
	</div><br><br>
	<div class="form-check form-check-inline">
		<i class="material-icons">import_export</i>&nbsp;
	    <input type="number" name="p_quantity" placeholder="Quantity" required/>
	</div><br><br>
	<div class="form-check form-check-inline">
		<i class="material-icons">trending_down</i>&nbsp;
	    <input type="number" name="p_lower" placeholder="Quantity Lower Limit" required/>
	</div><br><br>
	<div class="form-check form-check-inline">
		<i class="material-icons">attack_money</i>&nbsp;
	    <input type="text" name = "p_price" placeholder="Price" pattern="^\d+(?:\.\d{1,2})?$" required/>
	</div><br><br>
	    <input class="add-button" type="submit" value="Add"><br>
	    <br>
  		</form>
	</div>
</center>




<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>

</body>
</html>

<?php
if(isset($_POST['product_name'])){
	$product_name = $_POST['product_name'];
}
if(isset($_POST['p_quantity'])){
	$p_quantity = $_POST['p_quantity'];
}
if(isset($_POST['p_lower'])){
	$p_lower = $_POST['p_lower'];
}
if(isset($_POST['p_price'])){
	$p_price = $_POST['p_price'];
}


if(!empty($product_name) || !empty($p_quantity) || !empty($p_lower) || !empty($p_price)){
	$host = "localhost";
	$dbUsername = "root";
	$dbPassword = "";
	$dbname = "inventory_management";
	$conn = new mysqli($host,$dbUsername,$dbPassword,$dbname);
	if(mysqli_connect_error()){
		die('Connection Error('. mysqli_connect_errno().')'. mysqli_connect_error());
	}else{
		$SELECT = "SELECT product_name From product_info Where product_name = ? Limit 1";
		$INSERT = "INSERT Into product_info (product_name,p_quantity,p_lower,p_price) values (?,?,?,?)";
		$stmt = $conn->prepare($SELECT);
		$stmt->bind_param("s",$product_name);
		$stmt->execute();
		$stmt->bind_result($product_name);
		$stmt->store_result();
		$rnum = $stmt->num_rows;
		if($rnum==0){
			$stmt->close();
			$stmt = $conn->prepare($INSERT);
			$stmt->bind_param("siii",$product_name,$p_quantity,$p_lower,$p_price);
			$stmt->execute();

			echo "Product is added";


		}else{

			echo "Product with this name is already registered";
		}
		$stmt->close();
		$conn->close();	
	}
	}else{
		echo "All fields are to be filled";
		die();
	}

?>


