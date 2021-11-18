<?php /* $Id: MyProfile.tpl 2452 2007-05-11 17:47:55Z brian $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js', 'js/sorttable.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/settings.gif" width="24" height="24" border="0" alt="Settings" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Ajustes: Mi Perfil</h2></td>
                </tr>
            </table>

            <p class="note">Perfil</p>

            <?php if ($this->isDemoUser): ?>
                Tenga en cuenta que, como usuario de demostración, no tiene privilegios para modificar ninguna configuración.
                <br /><br />
            <?php endif; ?>

            <table width="100%">
                <tr>
                    <td width="100%">
                        <table class="searchTable" width="100%">
                            <tr>
                                <td width="230">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=showUser&amp;userID=<?php echo($this->userID); ?>&amp;privledged=false">
                                        <img src="images/bullet_black.gif" alt="" border="0" />Ver Perfil
                                    </a>
                                </td>
                                <td>
                                    Vea su perfil actual para verificar que su información sea correcta.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=myProfile&amp;s=changePassword">
                                        <img src="images/bullet_black.gif" alt="" border="0" />Cambiar la Contraseña
                                    </a>
                                </td>
                                <td>
                                    Cambie su contraseña de inicio de sesión de CATS.
                                </td>
                            </tr>
                            <!--<tr>
                                <td>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=myProfile&amp;s=notificationOptions">
                                        <img src="images/bullet_black.gif" alt="" border="0" />Change Notification Options
                                    </a>
                                </td>
                                <td>
                                    Change how CATS notifies you of new events.
                                </td>
                            </tr>-->
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
