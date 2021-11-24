<?php /* $Id: Backup.tpl 3582 2007-11-12 22:58:48Z brian $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('js/backup.js')); ?>
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
                    <td><h2>Ajustes: Copia de Seguridad del Sitio</h2></td>
                </tr>
            </table>

            <p class="note">Crear Copia de Seguridad del Sitio</p>

            <table class="searchTable" width="100%">
                <tr>
                    <td>
                        Cree una copia de seguridad de toda su base de datos CATS (incluidos todos sus archivos adjuntos).<br />
                        Nota: Solo se puede almacenar una copia de seguridad de su base de datos en el servidor a la vez. Crear una nueva copia de seguridad
                        eliminar la copia de seguridad anterior.<br />
                        <br />
                    </td>
                </tr>
                    <td>
                    <span id="backupRunning" style="display:none;">
                        Realizando una copia de seguridad de la base de datos, espere ... (¡Ahora sería un buen momento para tomar un café!)
                        <br /><br />
                        Estado:<br />
                    </span>
                    <span id="progressHistory">
                    </span>
                    <span id="progress">
                        Última Copia de Seguridad:
                        <table class="attachmentsTable">
                            <?php foreach ($this->attachmentsRS as $rowNumber => $attachmentsData): ?>
                                <tr>
                                    <td>
                                        <a href="<?php echo $attachmentsData['retrievalURL']; ?>">
                                            <img src="images/file/zip.gif" alt="" width="16" height="16" border="0" />
                                        </a>
                                    </td>
                                    <td>
                                        (<?php $this->_($attachmentsData['fileSize']) ?>)&nbsp;
                                        <a href="<?php echo $attachmentsData['retrievalURLLocal']; ?>">
                                            <?php $this->_($attachmentsData['originalFilename']) ?>
                                        </a>
                                    </td>
                                    <td><?php $this->_($attachmentsData['dateCreated']) ?></td>
                                    <td>
                                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=deleteBackup" title="Eliminar" onclick="javascript:return confirm('¿Eliminar esta copia de seguridad?');">
                                            <img src="images/actions/delete.gif" alt="" width="16" height="16" border="0" />
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </table>
                        <?php if (empty($this->attachmentsRS)): ?>
                            Ninguna<br />
                        <?php else: ?>
                            Haga clic en el archivo de arriba para descargar la copia de seguridad.<br />
                        <?php endif; ?>

                    <br />
                    <input type="button" class="button" value="Crear una Copia de Seguridad Completa del Sistema" onclick="startBackup('settings:backup', '');" style="margin:3px; width:300px;"><br />
                    <input type="button" class="button" value="Crear Copia de Seguridad de Archivos Adjuntos" onclick="startBackup('settings:backup', '&attachmentsOnly=true');" style="margin:3px; width:300px;">
                    </span>
                    <span id="progressBar" style="display:none;">
                    <br /><br />
                    <div id="empty" style="background-color:#eeeeee;border:1px solid black;height:20px;width:300px;padding:0px;" align="left">
                        <div id="d2" style="position:relative;top:0px;left:0px;background-color:#2244ff;height:20px;width:0px;padding-top:5px;padding:0px;">
                            <div id="d1" style="position:relative;top:0px;left:0px;color:#ffffff;height:20px;text-align:center;font:bold;padding:0px;padding-top:1px;">
                            </div>
                        </div>
                    </div>
                    </span>
                    </td>
                    <span id="tempJs" style="display:none;"></span>
                    <iframe id="progressIFrame" style="display:none;"></iframe>
                </tr>
            </table>

        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
