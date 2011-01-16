<?php
class Board extends AppModel {

	var $name = 'Board';
	var $validate = array(
		'subject' => array('notempty')
	);

}
?>