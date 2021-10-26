<?php

declare(strict_types=1);

namespace ASPTest\App\Repositories;

use ASPTest\App\Models\UserDTO;
use ASPTest\App\Contracts\Persistence;

class UserRepository
{
    public function __construct(
        private Persistence $persistence
    )
    {}

    public function save(UserDTO $userDTO): int
    {
        return $this->persistence->persist($userDTO);
    }

    public function updatePassword(int $id, string $password): void
    {
        $this->persistence->update($id, ['password' => $password]);
    }

    public function findByEmail(string $email): mixed
    {
        return $this->persistence->retrieve('email', $email);
    }

    public function findById(int $id): mixed
    {
        return $this->persistence->retrieve('id', $id);
    }
}