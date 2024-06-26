<?php
declare(strict_types=1);

use App\Application\Actions\HelloWorld;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;

return function (App $app) {

    $app->options('/{routes:.+}', function (Request $request, Response $response) {
        return $response;
    });

    $app->get('/', HelloWorld::class);

};
