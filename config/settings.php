<?php

return [
        'displayErrorDetails' => true,
        'db' => [
            'host' => 'mysql',
            'user' => 'root',
            'pass' => 'root',
            'dbname' => 'pleasureplants'
        ],
        'logger' => [
            'name' => 'app',
            'path' => isset($_ENV['docker']) ? 'php://stdout' : __DIR__ . '/../logs/app.log',
        ],
    ];
