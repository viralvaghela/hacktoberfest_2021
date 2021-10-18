<?php
function formula($r, $si)
{
    $soal = 1 . ". Jika diketahui jari jari sebuah lingkaran adalah "
        . $r . $si .
        ", maka berapakah luas dan keliling lingkaran tersebut? <br>";

    define("phi", 3.14);

    echo $soal;
    print "<hr>";
    echo "Phi : " . phi . "<br>" . "Jari-jari : " . $r . $si . "<br>";
    print "-------------------------- <br>";
    echo "<b>Luas</b> : " . phi * $r * $r  . $si . "<sup>2</sup><br>";
    echo "<b>Keliling</b> : " . phi * (2 * $r) . $si;
}
$run = formula(10, "cm");
echo $run;

echo    "<div style='position:fixed;bottom:5px;font-size:10px'>
        <p>
        Made with ❤️ by Sahl
        </p>
        </div>";
?>
