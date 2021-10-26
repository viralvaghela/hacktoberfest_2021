<?php

declare(strict_types=1);

namespace ASPTest\App\Contracts;

use ASPTest\App\Models\UserDTO;

interface Persistence
{
    public function persist(UserDTO $userDTO);

    public function retrieve(string $field, mixed $value);

    public function update(int $id, array $data);
}