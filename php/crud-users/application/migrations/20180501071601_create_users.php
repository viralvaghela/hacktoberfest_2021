<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Create_users extends CI_Migration {

        public function up()
        {
                $this->dbforge->add_field(array(
                        'id' => array(
                                'type'           => 'INT',
                                'constraint'     => 11,
                                'unsigned'       => TRUE,
                                'auto_increment' => TRUE
                        ),
                        'role' => array(
                                'type'           => 'TINYINT',
                                'constraint'     => 1,
                        ),
                        'firstname' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                        ),
                        'lastname' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                        ),
                        'email' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                                'unique'     => TRUE,
                        ),
                        'tempat_lahir' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                        ),
                        'tanggal_lahir' => array(
                                'type'       => 'DATE',
                        ),
                        'alamat' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                        ),
                        'handphone' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                                'unique'     => TRUE,
                        ),
                        'username' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                                'unique'     => TRUE,
                        ),
                        'password' => array(
                                'type'       => 'VARCHAR',
                                'constraint' => '255',
                        ),
                ));
                $this->dbforge->add_key('id', TRUE);
                $this->dbforge->create_table('users');

                $sql = "INSERT INTO `users` (`id`, `role`, `firstname`, `lastname`, `email`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `handphone`, `username`, `password`) VALUES
                (1, 1, 'Super', 'Admin', 'admin@admin.com', 'Jakarta', '1994-04-14', 'Jalan Raya', '+6282341000000', 'admin', '$2y$10$94QXCQJq4qO6a67zFnKIcutuEJieN6qa/g5jcQwtTVP7gPZb8NpsG'),
                (2, 2, 'Luki', 'Sanjaya', 'ukykazuki@gmail.com', 'Sragen', '1994-04-14', 'Jalan Kaliurang', '+6282349195324', 'lukisanjaya', '$2y$10$94QXCQJq4qO6a67zFnKIcutuEJieN6qa/g5jcQwtTVP7gPZb8NpsG');";

                $this->db->query($sql);
        }

        public function down()
        {
                $this->dbforge->drop_table('users');
        }
}
