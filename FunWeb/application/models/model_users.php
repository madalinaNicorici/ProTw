<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_users extends MY_Model{
	protected $_table='users_profile';
	protected $primary_key='user_id';
	protected $return_type='array';
	
	protected $after_get=array('remove_sensitive_data');
	protected $before_create=array('prep_data');
	
	protected function remove_sensitive_data($user){
		unset($user['ip_address']);
		return $user;
	}
	
	protected function prep_data($user){
		if(isset($user['user_password']))$user['user_password']= md5($user['user_password']);
		return $user;
	}
}