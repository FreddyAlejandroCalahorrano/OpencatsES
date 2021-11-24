<?php /* $Id: SystemInformation.tpl 3575 2007-11-12 17:40:45Z will $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/settings.gif" width="24" height="24" alt="Settings" style="border: none; margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Ajustes: Administración</h2></td>
                </tr>
            </table>

            <p class="note">Información del Sistema</p>

            <table class="editTable" width="700">
                    <tr>
                        <td class="tdVertical" colspan="2"><span style="font-weight: bold;">Información General</span></td>
                    </tr>
                    <tr>
                        <td class="tdVertical" style="width:250px;">
                            Sistema Operativo:
                        </td>
                        <td class="tdData">
                            <?php echo(php_uname()); ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical" style="width:250px;">
                            Tipo de Sistema Operativo:
                        </td>
                        <td class="tdData">
                            CATS cree que su Sistema Operativo es <span class="bold"><?php $this->_($this->OSType); ?>.</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical" style="width:250px;">
                            Versión de PHP:
                        </td>
                        <td class="tdData">
                            <?php echo(PHP_VERSION); ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical" style="width:250px;">
                            Versión de la Base de Datos:
                        </td>
                        <td class="tdData">
                            <?php $this->_($this->databaseVersion); ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical" style="width:250px;">
                            Directorio de Instalación:
                        </td>
                        <td class="tdData">
                            <?php $this->_($this->installationDirectory); ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdVertical" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="tdVertical" colspan="2"><span style="font-weight: bold;">Información de la Versión del Esquema del Módulo</span></td>
                    </tr>
                    <?php foreach ($this->schemaVersions as $rowIndex => $row): ?>
                    <tr>
                        <td class="tdVertical" style="width:250px;">
                            <?php $this->_($row['name']); ?>
                        </td>
                        <td class="tdData">
                            <?php echo($row['version']); ?>
                        </td>
                    </tr>
                    <?php endforeach; ?>
            </table>
            <input type="button" name="back" class="button" value="Regresar" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration';" />

        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
