<?php
	$num1 = range(200,0);
	$num2 = range(99,0);

	$r1 = array_rand($num1);
	$r2 = array_rand($num2);

	$n1 = $num1[$r1];
	$n2 = $num2[$r2];

	$cap = $n1 ."+". $n2;
	$result = $n1 + $n2;
?>
<html>
	<head>
	</head>
	<body>
		<center>
		<form method="POST" action="<?php echo $_SERVER["PHP_SELF"];?>">
			<?php echo $cap;?>
			<input type="text" name="t2">
			<input type="hidden" name="t3" value="<?php echo $result;?>">
			<input type="submit" name="submit" value="Verify">
		</form>
		</center>
	</body>
</html>
<?php
	if(isset($_POST['submit'])) 
	{
		if($_POST['t3']==$_POST['t2'])
		{
			echo "<font color='red' size='5'>welcome</font>";
		}
		else
		{
			echo "<font color='blue' size='3'>Enter correct answer</font>";
		}
	}



?>

	
		