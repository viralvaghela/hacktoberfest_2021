<?php

require_once('KnnCsv.php');
require_once('KnnTrain.php');

/* This is a simple Machine Learning program using the KNN or K - Nearest Neighbor algorithm.
Maybe the code below can't be read properly, so I try to make this program so that it can
be read better and for anyone who wants to use it is welcome.
*/

class Knn
{

    protected $sample;          //Data Sample Variabel
    protected $length;          //Length Of Data Sample
    protected $predictData;     //Predict Data Sample
    public $result;             //Result
    protected $resultSquare;    //temp result contain a Euclidean distance
    protected $label;           //Label Variabel


    public function __construct($sample, $dataLabel, $predictData, $k)
    {

        $this->sample = $sample;
        $length = count($sample);
        $this->predictData = $predictData;

        //First Process. Count Euclidean distance
        $tempResult = $this->forMin($sample, $length, $predictData);
        $this->resultSquare = $tempResult;

        //Send the Result
        $this->result = $this->label($dataLabel, $k);
    }

    //Function to count (x1 - x2)^2 , (y1-y2)^2 , etc
    private function forMin($sample, $length, $predictData)
    {

        $lengthPredict = count($predictData);

        for ($i = 0; $i < $length; $i++) {
            for ($j = 0; $j < $lengthPredict; $j++) {
                $resultForMin[$i][] = pow($predictData[$j] - $sample[$i][$j], 2);
            }
        }

        $sendToSquare = $this->square($resultForMin, $length, $lengthPredict);
        return $sendToSquare;
    }

    //function to count square root from forMin function
    private function square($srcData, $srcLength, $srcPredictDataLength)
    {

        for ($i = 0; $i < $srcLength; $i++) {

            $resultSquare[] = sqrt(array_sum($srcData[$i]));
        }
        return $resultSquare;
    }

    //Function for searching the match Label. Including order the array descending and limitng by k (key) 
    public function label($dataLabel, $k)
    {

        $finalResult = $this->resultSquare;
        $countResultSquare = count($this->resultSquare);
        $this->label = $dataLabel;
        $countDataLabel = count($dataLabel);

        if ($countResultSquare != $countDataLabel) {
            return "The count of Label data is not match with Sample Data";
        }

        for ($i = 0; $i < $countResultSquare; $i++) {

            $arrayMap[] = ['value' => $finalResult[$i], 'label' => $dataLabel[$i]];
        }

        usort($arrayMap, function ($a, $b) {
            return $a['value'] <=> $b['value'];
        });

        for ($j = 0; $j < $k; $j++) {

            $orderByK[] = $arrayMap[$j];
        }

        $sendToArrayOrder = $this->arrayOrder($orderByK);
        return $sendToArrayOrder;
    }

    //Function to searching match label. Counting the highest label that have lower values (shorter distance)
    private function arrayOrder($orderByK)
    {

        $countOrderByK = count($orderByK);
        for ($i = 0; $i < $countOrderByK; $i++) {

            $finalResult[] = $orderByK[$i]['label'];
        }

        $counted = array_count_values($finalResult);
        $final = array_keys($counted, max($counted));
        return $final[0];
    }

    //Get sample raw
    public function getSample()
    {

        return $this->sample;
    }

    //Get label raw
    public function getLabel()
    {

        return $this->label;
    }

    //Get Predict raw
    public function getPrediction()
    {

        return $this->predictData;
    }

    //Get result from square root from (x1-x2)^2 + (y1-y2)^2 + etc
    public function getSquare()
    {

        return $this->resultSquare;
    }
}
