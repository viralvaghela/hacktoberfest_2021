<?php

// Initialise variables
$endpoint = "https://api.zamzar.com/v1";
$apiKey = "YOUR_API_KEY";
$sourceFilePath = "./tmp/test.pdf"; 
$convertedFilePath = realpath('./tmp/');
$targetFormat = "txt";

// Start the job
echo "Starting new conversion job\n";
$jobID = start_conversion($apiKey, $endpoint, $sourceFilePath, $targetFormat);
echo "Job ID is: $jobID\n";

// Check the status
do {
  $job = check_status($apiKey, $endpoint, $jobID);
  $jobStatus = $job->status;
  echo "  Status: $jobStatus\n";
  sleep(1);
} while ($jobStatus !== "successful");

echo "Conversion done!\n";

// Download the converted files
foreach($job->target_files as $file) {
    echo "Downloading start of converted file: $file->name<br/><br/>";
    download_file($apiKey, $endpoint, $file->id, $convertedFilePath.'/'.$file->name);
}

function start_conversion($apiKey, $endpoint, $sourceFilePath, $targetFormat) {

  // Setup variables for cURL
  $sourceFile = curl_file_create(realpath($sourceFilePath));
  $postData = array("source_file" => $sourceFile, "target_format" => $targetFormat);
 
  // Execute cURL
  $ch = curl_init(); // Init curl
  curl_setopt($ch, CURLOPT_URL, $endpoint.'/jobs'); // API endpoint
  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
  curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // Return response as a string
  curl_setopt($ch, CURLOPT_USERPWD, $apiKey . ":"); // Set the API key as the basic auth username
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
  $body = curl_exec($ch);
  curl_close($ch);

  $job = json_decode($body);
   echo "<pre>";
print_r($job);
echo "</pre>";
  $jobID = $job->id;
  return $jobID;
}

function check_status($apiKey, $endpoint, $jobID) {
  $ch = curl_init(); // Init curl
  curl_setopt($ch, CURLOPT_URL, "$endpoint/jobs/$jobID"); // API endpoint
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // Return response as a string
  curl_setopt($ch, CURLOPT_USERPWD, $apiKey . ":"); // Set the API key as the basic auth username
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
  $body = curl_exec($ch);
  curl_close($ch);

  // Return job query result as JSON
  $job = json_decode($body);
   echo "<pre>";
print_r($job);
echo "</pre>";
  return $job;
}

function download_file($apiKey, $endpoint, $fileID, $fileSavePath) {
  $ch = curl_init(); // Init curl
  curl_setopt($ch, CURLOPT_URL, "$endpoint/files/$fileID/content"); // API endpoint
  curl_setopt($ch, CURLOPT_USERPWD, $apiKey . ":"); // Set the API key as the basic auth username
  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
//   echo '<br/><br/> realpath output file: <br/>'.realpath('./output/');
 
  $fh = fopen($fileSavePath, "wb"); // Error occurs
  curl_setopt($ch, CURLOPT_FILE, $fh); // Error occurs
  
  $body = curl_exec($ch);
  curl_close($ch);
  echo '<br/>output file: <br/>'.$fileSavePath;
  echo '<br/><br/> File Downloaded: '.print_r($body);
}
