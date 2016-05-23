<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'/libraries/REST_Controller.php';

class Users extends REST_Controller {
	function __construct() {
		parent::__construct();
		$this->load->helper('my_api');
	}

	function user_get(){
		$user_id = $this->uri->segment(3);
		$this->load->model('Model_users');
		$user=$this->Model_users->get_by(array('user_id'=>$user_id,'status'=>'active'));
		if (isset($user['user_id'])){
			$this->response(array('status'=>'success','message'=>$user));
		}
		else{
			$this->response(array('status'=>'failure','message'=>'The specified user could not be found'),REST_Controller::HTTP_NOT_FOUND);
		}
	}
	
	function user_put(){
		$this->load->library('form_validation');
		$data = remove_unknown_fields($this->put(),$this->form_validation->get_field_names('user_put'));
		$this->form_validation->set_data($data);
		
		if($this->form_validation->run('user_put')!=false){
			$this->load->model('Model_users');
			$exists=$this->Model_users->get_by(array('email'=>$this->put('email')));
			if($exists){
				$this->response(array('status'=>'failure','message'=>'The specified email adress already exists.'),REST_Controller::HTTP_CONFLICT);
			}
			$user_id=$this->Model_users->insert($data);
			if(!$user_id){
				$this->response(array('status'=>'failure','message'=>'An unexpected error occured while trying to create the user'),REST_Controller::HTTP_INTERNAL_SERVER_ERROR);
			}
			else{
				$this->response(array('status'=>'success','message'=>'created'));
			}
		}
		else{
			$this->response(array('status'=>'failure','message'=>$this->form_validation->get_errors_as_array()),REST_Controller::HTTP_BAD_REQUEST);
		}
	}
	
	function user_post(){
		$user_id = $this->uri->segment(3);
		$this->load->model('Model_users');
		$user=$this->Model_users->get_by(array('user_id'=>$user_id,'status'=>'active'));
		if (isset($user['user_id'])){
				$this->load->library('form_validation');
			$data = remove_unknown_fields($this->post(),$this->form_validation->get_field_names('user_post'));
			$this->form_validation->set_data($data);
			
			if($this->form_validation->run('user_post')!=false){
				$this->load->model('Model_users');
				$safe_email = !isset($data['email']) || $data['email'] == $user['email'] || !$this->Model_users->get_by(array('email'=>$data['email']));
				if(!$safe_email){
					$this->response(array('status'=>'failure','message'=>'The specified email adress is already in use.'),REST_Controller::HTTP_CONFLICT);
				}
				$update=$this->Model_users->update($user_id, $data);
				if(!$user_id){
					$this->response(array('status'=>'failure','message'=>'An unexpected error occured while trying to update the user'),REST_Controller::HTTP_INTERNAL_SERVER_ERROR);
				}
				else{
					$this->response(array('status'=>'success','message'=>'updated'));
				}
			}
			else{
				$this->response(array('status'=>'failure','message'=>$this->form_validation->get_errors_as_array()),REST_Controller::HTTP_BAD_REQUEST);
			}
		}
		else{
			$this->response(array('status'=>'failure','message'=>'The specified user could not be found'),REST_Controller::HTTP_NOT_FOUND);
		}
	}
	
	function user_delete(){
		$user_id = $this->uri->segment(3);
		$this->load->model('Model_users');
		$user=$this->Model_users->get_by(array('user_id'=>$user_id,'status'=>'active'));
		if (isset($user['user_id'])){
			$data['status']='deleted';
			$deleted=$this->Model_users->update($user_id, $data);
			if(!$deleted){
				$this->response(array('status'=>'failure','message'=>'An unexpected error occured while trying to delete the user'),REST_Controller::HTTP_INTERNAL_SERVER_ERROR);
			}
			else{
				$this->response(array('status'=>'success','message'=>'deleted'));
			}
		}
		else{
			$this->response(array('status'=>'failure','message'=>'The specified user could not be found'),REST_Controller::HTTP_NOT_FOUND);
		}
	}
}