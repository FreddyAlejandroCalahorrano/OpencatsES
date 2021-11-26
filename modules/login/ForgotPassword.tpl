<?php /* $Id: ForgotPassword.tpl 1947 2007-02-23 09:45:29Z will $ */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>OpenCATS - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=<?php echo(HTML_ENCODING); ?>">
        <style type="text/css" media="all">@import "modules/login/login.css";</style>
        <script type="text/javascript" src="js/lib.js"></script>
        <script type="text/javascript" src="modules/login/validator.js"></script>
    </head>

    <body>

    <div id="headerBlock">
        <span id="mainLogo">OpenCATS</span>
    </div>

    <div id="contents">
        <div id="login">
            <?php if (!empty($this->message)): ?>
                <div>
                    <?php if ($this->messageSuccess): ?>
                        <p class="success"><?php $this->_($this->message); ?><br /></p>
                    <?php else: ?>
                        <p class="failure"><?php $this->_($this->message); ?><br /></p>
                    <?php endif; ?>
                </div>
            <?php endif; ?>

            <div id="formBlock">
                <img src="images/login.gif" alt="Login" />
                <?php if (!$this->complete): ?>
                    <form name="loginForm" id="loginForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=login&amp;a=forgotPassword" method="post" autocomplete="off">
                        <input type="hidden" name="postback" value="true" />
                        <div id="subFormBlock">
                            <label id="usernameLabel" for="username">Nombre de Usuario</label><br />
                            <input name="username" id="username" class="login-input-box" />
                            <br />

                            <input type="submit" id="submit" name="submit" class="login-submit-button" value="Enviar mi Contraseña por Correo Electrónico" />
                        </div>
                    </form>
                <?php else: ?>
                    <p>
                        Se ha Enviado un Correo Electrónico a <?php $this->_($this->username); ?> que contiene su contraseña.<br /><br />
                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=login">Volver a la Página de Inicio de Sesión</a>
                    </p>
                <?php endif; ?>
            </div>

            <div id="loginText">
                <div class="ctr"><img src="images/security.gif" width="64" height="64" alt="security" /></div>
                <p>¡Bienvenido a OpenCATS!</p>
            </div>

            <div style="clear: both;"></div>
        </div>

        <script type="text/javascript">
            document.loginForm.username.focus();
        </script>

        <br />
        <div id="footerBlock">
            <span class="footerCopyright"><?php echo(COPYRIGHT_HTML); ?></span>
        </div>
    </div>
    </body>
</html>
