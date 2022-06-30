
 <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Registrar Familiar</h2>
                </div>
                <div class="card-body">
                    <div id="alert" style="text-align: center;"></div>
                        <div class="form-row m-b-55">
                            <div class="name">Nome Completo</div>
                            <div class="value">
                               
                                   
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" id="name">
                                        </div>
                                    
                                  
                                
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="email" id="email">
                                </div>
                            </div>
                        </div>
                        <div class="form-row" >
                            <div class="name">Data de nascimento</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="date" id="dt_nasc">
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            
                            <div class="value">
                                
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Parentesco</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select id="parent">
                                            <option value="1">Primo</option>
                                            <option value="2">Pai</option>
                                            <option value="3">Mãe</option>
                                            <option value="4">Filho</option>
                                            <option value="5">Tio</option>
                                            <option value="6">Esposa</option>
                                            <option value="7">Marido</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Senha</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="password" id="senha1">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Confirmação de Senha</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="password" id="senha2">
                                </div>
                            </div>
                        </div>


                        
                           <div style="margin: 0px 0px 0px 70%;"><button id="btn" onclick="up()" class="btn btn--radius-2 btn--green" >Cadastrar</button> </div>
                        </div>
                    
                </div>
            </div>
        </div>
    </div>
    
    <script src="<?php echo URL_BASE ?>/js/form_family/register.js"></script>
    <script>
        function up() {
    window.scrollTo(0, 0);
};
    </script>
 
  