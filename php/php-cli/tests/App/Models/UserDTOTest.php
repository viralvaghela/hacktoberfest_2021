<?php

declare(strict_types=1);

namespace Tests\App\Models;

use ASPTest\App\Models\UserDTO;
use PHPUnit\Framework\TestCase;

final class UserDTOTest extends TestCase
{
    public function testUserShouldHasRequiredAttributes()
    {
        $this->assertClassHasAttribute('name', UserDTO::class);
        $this->assertClassHasAttribute('lastName', UserDTO::class);
        $this->assertClassHasAttribute('email', UserDTO::class);
    }
}