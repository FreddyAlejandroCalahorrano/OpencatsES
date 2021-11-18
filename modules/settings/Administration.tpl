<?php /* $Id: Administration.tpl 3722 2007-11-27 21:49:36Z andrew $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<style>
#profButton {
    background: #E7EFFF url(images/profButton.jpg);
    width: 169px;
    height: 34px;
    cursor: pointer;
    margin-top: 20px;
}
#profButton:hover {
    background: #E7EFFF url(images/profButton-o.jpg);
}
</style>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/settings.gif" width="24" height="24" border="0" alt="Settings" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Ajustes: Administración</h2></td>
                </tr>
            </table>

                        <p class="noteUnsized">Manejo de Sitio</p>

                        <table class="searchTable" width="100%">
                            <tr>
                                <td width="300">
                                    <img src="images/bullet_black.gif" alt="" />
                                    <?php if ($this->careerPortalUnlock): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=careerPortalSettings">Sitio Web de Carreras</a>
                                    <?php else: ?>
                                    <a href="http://www.catsone.com/?a=careerswebsite"><b>Sitio Web de Carreras</b></a>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    Configure su sitio web donde los solicitantes pueden postularse y publicar sus currículums para sus trabajos.
                                </td>
                            </tr>
                            <tr>
                                <td width="230">
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration&amp;s=siteName">
                                        Cambiar los Detalles del Sitio
                                    </a>
                                </td>
                                <td>
                                    Cambie los detalles del sitio, como el nombre del sitio y la configuración de la institución.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=manageUsers">
                                        Gestión de Usuarios
                                    </a>
                                </td>
                                <td>
                                    Agregue, edite y elimine usuarios para su sitio.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=loginActivity">
                                        Actividad de Inicio de Sesión
                                    </a>
                                </td>
                                <td>
                                    Muestra el historial de inicio de sesión de su sitio.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=emailSettings">
                                        Configuración General de Correo Electrónico
                                    </a>
                                </td>
                                <td>
                                    Configure las preferencias de correo electrónico, como la dirección de devolución y cuándo se envían los correos electrónicos.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=emailTemplates">
                                        Configuración de la Plantilla de Correo Electrónico
                                    </a>
                                </td>
                                <td>
                                    Configure las plantillas de correo electrónico para su sitio.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration&amp;s=localization">
                                        Localización
                                    </a>
                                </td>
                                <td>
                                    Cambie la forma en que se muestran y se comportan las direcciones y las horas para las diferentes regiones.
                                </td>
                            </tr>
                            <tr <?php if (!$this->totalCandidates): ?>style="background-color: #DAE3F7;"<?php endif; ?>>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=import">
                                        <?php if (!$this->totalCandidates): ?><b><?php endif; ?>Importación de Datos<?php if (!$this->totalCandidates): ?></b><?php endif; ?>
                                    </a>
                                </td>
                                <td>
                                    <?php if (!$this->totalCandidates): ?><b><?php endif; ?>Importe currículums, candidatos, empresas o contactos desde archivos en su computadora.<?php if (!$this->totalCandidates): ?></b><?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=createBackup">
                                        Copia de Seguridad del Sitio
                                    </a>
                                </td>
                                <td>
                                    Produzca una copia de seguridad descargable con todo el contenido de su sitio.
                                </td>
                            </tr>
                        </table>
                        <br />

                        <p class="noteUnsized">Configuración de Funciones</p>

                        <table class="searchTable" width="100%">
                            <!--<tr>
                                <td width="300">
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=reports">
                                        Informes
                                    </a>
                                </td>
                                <td>
                                    Configure el aspecto predeterminado de los informes de su sitio.
                                </td>
                            </tr>-->
                            <tr>
                                <td width="300">
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=eeo">
                                        Soporte EEO / EOC
                                    </a>
                                </td>
                                <td>
                                    Habilite y configure el seguimiento de cumplimiento de EEO / EOC.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=tags">
                                        Configurar Etiquetas
                                    </a>
                                </td>
                                <td>
                                    Agregar / quitar etiquetas, descripción de las etiquetas.
                                </td>
                            </tr>
                        </table>
                        <br />

                        <p class="noteUnsized">Personalización de GUI</p>

                        <table class="searchTable" width="100%">
                            <tr>
                                <td width="300">
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=customizeCalendar">
                                        Personalizar Calendario
                                    </a>
                                </td>
                                <td>
                                    Cambie la configuración del calendario, como la duración de un día laboral.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/bullet_black.gif" alt="" />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=customizeExtraFields">
                                        Personalizar Campos Adicionales
                                    </a>
                                </td>
                                <td>
                                    Agregue, cambie el nombre y elimine campos de texto adicionales de varios tipos de datos.
                                </td>
                            </tr>
                        </table>
                        <br />

                        <?php if ($this->systemAdministration): ?>
                            <p class="noteUnsized">Sistema</p>

                            <table class="searchTable" width="100%">
                                <!--<tr>
                                    <td width="230">
                                        <img src="images/bullet_black.gif" alt="" border="0" />
                                        Scheduler
                                    </td>
                                    <td>
                                        <i>Change how CATS interacts with the server to schedule tasks.</i>
                                    </td>
                                </tr>-->
                                <tr>
                                    <td width="300">
                                    <img src="images/bullet_black.gif" alt="" />
                                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration&amp;s=passwords">
                                            Contraseñas
                                        </a>
                                    </td>
                                    <td>
                                        Cambie la forma en que CATS almacena las contraseñas de los usuarios y cómo los usuarios pueden recuperarlas.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="230">
                                    <img src="images/bullet_black.gif" alt="" />
                                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration&amp;s=newVersionCheck">
                                            Comprobación de una Nueva Versión
                                        </a>
                                    </td>
                                    <td>
                                        Cambie la forma en que CATS comprueba periódicamente si hay nuevas versiones.
                                    </td>
                                </tr>
                                <tr>
                                    <td width="230">
                                    <img src="images/bullet_black.gif" alt="" />
                                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration&amp;s=systemInformation">
                                            Información del Sistema
                                        </a>
                                    </td>
                                    <td>
                                        Ver información sobre esta instalación de CATS.
                                    </td>
                                </tr>
                            </table>
                        <?php endif; ?>

                        <?php if (!empty($this->extraSettings)): ?>
                            <br />

                            <p class="noteUnsized">Otros Ajustes</p>

                            <table class="searchTable" width="100%">
                                <?php foreach ($this->extraSettings as $setting): ?>
                                    <tr>
                                        <td width="230">
                                            <img src="images/bullet_black.gif" alt="" />
                                            <a href="<?php echo($setting[1]); ?>"><?php $this->_($setting[0]); ?></a>
                                        </td>
                                        <td>
                                            <?php $this->_($setting[3]); ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </table>
                        <?php endif; ?>
                       <br />
                    </td>
                </tr>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
