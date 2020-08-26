<?php

use App\Classes\HelloWorld;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;

require __DIR__ . '/../vendor/autoload.php';
$settings = require __DIR__ . '/../config/settings.php';

$app = new App;

$container = $app->getContainer();

$container['logger'] = function($settings) {
    $logger = new \Monolog\Logger($settings['logger']['name']);
    $file_handler = new \Monolog\Handler\StreamHandler($settings['logger']['path']);
    $logger->pushHandler($file_handler);
    return $logger;
};
#$this->logger->addInfo('Something interesting happened');

$container['db'] = function ($settings) {
    $db = $settings['db'];
    $pdo = new PDO('mysql:host=' . $db['host'] . ';dbname=' . $db['dbname'],
        $db['user'], $db['pass']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $pdo;
};



$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!");
    return $response;
});

$app->get('/h2', HelloWorld::class);

$app->run();
