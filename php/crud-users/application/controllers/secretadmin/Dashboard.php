<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        is_admin();
    }

    public function index()
    {
        $this->load->model('users_m');
        $data['count_user'] = $this->users_m->total_rows();
        $this->load->view('admin/dashboard', $data);
    }


    public function change_password()
    {
        $this->load->view('admin/users/change_password');
    }

    public function change_password_action() 
    {
        $this->load->library('form_validation');
        $this->form_validation->set_rules(
            'password_conf', 
            'Konfirmasi Password', 
            'required|matches[password]|min_length[6]'
        );
        $this->form_validation->set_rules(
            'password', 
            'Password Baru', 
            'required|min_length[6]'
        );
        $this->form_validation->set_rules(
            'password_lama', 
            'Password Lama', 
            'required|min_length[6]'
        );
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');

        if ($this->form_validation->run() == false) {
            $this->change_password();
        } else {
            $password = $this->users_m->getPassword(3);
            if(password_verify($this->input->post('password_lama'), $password)){
                $input = array(
                    "password"    => secured_hash($this->input->post('password', TRUE)),
                );
    
                $this->users_m->update(3, $input);
                redirect(admin_url('user' . '?alert=Berhasil Update Data'));
            } else {
                redirect(admin_url('user/change_password' . '?alert=Password Lama Salah'));
            }

        }
    }
}
