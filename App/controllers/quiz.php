<?php

class quiz 
{
    public function generate_question()
    {
        $randow_question=rand(0,26);
        //1 question
        $question[0]="Qual a sigla do estado do Acre?";
        $result[0]="AC";
        //2 question
        $question[1]="Qual a sigla do estado de Alagoas?";
        $result[1]="AL";
        //3 question
        $question[2]="Qual a sigla do estado do Amapá?";
        $result[2]="AP";
        //4 question
        $question[3]="Qual a sigla do estado do Amazonas?";
        $result[3]="AM";
        //5 question
        $question[4]="Qual a sigla do estado da Bahia?";
        $result[4]="BA";
        //6 question
        $question[5]="Qual a sigla do estado do Ceará?";
        $result[5]="CE";
        //7 question
        $question[6]="Qual a sigla do estado do Espírito Santo?";
        $result[6]="ES";
        //8 question
        $question[7]="Qual a sigla do estado de Goiás?";
        $result[7]="GO";
        //9 question
        $question[8]="Qual a sigla do estado do Maranhão?";
        $result[8]="MA";
        //10 question
        $question[9]="Qual a sigla do estado de Mato Grosso?";
        $result[9]="MT";
        //11 question
        $question[10]="Qual a sigla do estado do Mato Grosso do Sul?";
        $result[10]="MS";
        //12 question
        $question[11]="Qual a sigla do estado de Minas Gerais?";
        $result[11]="MG";
        //13 question
        $question[12]="Qual a sigla do estado do Pará?";
        $result[12]="PA";
        //14 question
        $question[13]="Qual a sigla do estado do Paraíba?";
        $result[13]="PB";
        //15 question
        $question[14]="Qual a sigla do estado do Paraná?";
        $result[14]="PR";
        //16 question
        $question[15]="Qual a sigla do estado de Pernambuco?";
        $result[15]="PE";
        //17 question
        $question[16]="Qual a sigla do estado do Piauí?";
        $result[16]="PI";
        //18 question
        $question[17]="Qual a sigla do estado do Rio de Janeiro?";
        $result[17]="RJ";
        //19 question
        $question[18]="Qual a sigla do estado do Rio Grande do Norte";
        $result[18]="RN";
        //20 question
        $question[19]="Qual a sigla do estado do Rio Grande do Sul?";
        $result[19]="RS";
        //21 question
        $question[20]="Qual a sigla do estado de Rondônia?";
        $result[20]="RO";
        //22 question
        $question[21]="Qual a sigla do estado de Roraima?";
        $result[21]="RR";
        //23 question
        $question[22]="Qual a sigla do estado de Santa Catarina?";
        $result[22]="SC";
        //24 question
        $question[23]="Qual a sigla do estado de São Paulo?";
        $result[23]="SP";
        //25 question
        $question[24]="Qual a sigla do estado de Sergipe?";
        $result[24]="SE";
        //26 question
        $question[25]="Qual a sigla do estado do Tocantins?";
        $result[25]="TO";
        //27 question
        $question[26]="Qual a sigla do estado do Distrito Federal?";
        $result[26]="DF";

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