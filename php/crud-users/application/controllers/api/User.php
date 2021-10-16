<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

require_once APPPATH.'core/API_Controller.php';

class user extends API_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('users_m');
        is_admin();
    }

    public function show_post()
    {
        $request = $this->_getRequestPost();

        $id = $this->_checkRequest($request, 'id', null, 'required', 1);

        $data = $this->users_m->getById($id);

        if(!$data) {
            $this->response([
                'status_code'    => 0,
                'status_message' => 'Data user tidak ditemukan',
                'data'           => null,
            ], 200);
        }
        $this->response([
            'status_code'    => 1,
            'status_message' => 'Berhasil mengambil data user',
            'data'           => $data,
        ], 200);
    }

    public function delete_post()
    {
        $request = $this->_getRequestPost();

        $id = $this->_checkRequest($request, 'id', null, 'required', 1);        

        $data = $this->users_m->delete($id);

        $this->response([
            'status_code'    => 1,
            'status_message' => 'Berhasil menghapus data',
            'data'           => null,
        ], 200);
    }
}
