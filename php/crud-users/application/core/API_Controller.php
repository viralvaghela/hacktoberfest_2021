<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

include_once APPPATH . "libraries/REST_Controller.php";

class API_Controller extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
    }

    protected function _check_request($request, $mandatory, $name, $validate, $param = NULL, $return = NULL)
    {
		$this->load->library('form_validation');
        $hasil = $request;

        // Request ada
        if ($request !== FALSE) {
            $bool = TRUE;
            if ($validate != 'skip') {
                if (is_null($param))
                    $bool = $this->form_validation->$validate($request);
                else
                    $bool = $this->form_validation->$validate($request, $param);
            }

            if ($bool === FALSE) {
                $this->response(array(
                    'status'=> 0,
                    'error' => "Your parameter '" . $name . "' is not valid."
                ));
            }

            if(empty($request) && $mandatory) {
                $this->response(array(
                    'status'    => 0,
                    'error'     => "Your parameter is not complete. Missing parameter '" . $name . "'."
                ), 403);
            }

        }
        // Request kosong, mandatory
        else if (empty($request) && $mandatory && ($validate !== "boolean")) {
            // tampilkan error
            $this->response(array(
                    'status'    => 0,
                    'error'     => "Your parameter is not complete. Missing parameter '" . $name . "'."
                ), 403);
        } else if (is_null($request) && $mandatory && ($validate == "boolean")) {
            $this->response(array(
                'status'    => 0,
                'error'     => "Your parameter is not complete. Missing parameter '" . $name . "'."
            ), 403);
        }

        return $hasil;
    }

    protected function _check_all_request($param, $method)
    {
        $data = array();

        // save params in variable
        foreach ($param as $k => $p)
        {
            $var =  (isset($p[1])) ? $p[1] : NULL;
            if ($$k = self::_check_request($this->$method($k), 0, $k, $p[0], $var)) $data[$k] = $$k;
        }
        return $data;
    }

    protected function _validate_request($request, $validate, $param = NULL)
    {
        $bool = false;
        if (is_null($param))
        {
            if (is_null($param))
                $bool = $this->form_validation->$validate($request);
            else
                $bool = $this->form_validation->$validate($request, $param);
        }

        return $bool;
    }

    protected function _check_user($id_user)
    {
        return $this->db->where('id_user', $id_user)->get('users')->row();
    }

    protected function _check_product($id_product)
    {
        return $this->db->where('id_product', $id_product)->get('products')->row();
    }

    protected function _getRequest()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        if ($data == null || $_SERVER['CONTENT_TYPE'] != "application/json") {
            $this->response(
                array(
                    'status_code'       => 0,
                    'status_message'    => 'Permintaan harus berupa JSON',
                    'data'              => null
                ),
            406);
            return;
        }
        return $data;
    }

    protected function _getRequestPost()
    {
        if( empty($_POST) )
        {
            $this->response(
                array(
                    'status_code'       => 0,
                    'status_message'    => 'Permintaan harus berupa form data',
                    'data'              => null
                ),
            406);
        }

        return $_POST;
    }
    
    /**
     * @param $request : all request json data
     * @param $field : field name request
     * @param $name : field label error, $name = NUll, same with field name.
     * @param $mandatory : required/skip
     * @param $isNull : $isNull = true, field cannot have blank value
     * @param $typeData : string/integer
     * @return field value request
     */
     protected function _checkRequest($request, $field, $name, $mandatory, $isNull = true, $typeData = 'string')
     {
         if ($request !== null) {
             if ($name == null) {
                 $name = $field;
             }
             if ($mandatory === 'required') {
                 if (!array_key_exists($field, $request)) {
                     $this->response(array(
                         'status_code'       => 0,
                         'status_message'    => "Parameter '" . $name . "' Tidak Tersedia",
                         'data'              => null
                     ), 400);
                     return;
                 } else {
                     if ($isNull) {
                         if (isset($request[$field])) {
                             if (is_array($request[$field])) {
                                 $countParamError = 0;
                                 foreach ($request[$field] as $key => $val) {
                                     if(is_array($val)) {
                                         if(empty($val)) {
                                             $countParamError++;
                                         }
                                     } else {
                                         if (trim($val) == "") {
                                            $countParamError++;
                                        }
                                     }
                                 }

                                 if ($countParamError > 0) {
                                     $this->response(array(
                                         'status_code'       => 0,
                                         'status_message'    => "Parameter '" . $name . "' Tidak Benar",
                                         'data'              => null
                                     ), 400);
                                     return;
                                 }
                             } else {
                                 if(is_array($request[$field])) {
                                     if (empty($request[$field])) {
                                         $this->response(array(
                                             'status_code'       => 0,
                                             'status_message'    => "Parameter '" . $name . "' Tidak Benar",
                                             'data'              => null
                                         ), 400);
                                         return;
                                     }
                                 } else {
                                     if (trim($request[$field]) == "") {
                                         $this->response(array(
                                             'status_code'       => 0,
                                             'status_message'    => "Parameter '" . $name . "' Tidak Benar",
                                             'data'              => null
                                         ), 400);
                                         return;
                                     }
                                 }
                             }
                         } else {
                             $this->response(array(
                                 'status_code'       => 0,
                                 'status_message'    => "Parameter '" . $name . "' Tidak Benar",
                                 'data'              => null
                             ), 400);
                             return;
                         }
                     }
                 }

             } elseif ($mandatory === 'skip') {
                 if (!array_key_exists($field, $request)) {
                     if ($typeData === 'string') {
                         $request[$field] = "";
                     } elseif ($typeData === 'integer') {
                         $request[$field] = 0;
                     } elseif ($typeData === null) {
                         $request[$field] = null;
                     }
                 }
             }
         } else {
             $this->response(array(
                 'status_code'       => 0,
                 'status_message'    => "Permintaan Tidak Benar",
                 'data'              => null
             ), 400);
         }
         return $request[$field];
     }

    protected function _checkAvailableEmail($email)
    {
        $checkEmailUser = (new \Shoop\Common\UserMobileLibrary($this->db))
                                          ->checkAvailableEmail($email);
        return $checkEmailUser;
    }
}
