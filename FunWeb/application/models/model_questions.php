<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_questions extends MY_Model{
	protected $_table='questions';
	protected $primary_key='question_id';
	protected $return_type='array';
}