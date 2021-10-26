<?php

declare(strict_types=1);

namespace ASPTest\App\Services;

use ASPTest\App\Contracts\Persistence;
use ASPTest\App\Models\UserDTO;

final class AppDatabaseService extends BaseDatabaseService implements Persistence
{
    public function persist(UserDTO $userDTO): int
    {
        $fields = ['name', 'last_name', 'email', 'age', 'password', 'created_at', 'updated_at'];
        $parameters = $this->getQuestionMarkParameters($fields);
        $fields = implode(', ', $fields);
        $now = (new \DateTime())->format('Y-m-d H:i:s');

        $sql = <<<SQL
    INSERT INTO `users` ({$fields}) VALUES ({$parameters});
SQL;

        $stmt= $this->getConnection()->prepare($sql);
        $stmt->execute([
            $userDTO->name, $userDTO->lastName, $userDTO->email, $userDTO->age, null, $now, $now
        ]);

        return (int) $this->getConnection()->lastInsertId();
    }

    public function retrieve(string $field, mixed $value): array|bool
    {
        $sql = <<<SQL
    SELECT * FROM users WHERE `{$field}` = '{$value}'
SQL;

        $stmt = $this->getConnection()->query($sql);
        return $stmt->fetch();
    }

    public function update(int $id, array $data): void
    {
        $now = (new \DateTime())->format('Y-m-d H:i:s');
        $data = array_merge($data, ['updated_at' => $now]);
        $fields = implode('=?, ', array_keys($data));

        $sql = <<<SQL
    UPDATE users SET {$fields}=? WHERE `id`=?
SQL;

        $data = array_merge($data, ['id' => $id]);
        $stmt= $this->getConnection()->prepare($sql);
        $stmt->execute(array_values($data));
    }
}
