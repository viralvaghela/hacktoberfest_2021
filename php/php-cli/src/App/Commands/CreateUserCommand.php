<?php

declare(strict_types=1);

namespace ASPTest\App\Commands;

use ASPTest\App\Models\UserDTO;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

final class CreateUserCommand extends BaseUserCommand
{
    protected static $defaultName = 'USER:CREATE';
    protected array $requiredFields = ['name', 'lastName', 'email'];

    protected function configure(): void
    {
        $this
            ->setHelp('This command allows you to create a user...')
            ->addArgument('name', InputArgument::REQUIRED, 'Name(*)')
            ->addArgument('lastName', InputArgument::REQUIRED, 'Last Name(*)')
            ->addArgument('email', InputArgument::REQUIRED, 'Email(*)')
            ->addArgument('age', InputArgument::OPTIONAL, 'Age')
        ;
    }

    /**
     * @throws \Exception
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $name = $input->getArgument('name');
        $lastName = $input->getArgument('lastName');
        $email = $input->getArgument('email');
        $age = $input->getArgument('age') ?? null;

        $this->validateRequiredFields($input);

        $userDTO = new UserDTO($name, $lastName, $email, $age);
        $id = $this->userService->createUser($userDTO);
        $userDTO->id = $id;

        $output->writeln(json_encode($userDTO));

        return Command::SUCCESS;
    }
}
