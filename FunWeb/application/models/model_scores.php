<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_scores extends MY_Model{
	protected $_table='users_status';
	protected $return_type='array';
	
	public function add_result($user_id, $quiz_id, $result)
	{	
		 $this->_database->query("CALL add_answer($user_id,$quiz_id,$result)");
			
	}
}