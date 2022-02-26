<?php

class quiz 
{
    public function generate_question()
    {
        $randow_question=rand(0,2 );
        //1 question
        $question[0]="Qual A Sigla da capital de São Paulo?";
        $result[0]="SP";
        //2 question
        $question[1]="Qual A Sigla da capital do Rio de Jainero?";
        $result[1]="RJ";
        //3 question
        $question[2]="Qual A Sigla da capital de Santa Catarina?";
        $result[2]="SC";

        echo$question[$randow_question];
        $_SESSION['result_geo_quiz']=$result[$randow_question];
        
      

    }

    public function answered()
    {
        if($_POST['resposta_quiz']==$_SESSION['result_geo_quiz']):
            echo "Parabens ganhou, você digitou: ".$_POST['resposta_quiz'];

        else:
            echo "You Lost";
        endif;
        
    }
        
}

?>