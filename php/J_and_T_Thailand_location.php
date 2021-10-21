<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>JnT Location</title>
	</head>
	<body>
		<form name="send" action="J_and_T_Thailand_location.php?mode=add" method="post">จังหวัด<br/><input name="province" type="text" size="20" maxlength="250" /><input name="send" type="submit" value="Update Location" /></form><hr/>
		<?php
			$province = (isset($_POST['province'])) ? $_POST['province'] : '';
			$mode = (isset($_GET['mode'])) ? $_GET['mode'] : '';
			
			function get_jnt_branch($province)
			{
				
				$timeout = 10;
				$curl_getitem = curl_init();
				curl_setopt($curl_getitem, CURLOPT_PROXY, '');
				curl_setopt($curl_getitem, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
				curl_setopt($curl_getitem, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($curl_getitem, CURLOPT_SSL_VERIFYHOST, false);
				curl_setopt($curl_getitem,CURLOPT_HEADER,0);
				curl_setopt($curl_getitem, CURLOPT_HTTPHEADER, array("POST /jandt-vipcustomer-app/api/site/findSitesByKeyword.do HTTP/1.1","Content-Type: application/json;charset=utf-8","Charset: UTF-8","Host: 113.21.243.179:22234","User-Agent: Mozilla/5.0 (Linux; Android 7.1.2; SM-G977N Build/LMY48Z; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/75.0.3770.143 Safari/537.36"));
				curl_setopt($curl_getitem,CURLOPT_URL,"http://113.21.243.179:22234/jandt-vipcustomer-app/api/site/findSitesByKeyword.do");
				curl_setopt ($curl_getitem, CURLOPT_FOLLOWLOCATION, 1); 
				curl_setopt($curl_getitem,CURLOPT_RETURNTRANSFER,1);
				curl_setopt($curl_getitem,CURLOPT_CONNECTTIMEOUT,$timeout);
				curl_setopt($curl_getitem,CURLOPT_TIMEOUT,$timeout);
				curl_setopt($curl_getitem, CURLOPT_POST, true);
				curl_setopt ($curl_getitem, CURLOPT_POSTFIELDS,"{\"parameter\":{\"keyword\":\"$province\",\"pagenum\":1,\"pagesize\":20,\"latitude\":13.66033,\"longitude\":100.4574967},\"sessionid\":\"\"}");  
				$getitem = curl_exec($curl_getitem);
				curl_close($curl_getitem);
				
				return $getitem;
				
			}
			
			if($mode="add"){
				$json=get_jnt_branch($province);
				$json=json_decode($json, true);
				foreach ($json['data']['rows'] as $response){
				echo "$response[id] | $response[sitename] | $response[province] | $response[city] | $response[town] | $response[latitude],$response[longitude] | $response[sitephone] | $response[siteaddr] <hr/>";
				}
			}
		?>
	</body>
</html>