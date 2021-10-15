<!DOCTYPE html>
<html>
<head>
	<title>Customers Management Page</title>
	<link rel="stylesheet" type="text/css" href="form.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body> 
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		 <span class="navbar-brand mb-0 h1"><img src="inventory_icon.png" width="45px" height="45px"> INVERGEMENT </span>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="product_insert.php">Add New Product</a>
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
 	<div>
  		<form  class = "form_style" action="" method="POST"><br>
  		<h2>Add Customer</h2><br>
  		<div class="form-check form-check-inline">
  			<i class="material-icons">face</i>&nbsp;
	    	<input type="text" class="text-input" name="customer_name" placeholder="Full Name" required/>
	    </div><br><br>
	    <div class="form-check form-check-inline">
	    	<i class="material-icons">email</i>&nbsp;
	    	<input type="email" class="text-input"  name="customer_email" placeholder="Email" required/>
	    </div><br><br>
	    <div class="form-check form-check-inline">
	    	<i class="material-icons">phone_android</i>
	    	<input type="phone" class="text-input" name="customer_phno" placeholder="Phone No" required/>
	    </div><br><br>
	    <div class="form-check form-check-inline">
	    	<input class="form-check-input" type="radio" id="male" name="customer_gender" value="male">
  			<label class="form-check-label" for="male">Male</label>
		</div>&nbsp;
		<div class="form-check form-check-inline">
  			<input class="form-check-input" type="radio" id="female" name="customer_gender" value="female">
  			<label class="form-check-label" for="female">Female</label>
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
if(isset($_POST['customer_name'])){
	$customer_name = $_POST['customer_name'];
}
if(isset($_POST['customer_email'])){
	$customer_email = $_POST['customer_email'];
}
if(isset($_POST['customer_phno'])){
	$customer_phno = $_POST['customer_phno'];
}
if(isset($_POST['customer_gender'])){
	$customer_gender = $_POST['customer_gender'];
}


if(!empty($customer_name) || !empty($customer_email) || !empty($customer_phno) || !empty($customer_gender)){
	$host = "localhost";
	$dbUsername = "root";
	$dbPassword = "";
	$dbname = "inventory_management";
	$conn = new mysqli($host,$dbUsername,$dbPassword,$dbname);
	if(mysqli_connect_error()){
		die('Connection Error('. mysqli_connect_errno().')'. mysqli_connect_error());
	}else{
		$SELECT = "SELECT customer_email From customer_info Where customer_email = ? Limit 1";
		$INSERT = "INSERT Into customer_info (customer_name,customer_email,customer_phno,customer_gender) values (?,?,?,?)";
		$stmt = $conn->prepare($SELECT);
		$stmt->bind_param("s",$customer_email);
		$stmt->execute();
		$stmt->bind_result($customer_email);
		$stmt->store_result();
		$rnum = $stmt->num_rows;
		if($rnum==0){
			$stmt->close();
			$stmt = $conn->prepare($INSERT);
			$stmt->bind_param("ssis",$customer_name,$customer_email,$customer_phno,$customer_gender);
			$stmt->execute();

			echo "Customer is added";


		}else{

			echo "This email is already registered";
		}
		$stmt->close();
		$conn->close();	
	}
	}else{

		echo "All fields are to be filled";

		die();
	}

?>




