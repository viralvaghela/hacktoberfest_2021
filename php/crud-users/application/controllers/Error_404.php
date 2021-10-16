<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Error_404 extends CI_Controller
{
    public function index()
    {
        $data = [
            'heading' => 'Ooppss',
            'message' => '<h1>Maaf Halaman tidak ditemukan</h1>'
        ];
        $this->load->view('errors/html/error_404', $data);
    }
}
