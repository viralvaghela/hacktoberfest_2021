<?php

declare(strict_types=1);

namespace ASPTest\App\Services;

use ASPTest\App\Models\UserDTO;
use ASPTest\App\Repositories\UserRepository;

final class UserService
{
    const MIN_NAME_LENGTH = 2;
    const MAX_NAME_LENGTH = 35;
    const MAX_AGE = 150;
    const EMAIL_RULES = '/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+.(?:tp|er)+$/';
    const PASSWORD_RULES = '/^(?=.*[!@#$%^&*-])(?=.*[0-9])(?=.*[A-Z]).{6,20}$/';

    public function __construct(
        public UserRepository $userRepository
    )
    {}

    /**
     * @throws \Exception
     */
    public function createUser(UserDTO $userDTO): int
    {
        $this->validateParams($userDTO);
        return $this->saveUser($userDTO);
    }

    /**
     * @throws \Exception
     */
    public function updatePassword(int $id, string $password): void
    {
        $user = $this->userRepository->findById($id);
        if (empty($user)) {
            throw new \Exception('User not found');
        }
        $this->validatePassword($password);

        $password = $this->passwordEncrypt($password);
        $this->userRepository->updatePassword($id, $password);
    }

    private function passwordEncrypt(string $password): string
    {
        // TODO: Find alternative to mcrypt because that is deprecated
        $options = [
            'cost' => 10,
//            'salt' => '66646687667584563468546' //mcrypt_create_iv(10, MCRYPT_DEV_URANDOM),
        ];

        return password_hash($password, PASSWORD_BCRYPT, $options);
    }

    /**
     * @throws \Exception
     */
    private function validatePassword(string $password): void
    {
        if (!preg_match(self::PASSWORD_RULES, $password)) {
            $message = 'The password must have the following items: 1 special character, 1 number, 1 capital letter and 6 characters';
            throw new \Exception($message);
        }
    }

    /**
     * @throws \Exception
     */
    private function saveUser(UserDTO $userDTO): int
    {
        $hasUser = $this->userRepository->findByEmail($userDTO->email);
        if (false !== $hasUser && null !== $hasUser) {
            throw new \Exception('User already exists in database!');
        }

        return $this->userRepository->save($userDTO);
    }

    /**
     * @throws \Exception
     */
    private function validateParams(UserDTO $userDTO): void
    {
        $this->validateNameAndLastName($userDTO->name, $userDTO->lastName);
        $this->validateEmail($userDTO->email);
        if (null !== $userDTO->age) {
            $this->validateAge((int) $userDTO->age);
        }
    }

    /**
     * @throws \Exception
     */
    private function validateNameAndLastName(string $name, string $lastName): void
    {
        $nameLength = strlen($name);
        $lastNameLength = strlen($lastName);

        if ($nameLength < self::MIN_NAME_LENGTH || $nameLength > self::MAX_NAME_LENGTH) {
            throw new \Exception('The name length is invalid!');
        }

        if ($lastNameLength < self::MIN_NAME_LENGTH || $lastNameLength > self::MAX_NAME_LENGTH) {
            throw new \Exception('The last name length is invalid!');
        }
    }

    /**
     * @throws \Exception
     */
    private function validateEmail(string $email): void
    {
        if (!preg_match(self::EMAIL_RULES, $email)) {
            throw new \Exception('Email is invalid!');
        }
    }

    /**
     * @throws \Exception
     */
    private function validateAge(int $age): void
    {
        if ($age < 0 || $age > self::MAX_AGE) {
            throw new \Exception('Age is invalid!');
        }
    }
}