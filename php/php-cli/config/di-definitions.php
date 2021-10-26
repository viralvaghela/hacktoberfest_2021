<?php

use ASPTest\App\Contracts\Persistence;
use ASPTest\App\Services\AppDatabaseService;
use function DI\create;

$host = $_ENV['DB_HOST'];
$db = $_ENV['DB_DATABASE'];
$user = $_ENV['DB_USER'];
$pass = $_ENV['DB_PASS'];

return [
    Persistence::class => create(AppDatabaseService::class)->constructor($host, $db, $user, $pass),
];