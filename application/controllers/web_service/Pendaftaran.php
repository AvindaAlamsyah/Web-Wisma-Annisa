<?php defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Pendaftaran extends REST_Controller
{
	
	function __construct($config = 'rest')
	{
		parent::__construct($config);
	}

	function index_post(){
		$data = array(
				'username' => $this->post('username'),
				'password' => $this->post('password'),
				'email'	   => $this->post('email'));
		$insert = $this->db->insert('user',$data);
		if ($insert) {
			$this->response($data,200);
		}else{
			$this->response(array('status' => 'fail', 502));
		}
	}
}
?>