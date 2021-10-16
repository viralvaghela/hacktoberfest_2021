<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('users_m');
        is_admin();
    }

    public function index()
    {
        $this->load->view('admin/users/list_user');
    }

    public function create()
    {
        $this->load->view('admin/users/create');
    }

    public function store()
    {
        $this->load->library('form_validation');
        $this->_rules();
        $this->form_validation->set_rules(
            'username', 
            'username', 
            'required|min_length[3]|is_unique[users.username]'
        );
        $this->form_validation->set_rules(
            'email', 
            'email', 
            'required|min_length[5]|is_unique[users.email]'
        );
        $this->form_validation->set_rules(
            'handphone', 
            'handphone', 
            'required|min_length[10]|is_unique[users.handphone]|callback__regex_hp'
        );
        $this->form_validation->set_rules(
            'password_conf', 
            'Konfirmasi Password', 
            'required|matches[password]|min_length[6]'
        );
        $this->form_validation->set_rules(
            'password', 
            'Password', 
            'required|min_length[6]'
        );

        if ($this->form_validation->run() == false) {
            $this->create();
        } else {
            $input = [
                "role"          => 2,
                "firstname"     => $this->input->post('firstname', TRUE),
                "lastname"      => $this->input->post('lastname', TRUE),
                "email"         => $this->input->post('email', TRUE),
                "tempat_lahir"  => $this->input->post('tempat_lahir', TRUE),
                "tanggal_lahir" => $this->input->post('tanggal_lahir', TRUE),
                "alamat"        => $this->input->post('alamat', TRUE),
                "handphone"     => format_hp($this->input->post('handphone', TRUE)),
                "username"      => $this->input->post('username', TRUE),
                "password"      => secured_hash($this->input->post('password', TRUE)),
            ];
            $this->users_m->insert($input);
            redirect(admin_url('user') . '?alert=Berhasil Menambah Data');
        }
    }

    public function edit($id)
    {
        $row = $this->users_m->getById($id);
        if ($row) {
            $data = array(
                'id'            => set_value('id', $row->id),
                "firstname"     => set_value('firstname', $row->firstname),
                "lastname"      => set_value('lastname', $row->lastname),
                "email"         => set_value('email', $row->email),
                "tempat_lahir"  => set_value('tempat_lahir', $row->tempat_lahir),
                "tanggal_lahir" => set_value('tanggal_lahir', $row->tanggal_lahir),
                "alamat"        => set_value('alamat', $row->alamat),
                "handphone"     => set_value('handphone', $row->handphone),
                "username"      => set_value('username', $row->username),
            );
            $this->load->view('admin/users/edit', $data);
        } else {
            redirect(admin_url('users'. '?alert=Data tidak ditemukan'));
        }
    }

    public function update() 
    {
        $this->load->library('form_validation');
        $this->_rules();
        $this->form_validation->set_rules(
            'handphone', 
            'handphone', 
            'required|min_length[10]|callback__regex_hpold'
        );
        $this->form_validation->set_rules('email', 'email', 'trim|required');

        if ($this->form_validation->run() == false) {
            $this->edit($this->input->post('id', true));
        } else {
            $input = array(
                "firstname"     => $this->input->post('firstname', TRUE),
                "lastname"      => $this->input->post('lastname', TRUE),
                "email"         => $this->input->post('email', TRUE),
                "tempat_lahir"  => $this->input->post('tempat_lahir', TRUE),
                "tanggal_lahir" => $this->input->post('tanggal_lahir', TRUE),
                "alamat"        => $this->input->post('alamat', TRUE),
                "handphone"     => format_hp($this->input->post('handphone', TRUE))
            );

            $this->users_m->update($this->input->post('id', true), $input);
            redirect(admin_url('user' . '?alert=Berhasil Update Data'));
        }
    }

    public function dataTable()
    {
        $this->load->library('datatables');
        $this->datatables->select('id, firstname, lastname, email, username');
        $this->datatables->where('role != 1');
        $this->datatables->from('users');
        $results  = $this->datatables->generate();
        $results  = json_decode($results);
        $dataUser = [];
        foreach ($results->data as $key => $value) {
            $dataUser[] = 
            [
                'fullname' => $value->firstname . ' ' . $value->lastname,
                'email'    => $value->email,
                'username' => $value->username,
                'opsi'   => 
                    anchor('secretadmin/user/edit/'. $value->id,
                        'Edit',array('class'=>'btn-edit btn btn-warning btn-xs')) . ' ' .
                    "<button class='btn-delete btn btn-danger btn-xs' data-id='$value->id'>Hapus</button> " .
                    "<button class='btn-detail btn btn-info btn-xs' data-id='$value->id'>Detail</button>"
            ];
        }
        $results->data = $dataUser;
        header('Content-Type: application/json');
        echo json_encode($results);
    }

    public function _rules() 
    {
        $this->form_validation->set_rules('firstname', 'firstname', 'trim|required');
        $this->form_validation->set_rules('lastname', 'lastname', 'trim|required');
        $this->form_validation->set_rules('tempat_lahir', 'tempat_lahir', 'trim|required');
        $this->form_validation->set_rules('tanggal_lahir', 'tanggal_lahir', 'trim|required');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function _regex_hp($hp) {
        if (1 !== preg_match('/^([+0-9]+){10,}$/', $hp ) ) {
            $this->form_validation->set_message('_regex_hp', 'Format No HP salah');
            return FALSE;
        } 
        else {
            $hp = format_hp($hp);
            $cek = $this->users_m->cekEmail($hp);
            if ($cek) {
                $this->form_validation->set_message(
                    '_regex_hp', 
                    'No HP harus unik.'
                );
                return FALSE;
            }else{
                return TRUE;
            }
        }
    }

    public function _regex_hpold($hp) {
        if (1 !== preg_match('/^([+0-9]+){10,}$/', $hp ) ) {
            $this->form_validation->set_message(
                '_regex_hpold', 
                'Format No HP salah'
            );
            return FALSE;
        } 
        else {
            return TRUE;
        }
    }
}
