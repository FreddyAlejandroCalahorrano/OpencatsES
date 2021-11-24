<?php /* $Id: AddUser.tpl 3810 2007-12-05 19:13:25Z brian $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js', 'js/sorttable.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
<div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%" valign="bottom">
                        <img src="images/settings.gif" width="24" height="24" border="0" alt="Settings" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td valign="bottom"><h2>Ajustes: Agregar Usuario del Sitio</h2></td>
                </tr>
            </table>

            <p class="note">
                <span style="float: left;">Agregar Usuario del Sitio</span>
                <span style="float: right;"><a href='<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=manageUsers'>Volver a Gestión de Usuarios</a></span>&nbsp;
            </p>

            <form name="addUserForm" id="addUserForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=addUser" method="post" onsubmit="return checkAddUserForm(document.addUserForm);" autocomplete="off">
                <input type="hidden" name="postback" id="postback" value="postback" />

                <table width="930">
                    <tr>
                        <td align="left" valign="top">
                            <table class="editTable" width="550">
                                <tr>
                                    <td class="tdVertical" >
                                        <label id="firstNameLabel" for="firstName">Nombre:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" class="inputbox" id="firstName" name="firstName" style="width: 150px;" />&nbsp;*
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="lastNameLabel" for="lastName">Apellido:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" class="inputbox" id="lastName" name="lastName" style="width: 150px;" />&nbsp;*
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="emailLabel" for="username">Correo Electrónico:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" class="inputbox" id="email" name="email" style="width: 150px;" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="usernameLabel" for="username">Nombre de Usuario:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" class="inputbox" id="username" name="username" style="width: 150px;" />&nbsp;*
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="passwordLabel" for="password">Contraseña:</label>
                                    </td>
                                    <td class="tdData">
					<?php if ($this->auth_mode == "ldap"): ?>
                       La autenticación LDAP está habilitada, por lo que no se requiere contraseña.
                            		<input type="hidden" class="inputbox" id="password" name="password" value="password" />
                            		<?php else: ?>
                                        <input type="password" class="inputbox" id="password" name="password" style="width: 150px;" />&nbsp;*
					<?php endif; ?>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="retypePasswordLabel" for="retypePassword">
                                            Vuelva a Ecribir la Contraseña:</label>
                                    </td>
                                    <td class="tdData">
					<?php if ($this->auth_mode == "ldap"): ?>
                            		<input type="hidden" class="inputbox" id="retypePassword" name="retypePassword" value="password"/>
                             		<?php else: ?>
                                        <input type="password" class="inputbox" id="retypePassword" name="retypePassword" style="width: 150px;" />&nbsp;*
					<?php endif; ?>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="accessLevelLabel" for="accessLevel">Nivel de Acceso:</label>
                                    </td>
                                    <td class="tdData">
                                        <span id="accessLevelsSpan">
                                            <?php foreach ($this->accessLevels as $accessLevel): ?>
                                                <?php if ($accessLevel['accessID'] > $this->getUserAccessLevel('settings.addUser')): continue; endif; ?>
                                                <?php if (!$this->license['canAdd'] && !$this->license['unlimited'] && $accessLevel['accessID'] > ACCESS_LEVEL_READ): continue; endif; ?>

                                                <?php $radioButtonID = 'access' . $accessLevel['accessID']; ?>

                                                <input type="radio" name="accessLevel" id="<?php echo($radioButtonID); ?>" value="<?php $this->_($accessLevel['accessID']); ?>" title="<?php $this->_($accessLevel['longDescription']); ?>" <?php if ($accessLevel['accessID'] == $this->defaultAccessLevel): ?>checked<?php endif; ?> onclick="document.getElementById('userAccessStatus').innerHTML='<?php $this->_($accessLevel['longDescription']); ?>'; <?php if($accessLevel['accessID'] >= ACCESS_LEVEL_SA): ?>document.getElementById('eeoIsVisible').checked=true; document.getElementById('eeoIsVisible').disabled=true;  document.getElementById('eeoVisibleSpan').style.display='none';<?php else: ?>document.getElementById('eeoIsVisible').disabled=false;<?php endif; ?>" />
                                                <label for="<?php echo($radioButtonID); ?>" title="<?php $this->_(str_replace('\'', '\\\'', $accessLevel['longDescription'])); ?>">
                                                    <?php $this->_($accessLevel['shortDescription']); ?>
                                                    <?php if ($accessLevel['accessID'] == $this->defaultAccessLevel): ?>(Por Defecto)<?php endif; ?>
                                                </label>
                                                <br />
                                            <?php endforeach; ?>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical" >Descripción de Acceso:</td>
                                    <td class="tdData">
                                        <span id="userAccessStatus">Eliminar: todos los accesos inferiores, más la capacidad de eliminar información en el sistema.</span>
                                    </td>
                                </tr>

                                <?php if (count($this->categories) > 0): ?>
                                    <tr>
                                        <td class="tdVertical">
                                            <label id="accessLevelLabel" for="accessLevel">Rol:</label>
                                        </td>
                                        <td class="tdData">
                                           <input type="radio" name="role" value="none" title="" checked onclick="document.getElementById('userRoleDesc').innerHTML='This user is a normal user.';  document.getElementById('accessLevelsSpan').style.display='';" />Usuario Normal
                                           <br />
                                           <?php foreach ($this->categories as $category): ?>
                                               <?php if (isset($category[4])): ?>
                                                   <input type="radio" name="role" value="<?php $this->_($category[1]); ?>" onclick="document.getElementById('userRoleDesc').innerHTML='<?php echo(str_replace('\'', '\\\'', $category[2])); ?>'; document.getElementById('access<?php echo($category[4]); ?>').checked=true; document.getElementById('accessLevelsSpan').style.display='none';" /> <?php $this->_($category[0]); ?>
                                               <?php else: ?>
                                                   <input type="radio" name="role" value="<?php $this->_($category[1]); ?>" onclick="document.getElementById('userRoleDesc').innerHTML='<?php echo(str_replace('\'', '\\\'', $category[2])); ?>'; document.getElementById('accessLevelsSpan').style.display='';" /> <?php $this->_($category[0]); ?>
                                               <?php endif; ?>
                                               <br />
                                           <?php endforeach; ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdVertical">Descripción del Rol:</td>
                                        <td class="tdData">
                                            <span id="userRoleDesc" style="font-size: smaller">Este usuario es un usuario normal.</span>
                                        </td>
                                    </tr>
                                <?php else: ?>
                                    <span style="display:none;">
                                        <input type="radio" name="role" value="none" title="" checked />Usuario Normal
                                    </span>
                                <?php endif; ?>
                                <?php if($this->EEOSettingsRS['enabled'] == 1): ?>
                                     <tr>
                                        <td class="tdVertical">Permitido ver la Información de EEO:</td>
                                        <td class="tdData">
                                            <span id="eeoIsVisibleCheckSpan">
                                                <input type="checkbox" name="eeoIsVisible" id="eeoIsVisible" onclick="if (this.checked) document.getElementById('eeoVisibleSpan').style.display='none'; else document.getElementById('eeoVisibleSpan').style.display='';">
                                                &nbsp;Este Usuario <span id="eeoVisibleSpan">no </span>tiene permitido editar y ver la información de EEO del candidato.
                                            </span>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                                <?php if (!$this->license['canAdd'] && !$this->license['unlimited']): ?>
                                    <tr>
                                        <td class="tdVertical">Aviso:</td>
                                        <td class="tdData" style="color: #800000;">
                                            <b>Actualmente está utilizando su asignación completa de cuentas de usuario activas. Deshabilite una cuenta existente o actualice su licencia para agregar otro usuario activo.</b>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            </table>
                        </td>
                        <?php
                        eval(Hooks::get('SETTINGS_USERS_FULLQUOTALICENSES'));
                        ?>
                    </tr>
                </table>

                <input type="submit" class="button" name="submit" id="submit" value="Agregar Usuario" />&nbsp;
                <input type="reset"  class="button" name="reset"  id="reset"  value="Borrar" onclick="document.getElementById('userAccessStatus').innerHTML='Eliminar: todos los accesos inferiores, más la capacidad de eliminar información en el sistema.'" />&nbsp;
                <input type="button" class="button" name="back"   id="back"   value="Cancelar" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=manageUsers');" />
            </form>
        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
