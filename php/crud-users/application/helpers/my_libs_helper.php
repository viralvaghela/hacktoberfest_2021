<?php

function format_hp($number)
{
    $hp = null;
    if(!preg_match('/[^+0-9]/',trim($number))){
        // cek apakah no hp karakter 1-3 adalah +62
        if(substr(trim($number), 0, 3)=='+62'){
            $hp = trim($number);
        }
        // cek apakah no hp karakter 1 adalah 0
        elseif(substr(trim($number), 0, 1)=='0'){
            $hp = '+62'.substr(trim($number), 1);
        }
    }else{
        $hp = FALSE;
    }

    return $hp;
}

function format_uang($number,$decimal=0){
    return number_format($number,$decimal,",",".");
}

if ( ! function_exists('admin_url'))
{
    function admin_url($url){
        $ci = get_instance();
        return $ci->config->item('admin_url') . $url;
    }
}

function secured_hash($input)
{    
    $output = password_hash($input,PASSWORD_DEFAULT);
    return $output;
}

function is_login(){
    $ci = get_instance();
    if(!$ci->session->userdata('role')){
        redirect('auth');
    }
}

function is_admin(){
    $ci = get_instance();
    if(!$ci->session->userdata('role')){
        redirect('auth');
    }else{
        if($ci->session->userdata('role') != 1){
            redirect('error_404');
        }
    }
}

function datetime_indo($tanggal, $null = null)
{
    $bulan = array (1 =>   'Januari',
                'Februari',
                'Maret',
                'April',
                'Mei',
                'Juni',
                'Juli',
                'Agustus',
                'September',
                'Oktober',
                'November',
                'Desember'
            );
    $split = explode('-', $tanggal);
    $tgl = explode(' ', $split[2]);
    if ($null == null) {
        return $tgl[0] . ' ' . $bulan[ (int)$split[1] ] . ' ' . $split[0];
    }else{
        return $tgl[0] . ' ' . $bulan[ (int)$split[1] ] . ' ' . $split[0] . ' ' . $tgl[1];
    }
}

function date_indo($tanggal)
{
    $bulan = array (1 =>   'Januari',
                'Februari',
                'Maret',
                'April',
                'Mei',
                'Juni',
                'Juli',
                'Agustus',
                'September',
                'Oktober',
                'November',
                'Desember'
            );
    $split = explode('-', $tanggal);
    return $split[2] . ' ' . $bulan[ (int)$split[1] ] . ' ' . $split[0];
}
