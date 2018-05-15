<?php
class datapenghuni extends CI_Controller {
	public function index(){
		$data=array(
			'conten'=>'data_penghuni');
		$this->load->view("menu",$data);
	}
}


?>