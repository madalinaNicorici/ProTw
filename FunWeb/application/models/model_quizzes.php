<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_quizzes extends MY_Model{
	protected $_table='quizzes';
	protected $primary_key='quiz_id';
	protected $return_type='array';
	
	//protected $after_get=array('remove_sensitive_data');
	//protected $before_create=array('prep_data');
	//protected $before_update=array('update_timestamp');
	
	public function get_quiz_id($user)
	{	
		if (!($res = $this->_database->query("SELECT return_quiz_id($user) as quiz_id"))) 
		{
			//echo "Fetch failed: (" . $this->_database->errno . ") " . $this->_database->error;
			return null;
		}
		$row = $res->result();
		return $row;		
	}
	
	public function add_result($user, $quiz, $result)
	{
		$this->_database->query("CALL add_answer($user, $quiz, $result)");
	}
	
	protected function remove_sensitive_data($user){
		unset($user['user_password']);
		unset($user['ip_address']);
		return $user;
	}
	
	protected function prep_data($user){
		$user['user_password']= md5($user['user_password']);
		//$user['ip_address']=$this->input->ip_address();
		//$user['created_timestamp']=date('Y-m-d H:i:s');
		return $user;
	}
	
	protected function update_timestamp($user){
		//$user['updated_timestamp']=date('Y-m-d H:i:s');
		return $user;
	}
}