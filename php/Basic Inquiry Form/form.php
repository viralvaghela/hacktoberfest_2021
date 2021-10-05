<?php

if(isset($_POST['first_name']))
{

$sub_msg=false;
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername='localhost';
$username='root';
$password='';
$databasename='Website_form';

// // connect = mysqli_connect($this->servername, $this->username, $this->password, $this->databasename);

$conn=mysqli_connect($servername,$username,$password,$databasename);

if(!$conn)
{
     die("Connect is Failed due to some error");
     mysqli_connect_error();
}

 $first_name = $_POST['first_name'];
 $last_name = $_POST['last_name'];
 $email_id = $_POST['email'];
 $subject = $_POST['subject'];
 $message = $_POST['message'];

 $sql_query = "INSERT INTO `PHP_Inquiry_form` (`user_first_name`, `user_last_name`, `user_email_id`, `user_subject`, `user_message`, `time_stamp`) 
 VALUES ('".$first_name."','".$last_name."','".$email_id."','".$subject."','".$message."',current_timestamp())"; 

    if($conn->query($sql_query)==true)
    {
        echo "Welldone";
        $sub_msg=true;
    }
    else
    {
        echo "Error: " . $sql_query . "<br>" . mysqli_error($conn);
    }

    $conn->close();

}
 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Inquiry Form</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container_new">
   
    <div>
        <div>
            <div>
                <h2 class="heading"> PHP Inquiry Form </h2>
                <h3 class="sub_heading">This Form is Developed for Testing Purpose</h3>
                <?php
                if($sub_msg == true)
                {
                    echo "<h3 class='sub_heading'>Thanks for the Response </h3>";
                }
                else 
                {
                    echo"";
                }
                ?>
                
            </div>

            <div class="form_content">
                
                <form action="form.php" method="POST">
                    <div>

                        <div class="first_row">
                            <input class="user_input_1" type="text" name="first_name" id="first_name" placeholder="First Name">
                            <input class="user_input_1" type="text" name="last_name" id="last_name" placeholder="Last Name">
                        </div>
                        <div>
                            <div>
                                <input class="user_input" type="email" id = "email" name="email" placeholder="Email">
                            </div>
                         
                            <div>
                                <input class="user_input" type="text" id="subject" name="subject" placeholder="Subject">
                            </div>
    
                            <div>
                                <textarea class="user_input" name="message" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                            </div>
    
                            <div class="btn_layout">
                                <button class="btn" type="submit" value="Submit">Submit</button>
                             </div>
                        </div>
                    
                    </div>

                    

                </form>               
            </div>
        </div>
    </div>

</div>

    <script src="form.js">
    </script>
</body>
</html>