
    <!-- ===== Iconscout CSS ===== -->


    <!-- ===== CSS ===== -->

         
   


    
    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">Bem vindo(a)</span>

                <form action="#">
                    <div class="input-field">
                        <input type="text" placeholder=" email" required id="email_login">
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input type="password" class="password" placeholder="Senha" id="senha_login" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>

                    <div class="checkbox-text">
                        <div class="checkbox-content">
                            <input type="checkbox" id="logCheck">
                            <label for="logCheck" class="text">Se lembre de mim</label>
                        </div>
                        
                        <a href="#" class="text">Esqueceu sua senha?</a>
                    </div>

                    <div class="input-field button">
                        <input type="button" id="logar" value="Entrar">
                    </div>
                </form>

                <div class="login-signup">
                    <span class="text">ainda não é um membro?
                        <a href="#" class="text signup-link">Cadastre-se</a>
                    </span>
                </div>
            </div>

            <!-- Registration Form -->
            <div class="form signup">
                <p id="alert" ></p>
                <span class="title">Cadastro</span>

                <form action="#">
                    <div class="input-field">
                        <input type="text" placeholder="Seu nome" id="nome_cadastro" required>
                        <i class="uil uil-user"></i>
                    </div>
                    <div class="input-field">
                        <input type="email" placeholder="Seu email" required id="email_cadastro">
                        <i class="uil uil-envelope icon"></i>
                    </div>
                   
                    <div class="input-field">
                    <input placeholder="Date" class="textbox-n" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date_cadastro" />
                        <i class="bi bi-calendar2-week"></i>
                    </div>
                    <div class="input-field">
                        <input type="password" class="password" placeholder="Senha" id="senha1_cadastro" required>
                        <i class="uil uil-lock icon"></i>
                    </div>
                    <div class="input-field">
                        <input type="password" class="password" placeholder="Confirmar senha" id="senha2_cadastro" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>

                    <div class="checkbox-text">
                        <div class="checkbox-content">
                            <input type="checkbox" id="sigCheck">
                            <label for="sigCheck" class="text">Se lembre de mim</label>
                        </div>
                        
                        <a href="#" class="text">Esqueceu a senha?</a>
                    </div>

                    <div class="input-field button">
                        <input type="button" id="cadastrar" value="Cadastrar">
                    </div>
                </form>

                <div class="login-signup">
                    <span class="text">Já possui uma conta?
                        <a href="#" class="text login-link">Login</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php URL_BASE;?>/js/vwlogin.js"></script>

