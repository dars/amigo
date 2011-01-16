<?php
/*
 * Dars 2007/08/17
 * add bug report
*/
class dbClass{
	var $dbHost;
	var $dbUser;
	var $dbName;
	var $dbPass;
	var $dbConn;
	var $connectError;
	function dbClass($dbHost,$dbUser,$dbPass,$dbName,$dbPort="3306"){
		$this->dbHost=$dbHost;
		$this->dbUser=$dbUser;
		$this->dbPass=$dbPass;
		$this->dbName=$dbName;
		$this->dbPort=$dbPort;
		$this->toConnect();    
  	}
  	function toConnect(){
    	if(!$this->dbConn=@mysqli_connect($this->dbHost,$this->dbUser,$this->dbPass,$this->dbName,$this->dbPort)){
	  		trigger_error('Could not connect dbHost!! ['.mysqli_connect_error().']');
	  		$this->conneceError=true;
		}else{
			mysqli_query($this->dbConn,"SET NAMES 'utf8'");
		}
  	}
	function isError(){
  		if($this->connectError){
	    	return mysqli_error($this->dbConn);
		}
	}
	function & query($query){
		if(!$queryResult=mysqli_query($this->dbConn,$query)){
    		echo $query."<br>\n";
    		trigger_error('Could not query database!! ['.$this->dbConn->error.']');
    		$this->connectError=true;
    	}
		$dataResult=new mysqlResult($this,$queryResult);
		return $dataResult;
	}
	function chgStr($str){
		return "'".str_replace("'","''",$str)."'";
	}
	//Insert RecordSet
	public function dbInsert($table,$arFieldValues){
		$fields=array_keys($arFieldValues);
		$values=array_values($arFieldValues);
		$secVals=array();
		foreach($values as $val){
			$secVals[]=$this->chgStr($val);
		}
		$sql_str="INSERT INTO ".$table."(";
		$sql_str.=join(",",$fields);
		$sql_str.=")VALUES(";
		$sql_str.=join(",",$secVals);
		$sql_str.=")";
		return $this->query($sql_str);
	}
	//Update RecordSet
	public function dbUpdate($table,$arFieldValues,$sWhere=NULL){
		$fields=array_keys($arFieldValues);
		$values=array_values($arFieldValues);
		$arSet=array();
		foreach($arFieldValues as $field=>$val){
			if($val==='NULL'){
				array_push($arSet,$field."=NULL");
			}else{
				array_push($arSet,$field."=".$this->chgStr($val));
			}
		}
		$sql_str="UPDATE ".$table." SET ".join(",",$arSet);
		if(strlen(trim($sWhere))>0){
			$sql_str.=" WHERE ".$sWhere;
		}
		return $this->query($sql_str);
	}
}

class mysqlResult{
	var $mysql;
	var $query;
	function mysqlResult(& $mysql,$query){
		$this->mysql=& $mysql;
		$this->query=$query;
	}	
	function fetch(){
		if($row=mysqli_fetch_array($this->query,MYSQL_ASSOC)){
			return $row;
		}else if($this->size()>0){
  			mysqli_data_seek($this->query,0);
  			return false; 
		}else{
  			return false;
		}
	}
	function data_seek($num=0){
		mysqli_data_seek($this->query,$num);
	}
	//
	function affected(){
		return mysqli_affected_rows($this->mysql->dbConn);
	}
	//
	function size(){
  		return mysqli_num_rows($this->query);
	}
	//
	function isError(){
  		return $this->mysql->isError();
	}
}
?>