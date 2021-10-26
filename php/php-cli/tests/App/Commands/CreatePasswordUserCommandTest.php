<?php

declare(strict_types=1);

namespace Tests\App\Commands;

use ASPTest\App\Commands\CreatePasswordUserCommand;
use ASPTest\App\Repositories\UserRepository;
use ASPTest\App\Services\UserService;
use PHPUnit\Framework\TestCase;
use Symfony\Component\Console\Application;
use Symfony\Component\Console\Tester\CommandTester;

final class CreatePasswordUserCommandTest extends TestCase
{
    private UserRepository $repository;
    private CommandTester $commandTester;

    protected function setUp(): void
    {
        $this->repository = $this->createMock(UserRepository::class);

        $application = new Application();
        $application->add(new CreatePasswordUserCommand(new UserService($this->repository)));
        $command = $application->find('USER:CREATE-PWD');
        $this->commandTester = new CommandTester($command);
    }

    /**
     * @dataProvider provideInvalidParams
     */
    public function testExecuteShouldThrowExceptionForInvalidParams(int $id, string $password, string $passwordConfirmation)
    {
        $input = [
            'id' => $id,
            'password' => $password,
            'passwordConfirmation' => $passwordConfirmation,
        ];

        $this->expectException(\Exception::class);
        $this->commandTester->execute($input);
    }

    public function provideInvalidParams(): array
    {
        return [
            'Different passwords' => [
                'id' => 1,
                'password' => 'Kayo@17',
                'passwordConfirmation' => 'Kayo@1712',
            ],
            'User not found' => [
                'id' => 19765,
                'password' => 'Kayo@17',
                'passwordConfirmation' => 'Kayo@17',
            ],
            'Password less than 6 characters' => [
                'id' => 1,
                'password' => 'K@y17',
                'passwordConfirmation' => 'K@y17',
            ],
            'Password without special character' => [
                'id' => 1,
                'password' => 'Kayo17',
                'passwordConfirmation' => 'Kayo17',
            ],
            'Password without number character' => [
                'id' => 1,
                'password' => 'Kayo@bruno',
                'passwordConfirmation' => 'Kayo@bruno',
            ],
            'Password without uppercase character' => [
                'id' => 1,
                'password' => 'kayo@bruno12',
                'passwordConfirmation' => 'kayo@bruno12',
            ]
        ];
    }
}