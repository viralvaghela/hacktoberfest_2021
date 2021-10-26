<?php

declare(strict_types=1);

namespace ASPTest\App\Services;

use PDO;

class BaseDatabaseService
{
    const TYPE_MYSQL = 'mysql';
    const TYPE_MSSQL = 'mssql';

    private ?PDO $conn = null;
    private array $db;

    public function __construct(
        string $host,
        string $dbname,
        string $username,
        string $passwd,
        string $type = self::TYPE_MYSQL
    ) {
        $this->db = [
            'dsn' => null,
            'username' => $username,
            'passwd' => $passwd,
            'options' => null,
        ];

        if ($type === self::TYPE_MYSQL) {
            $this->db['dsn'] = "mysql:host={$host};dbname={$dbname};charset=utf8";
            $this->db['options'] = [
                PDO::ATTR_EMULATE_PREPARES => false,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci"
            ];
        } elseif ($type === self::TYPE_MSSQL) {
            $this->db['dsn'] = "dblib:version=7.0;charset=UTF-8;host={$host};dbname={$dbname}";
        }
    }

    public function getConnection(): PDO
    {
        if (null === $this->conn) {
            $this->conn = new PDO(
                $this->db['dsn'],
                $this->db['username'],
                $this->db['passwd'],
                $this->db['options']
            );
        }

        return $this->conn;
    }

    /**
     * Retorna string com caracteres ? separados por virgula, na mesma quantidade das posições que o array possui
     *
     * @param array $parameters
     * @return string
     */
    protected function getQuestionMarkParameters(array $parameters): string
    {
        return implode(', ', array_fill(0, count($parameters), '?'));
    }
}