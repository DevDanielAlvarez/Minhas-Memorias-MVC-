
delimiter $
create function idade_do_paciente(data_nasc int(2)) returns int(2)
begin
  declare ano int(2);
  declare codigo_do_paciente int(4);
  
  SELECT TIMESTAMPDIFF(year, dt_nascimento , CURRENT_DATE()) into ano from tb_paciente where tb_paciente.cd_paciente = codigo_do_paciente;
    
  return ano;
 
end $

