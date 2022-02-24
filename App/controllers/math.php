<?php

class math
{
   protected $question=[];
   protected $value=array();

   public function generate_question()
   {
       $this->question[0]=rand(1,50);
       $this->question[1]=rand(1,30);
       $_SESSION['result_math']=$this->question[0]+$this->question[1];
       $this->question[2]= "qual é a soma entre ".$this->question[0]." e ". $this->question[1]."?";
       echo $this->question[2];

   }
   public function answered()
   {
       if($_POST['answer']==$_SESSION['result_math'])
       {
           echo 'acertou!';
       }
       else{echo "errou!";}
   }
}