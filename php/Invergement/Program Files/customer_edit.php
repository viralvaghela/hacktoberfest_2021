<?php

 include 'conn.php';

 if(isset($_POST['done'])){

 $customer_id = $_GET['customer_id'];
 $customer_name = $_POST['customer_name'];
 $customer_email = $_POST['customer_email'];
 $customer_phno = $_POST['customer_phno'];
 $customer_gender = $_POST['customer_gender'];

 $q = " update customer_info set customer_id=$customer_id, customer_name='$customer_name', customer_email='$customer_email' , customer_phno='$customer_phno' , customer_gender='$customer_gender' where customer_id=$customer_id  ";



 $query = mysqli_query($conn,$q);

 header('location:customer_view.php');
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

 <div class="col-lg-6 m-auto">
 
 <form method="post">
 
 <br><br><div class="card">
 
 <div class="card-header bg-dark">
 <h1 class="text-white text-center">  Update Operation </h1>
 </div><br>

 <label> Customer Name: </label>
 <input type="text" name="customer_name" class="form-control"> <br>

 <label> Email: </label>
 <input type="text" name="customer_email" class="form-control"> <br>

  <label> Phone No: </label>
 <input type="text" name="customer_phno" class="form-control"> <br>

  <label> Gender: </label> 
 <input type="text" name="customer_gender" class="form-control"> <br>

 <button class="btn btn-success" type="submit" name="done"> Submit </button><br>

 </div>
 </form>
 </div>
</body>
</html>