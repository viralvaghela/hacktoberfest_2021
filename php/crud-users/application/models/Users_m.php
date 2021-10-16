<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Users_m extends CI_Model {

    public $table = 'users';

    public function getById($id)
    {
        $query = $this->db->select(
                        'id, 
                        role,
                        firstname,
                        lastname,
                        email,
                        tempat_lahir,
                        tanggal_lahir,
                        alamat,
                        handphone,
                        username'
                    )
                    ->where('id', $id)
                    ->get($this->table);
        return $query->row();
    }

    public function getPassword($id)
    {
        $query = $this->db->select(
                        'password'
                    )
                    ->where('id', $id)
                    ->get($this->table);
        $q = $query->row();
        return $q->password;
    }

    function cekEmail($field)
    {
        $this->db->select('handphone');
        $this->db->from($this->table);
        $this->db->where('handphone', $field);
        $q = $this->db->get();
        return $q->num_rows();
    }

    // insert data
    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update($this->table, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete($this->table);
    }

    // get total rows
    function total_rows() {

        $this->db->where('role != 1');
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

}
