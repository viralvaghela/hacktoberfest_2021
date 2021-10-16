<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller
{

    public function index()
    {
        if($this->session->userdata('role')){
            if($this->session->userdata('role') == 1){
                redirect(base_url('secretadmin/dashboard'));
            }else{
                redirect(base_url('member/dashboard'));
            }
        }
        $this->load->view('login');
    }
    
    public function cek_login(){
        $this->load->library('form_validation');
        $this->form_validation->set_rules(
            'username', 
            'Usernamex', 
            'required'
        );
        $this->form_validation->set_rules(
            'password', 
            'Password', 
            'required|min_length[6]'
        );

        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');

        if ($this->form_validation->run() == false) {
            $this->index();
        } else {
            $this->db->where('username', $this->input->post('username'));
            $users = $this->db->get('users');
            if($users->num_rows()>0){
                $user = $users->row_array();
                if(password_verify($this->input->post('password'), $user['password'])){
                    $this->session->set_userdata($user);
                    if($user['role'] == 1){
                        redirect('secretadmin/dashboard');
                    }else{
                        redirect('member/dashboard');
                    }
                }else{
                    redirect('auth' . "?alert=Password salah");
                }
            }else{
                redirect('auth' . "?alert=Username salah");
            }
        }
    }

    public function register(){
        $this->load->view('register');
    }

    public function register_action()
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
            $this->register();
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
            $this->load->model('users_m');
            $this->users_m->insert($input);
            redirect(base_url('auth') . '?alert=Berhasil Register');
        }
    }

    public function logout(){
        $this->session->sess_destroy();
        redirect('auth' . '?alert=Anda sudah berhasil keluar dari aplikasi');
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
            $this->load->model('users_m');
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
