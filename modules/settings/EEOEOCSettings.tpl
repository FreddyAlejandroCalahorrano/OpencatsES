<?php /* $Id: EEOEOCSettings.tpl 2336 2007-04-14 22:01:51Z will $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js', 'js/eeo.js')); ?>
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

            <p class="note">Configuración de Seguimiento de Igualdad de Oportunidades de Empleo</p>

            <table width="100%">
                <tr>
                    <td>
                        <form name="EEOForm" id="EEOForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=eeo" method="post">
                            <input type="hidden" name="postback" value="postback" />

                            <table class="editTable" width="100%">
                                <tr>
                                    <td class="tdVertical" style="width: 250px;">
                                        Habilitar el Seguimiento de EEO Candidato:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="enabled" id="enabled"<?php if ($this->EEOSettingsRS['enabled'] == '1'): ?> checked<?php endif; ?> onchange="checkUnckeckEEOSettings(this.checked);">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical" style="width: 250px;">
                                        Seguimiento de Género:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="genderTracking" id="genderTracking"<?php if ($this->EEOSettingsRS['genderTracking'] == '1'): ?> checked<?php endif; ?> onchange="if (this.checked) document.getElementById('enabled').checked=true;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical" style="width: 250px;">
                                        Seguimiento de Origen Étnico:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="ethnicTracking" id="ethnicTracking"<?php if ($this->EEOSettingsRS['ethnicTracking'] == '1'): ?> checked<?php endif; ?> onchange="if (this.checked) document.getElementById('enabled').checked=true;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical" style="width: 250px;">
                                        Seguimiento del Estado de veterano:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="veteranTracking" id="veteranTracking"<?php if ($this->EEOSettingsRS['veteranTracking'] == '1'): ?> checked<?php endif; ?> onchange="if (this.checked) document.getElementById('enabled').checked=true;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdVertical" style="width: 250px;">
                                        Seguimiento del Estado de Discapacidad:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="disabilityTracking" id="disabilityTracking"<?php if ($this->EEOSettingsRS['disabilityTracking'] == '1'): ?> checked<?php endif; ?> onchange="if (this.checked) document.getElementById('enabled').checked=true;">
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" class="button" value="Guardar Ajustes" />&nbsp;
                            <br />
                            <br />
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
