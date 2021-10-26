<?php

declare(strict_types=1);

namespace ASPTest\App\Models;

final class UserDTO
{
    public function __construct(
        public string $name,
        public string $lastName,
        public string $email,
        public mixed $age,
        public ?int $id = null,
    )
    {}
}
