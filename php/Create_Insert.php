<!doctype html>
<html lang="en">
  <head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>Crud Operations using php</title>
    <style>
        .container{
            width: 700px;
            margin-top: 30px;
        }
        .container2{
            width: 700px;
            margin-left: 400px;
            margin-top: 60px;
        }
    </style>
  </head>
  <body>
    <h1 style="text-align: center; margin-top:30px">Take Notes</h1>
    <div class="container">
    <form action="crud.php" method="POST">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Enter Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Description</label>
    <br>
    <textarea name="des" id="des" cols="88" rows="5"></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>  
<div class="container2">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Sr no.</th>
      <th scope="col">Title</th>
      <th scope="col">Description</th>
    </tr>
  </thead>
        <?php 
         // The Database and Table was predefined inside the phpmyadmin
            $server="localhost";
            $user="root";
            $pass="";
            $db="crud";
            
            $connect=mysqli_connect($server, $user, $pass ,$db);

            if($_SERVER['REQUEST_METHOD']=="POST"){
                $title=$_POST['title'];
                $des=$_POST['des'];

                $insert="INSERT INTO `crud` (`sr.no`, `title`, `description`) VALUES (NULL, '$title', '$des')";

                $query=mysqli_query($connect, $insert);
                if(empty($title) || empty($des)){
                    echo "Please Fill All The Fields"."<br>";
                }
                elseif($query){
                    echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Yes!</strong>Your Note has been inserted successfully
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>';
                }
                else{
                    echo "Failed";
                }
                $select="SELECT * FROM `crud`";
                $query2=mysqli_query($connect, $select);
                $row=mysqli_num_rows($query2);
                if($row>0){
                    while($rows=mysqli_fetch_assoc($query2)){
                      echo"<tr>
                        <td>".$rows['sr.no']."</td>
                        <td>".$rows['title']."</td>
                        <td>".$rows['description']."</td>
                      </tr>";
                    }
                }
                
            }

        ?>
</table>
</div>
  </body>
</html>