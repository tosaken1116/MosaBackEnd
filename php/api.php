<?php

// 必要なヘッダーを設定
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');

if ($_SERVER['REQUEST_METHOD'] === 'GET' && $_SERVER['REQUEST_URI'] === '/hello') {
    $response = array('message' => 'Hello, world!');
} else {
    $response = array('error' => 'Invalid endpoint');
}

echo json_encode($response);