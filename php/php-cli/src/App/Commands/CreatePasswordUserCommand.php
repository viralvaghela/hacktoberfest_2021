<?php

declare(strict_types=1);

namespace ASPTest\App\Commands;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

final class CreatePasswordUserCommand extends BaseUserCommand
{
    protected static $defaultName = 'USER:CREATE-PWD';
    protected array $requiredFields = ['id', 'password', 'passwordConfirmation'];

    protected function configure(): void
    {
        $this
            ->setHelp('This command allows you to update a user password...')
            ->addArgument('id', InputArgument::REQUIRED, 'ID(*)')
            ->addArgument('password', InputArgument::REQUIRED, 'Password(*)')
            ->addArgument('passwordConfirmation', InputArgument::REQUIRED, 'Password Confirmation(*)')
        ;
    }

    /**
     * @throws \Exception
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $id = (int) $input->getArgument('id');
        $password = $input->getArgument('password');
        $passwordConfirmation = $input->getArgument('passwordConfirmation');

        $this->validateRequiredFields($input);
        if ($password !== $passwordConfirmation) {
            throw new \Exception('Invalid password confirmation');
        }

        $this->userService->updatePassword($id, $password);

        return Command::SUCCESS;
    }
}