<?php
require_once('KnnCsv.php');

class KnnTrain
{

    public function __construct($filePath, $count, $offset, $limit)
    {
        $fileCsv = '../dataset/' . $filePath;
        $handle = fopen($fileCsv, 'r');
        $line = fgetcsv($handle);
        $numcount = count($line) - 1;

        for ($i = 0; $i < $count; $i++) {

            for ($j = 0; $j < $numcount; $j++) {

                $train[$j] = rand($offset, $limit);
            }
            new KnnCsv($filePath, $train, 3, true);
        }
    }
}