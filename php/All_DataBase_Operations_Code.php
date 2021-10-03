<?php
    // For Creation of a New Database inside mysql
    
    $server="localhost";
    $user="root";
    $password="";
    // $connect=mysqli_connect($server, $user, $password);
    // $database_query="CREATE DATABASE xyz";
    // $query=mysqli_query($connect, $database_query);
    // if($query){
    //     echo"Database Created Successfully"."<br>";
    // }
    // else{
    //     echo mysqli_connect_error()."<br>";
    // }

    // for creation a table inside the database
    
    $database="xyz";
    $connect=mysqli_connect($server, $user, $password, $database);

    // $create_table="CREATE TABLE `xyz`.`Student` ( S_ID INT(10) NOT NULL , `name` VARCHAR(200) NOT NULL)";
    
    // $query=mysqli_query($connect, $create_table);

    // if($query){
    //     echo "Table Has been Created Successfully"."<br>";
    // }
    // else{
    //     echo mysqli_connect_error()."<br>";
    // }

    // For Inserting Data Into Table Using Query

    // $insert_query="INSERT INTO `student` (`S_ID`, `name`) VALUES (01, 'abc')";

    // $query=mysqli_query($connect, $insert_query);

    // if($query){
    //     echo "Data Inserted Successfully"."<br>";
    // }
    // else{
    //     echo mysqli_connect_error();
    // }

    // For Updating Data Into table inside database xyz

    // $update_query="UPDATE STUDENT SET name='XYZ' WHERE S_ID=1";

    // $query=mysqli_query($connect, $update_query);

    // if($query){
    //     echo"The Data Has been Updated Successfully"."<br>";
    // }
    // else{
    //     echo mysqli_connect_error()."<br>";
    // }

    // For Deletion of data in table student inside database xyz

    $delete_query="DELETE FROM STUDENT WHERE name='XYZ'";

    $query=mysqli_query($connect, $delete_query);

    if($query){
        echo"Data has been deleted Successfully"."<br>";
    }
    else{
        echo mysqli_connect_error();
    }



?>