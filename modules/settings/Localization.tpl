<?php /* $Id: Localization.tpl 2108 2007-03-08 09:30:00Z will $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js')); ?>
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
                    <td><h2>Ajustes: Administración</h2></td>
                </tr>
            </table>

            <p class="note">Localización</p>

            <table class="searchTable" width="100%">
                <tr>
                    <td>
                        <div style="width: 700px;">Estas opciones afectan la forma en que CATS formatea los números, las fechas y la hora. <span style="font-weight:bold;"> Usted (y los otros usuarios de su sitio) deberán cerrar la sesión y volver a iniciarla para que esta configuración surta efecto.</span></div>
                        <br />
                        <form action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration" id="localizationForm" method="post">
                            <input type="hidden" name="postback" value="postback" />
                            <input type="hidden" name="administrationMode" value="localization" />

                            <table class="editTable" width="700">
                                <tr>
                                    <td>Elija su Zona Horaria.</td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 10px;"><?php TemplateUtility::printTimeZoneSelect('timeZone', 'width: 420px;', '', $this->timeZone); ?></td>
                                </tr>

                                <tr>
                                    <td>Elija su Formato de Fecha Preferido.</td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 5px;">
                                        <select id="dateFormat" name="dateFormat" style="width: 150px;">
                                            <option value="mdy"<?php if (!$this->isDateDMY): ?> selected<?php endif; ?>>MM-DD-YYYY (US)</option>
                                            <option value="dmy"<?php if ($this->isDateDMY): ?> selected<?php endif; ?>>DD-MM-YYYY (UK)</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        <input type="submit" class="button" value="Guardar (y Cerrar Sesión)" />&nbsp;
                        <input type="button" name="back" class="button" value="Atrás" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration';" />
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
