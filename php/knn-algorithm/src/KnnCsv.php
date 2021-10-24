<?php

/*KNN from CSV
This is a class for processing KNN from dataset in csv type.
*/

class KnnCsv
{

    public $filePath;
    public $sample;
    public $label;
    public $result;
    public $newData;
    public $prediction;
    protected $sampleLength;


    public function __construct($filePath, $predictData = [], $k = 3, $insertNewToCsv = false)
    {
        $this->filePath = 'dataset/' . $filePath;
        $this->prediction = $predictData;
        $file = fopen($this->filePath, 'r');

        while (($line = fgetcsv($file))) {

            $resultCsv[] = $line;
        }
        fclose($file);

        array_shift($resultCsv);

        for ($i = 0; $i < count($resultCsv); $i++) {

            $label[] = end($resultCsv[$i]);
            unset($resultCsv[$i][count($resultCsv[$i]) - 1]);
        }

        $this->sample = $resultCsv;
        $this->label = $label;
        $this->sampleLength = count($this->sample);

        $result = new Knn($this->sample, $this->label, $predictData, $k);
        $this->result = $result->result;

        if ($insertNewToCsv == true) {

            $this->addToCsv($predictData, $result->result);
        }
    }

    private function addToCsv($dataToInsert, $result)
    {

        $newData = $dataToInsert;
        $result = $this->result;
        array_push($newData, $this->result);

        $stringToInput = '';
        $it = new RecursiveIteratorIterator(new RecursiveArrayIterator($newData));
        foreach ($it as $v) {
            $stringToInput .= $v . ",";
        }

        $newString = rtrim($stringToInput, ', ');
        $dataArrayToInsert[] = $newString;

        $fileCsv = fopen($this->filePath, "a");

        foreach ($dataArrayToInsert as $line) {
            fputcsv($fileCsv, explode(',', $line));
        }

        fclose($fileCsv);
    }

    public function getLabel()
    {

        return $this->label;
    }

    public function getSample()
    {

        return $this->sample;
    }

    public function getPrediction()
    {

        return $this->prediction;
    }
}
