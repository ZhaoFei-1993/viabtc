<?php

/* require 'vendor/autoload.php';
$client = new JsonRpc\Client("http://192.168.0.179:8080");
$client->call('market.last', array("BTCBCH"));

var_dump($client->result); */

function Post($data_string ,$url){
		 
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_PORT, 8080);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($ch, CURLOPT_POSTFIELDS,$data_string );
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
			'Content-Type: application/json',
			'Content-Length: ' . strlen($data_string ))
		);
	 
		$return_str = curl_exec($ch);
		if (false === $return_str) {
			 die(curl_error($ch));
		}
		curl_close($ch);
		$return_str=json_decode($return_str);
		return $return_str;
}

function send_post($url, $post_data) {    
      $postdata = http_build_query($post_data);    
      $options = array(    
            'http' => array(    
                'method' => 'POST',    
                'header' => 'Content-type:application/json',    
                'content' => $postdata,    
                'timeout' => 15 * 60 // 超时时间（单位:s）    
            )    
        );    
        $context = stream_context_create($options);    
        $result = file_get_contents($url, false, $context);             
        return $result;    
}
 

$data['method']='market.last';
$data['params']=['BTC/VT'];
$data['id']=time();
 
$res = send_post("http://127.0.0.1:8080/",  $data );

var_dump($res);


?>
