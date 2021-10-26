<?php

declare(strict_types=1);

namespace Tests\App\Commands;

use ASPTest\App\Commands\CreateUserCommand;
use ASPTest\App\Repositories\UserRepository;
use ASPTest\App\Services\UserService;
use PHPUnit\Framework\TestCase;
use Symfony\Component\Console\Application;
use Symfony\Component\Console\Tester\CommandTester;

final class CreateUserCommandTest extends TestCase
{
    private UserRepository $repository;
    private CommandTester $commandTester;

    protected function setUp(): void
    {
        $this->repository = $this->createMock(UserRepository::class);

        $application = new Application();
        $application->add(new CreateUserCommand(new UserService($this->repository)));
        $command = $application->find('USER:CREATE');
        $this->commandTester = new CommandTester($command);
    }

    /**
     * @dataProvider provideValidParams
     */
    public function testExecuteShouldCreateUser(string $name, string $lastName, string $email, int $age)
    {
        $input = [
            'name' => $name,
            'lastName' => $lastName,
            'email' => $email,
            'age' => $age,
        ];

        $this->commandTester->execute($input);
        $input['id'] = 0;

        $this->assertEquals(json_encode($input), trim($this->commandTester->getDisplay()));
    }

    /**
     * @dataProvider provideInvalidParams
     */
    public function testExecuteShouldThrowExceptionForInvalidParams(string $name, string $lastName, string $email, int $age)
    {
        $input = [
            'name' => $name,
            'lastName' => $lastName,
            'email' => $email,
            'age' => $age,
        ];

        $this->expectException(\Exception::class);
        $this->commandTester->execute($input);
    }

    public function provideValidParams(): array
    {
        return [
            'Valid Fields' => [
                'name' => 'Kayo Bruno',
                'lastName' => 'Queiroz',
                'email' => 'test' . rand(0, 99) . '@mail.tp',
                'age' => rand(1, 150),
            ]
        ];
    }

    public function provideInvalidParams(): array
    {
        return [
            'Invalid Email' => [
                'name' => 'Kayo Bruno',
                'lastName' => 'Queiroz',
                'email' => 'fulano@gmail.com',
                'age' => rand(0, 150),
            ],
            'Maximum age exceeded' => [
                'name' => 'Kayo Bruno',
                'lastName' => 'Queiroz',
                'email' => 'test' . rand(0, 99) . '@mail.tp',
                'age' => 200,
            ],
            'Negative Age' => [
                'name' => 'Kayo Bruno',
                'lastName' => 'Queiroz',
                'email' => 'test' . rand(0, 99) . '@mail.tp',
                'age' => -10,
            ],
            'Invalid name' => [
                'name' => 'K',
                'lastName' => 'Queiroz',
                'email' => 'test' . rand(0, 99) . '@mail.tp',
                'age' => rand(1, 150),
            ],
            'Invalid Last name' => [
                'name' => 'Kayo',
                'lastName' => 'Q',
                'email' => 'test' . rand(0, 99) . '@mail.tp',
                'age' => rand(1, 150),
            ],
        ];
    }
}