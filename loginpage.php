<?php
$servername='localhost';
$username='root';
$password='';
$dbname = "college";
$conn=mysqli_connect($servername,$username,$password,$dbname);
if(!$conn){
   die('Could not Connect My Sql:' .mysql_error());
}?>
<!DOCTYPE html>
<html>
<head>
	<title>LOGIN PAGE</title>
</head>
<body><center>
	<form method="post">
	<div><h3><style color="red "User name</h3></div><input type="text" name="name" placeholder="Enter first name" value=""required><br><br>
	<h3>Password</h3><input type="password" name="password" placeholder="Enter password"><br><br>
	<input type="submit" name="Login" value="Login"><br><br>
	</form>
</center>



</body>
</html>
<?php
if(isset($_POST['Login']))
{
	$name=$_POST['name'];
	$password=$_POST['password'];
	$que=mysqli_query($conn,"SELECT * from course where firstname='$name' and email='$password'");

		if(mysqli_num_rows($que)>0){
			echo "<script>alert('login ok')</script>";
			echo "<script>window.open('fileupload.php'),'_self'</script>";
			


		} else{
			echo"<script>alert('usename and password are incorrect')</script>";

		}}
	
?>