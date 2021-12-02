<?php /* $Id: Import1.tpl 3780 2007-12-03 21:13:56Z andrew $ */ ?>
<?php TemplateUtility::printHeader('Import', array('modules/import/import.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, '', 'settings'); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/reports.gif" width="24" height="24" border="0" alt="Import" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Importar Datos</h2></td>
                </tr>
            </table>

            <?php if (isset($this->errorMessage)): ?>

                <p class="warning" id="importHide0">Error!</p>

                <table class="searchTable" id="importHide1" width="100%">
                    <tr>
                        <td>
                            <?php echo($this->errorMessage); ?>
                        </td>
                    </tr>
                </table>

                <br />

            <?php elseif (isset($this->successMessage)): ?>

                <p class="note" id="importHide0">Éxito</p>

                <table class="searchTable" id="importHide1" width="100%">
                    <tr>
                        <td>
                            <?php echo($this->successMessage); ?>
                        </td>
                    </tr>
                </table>

                <br />

            <?php elseif (isset($this->pendingCommits)): ?>

                <p class="warning" id="importHide0">Aviso</p>

                <table class="searchTable" id="importHide1">
                    <tr>
                        <td>
                            Recientemente ha importado datos CSV. Puede hacer clic aquí para revisar o eliminar los datos importados.<br />
                            <input type="button" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=viewpending';" value="View Recent Imports" class="button" />
                        </td>
                    </tr>
                </table>

                <br />

            <?php endif; ?>

            <p class="note">Importar Datos</p>

            <table class="searchTable" id="importTable1" width="100%">
                <tr>
                    <td>CATS puede descartar o no leer algunos de los datos importados que no
                        entiende cómo utilizar. ¡No deseche los datos originales!
                    </td>
                </tr>
            </table>

            <br />

            <table class="searchTable" id="importTable2" width="100%">
                <tr>
                    <td>¿Qué le gustaría importar?<br />
                    <br />
                    <form name="importDataForm" id="importDataForm" action="<?php echo(CATSUtility::getIndexName()); ?>" method="get" autocomplete="off">
                        <input type="hidden" name="m" value="import">
                        <input type="hidden" name="a" value="importSelectType">

                        <input type="radio" name="typeOfImport" value="resume" checked>&nbsp;<img src="images/file/doc.gif">&nbsp;Currículums<br />
                        <input type="radio" name="typeOfImport" value="Candidates">&nbsp;<img src="images/candidate_inline.gif">&nbsp;Candidatos<br />
                        <input type="radio" name="typeOfImport" value="JobOrders">&nbsp;<img src="images/joborder.gif">&nbsp;Órdenes de Trabajo<br />
                        <input type="radio" name="typeOfImport" value="Companies" >&nbsp;<img src="images/mru/company.gif">&nbsp;Empresas<br />
                        <input type="radio" name="typeOfImport" value="Contacts" >&nbsp;<img src="images/mru/contact.gif">&nbsp;Contactos<br />
                        <br />
                        <input class="button" type="submit" value="Siguiente">
                        </td>
                    </form>
                </tr>
            </table>

            <?php if ($this->bulk['numBulkAttachments'] > 0 && $this->getUserAccessLevel('import.import') >= ACCESS_LEVEL_SA): ?>
            <br />
            <div style="background-color: #f0f0f0; color: #000000; border: 1px solid #000000; text-align: left; font-size: 14px; padding: 10px; margin: 0 0 15px 0; font-weight: normal;">
                Has subido <b><?php echo number_format($this->bulk['numBulkAttachments'], 0); ?></b>
                documentos de currículum sin clasificar. Puede buscar estos documentos; pero, no están apegados a
                candidatos porque la información del candidato (como su nombre, dirección, etc.) no estaba disponible cuando se cargó.
                <br /><br />
                Vuelva a escanear los documentos para intentar detectar automáticamente la información del candidato. Introdúzcalo manualmente si es necesario.
                <br /><br />
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td style="padding-right: 10px;">
                            <input type="button" value="Volver a Escanear Documentos" name="rescan" id="rescanButton" class="button" onclick="document.location.href='<?php echo CATSUtility::getIndexName(); ?>?m=import&a=importBulkResumes';" />
                        </td>
                        <td>
                            <input type="button" value="Eliminar Documentos" name="delete" id="deleteButton" class="button" onclick="if (confirm('Esto eliminará todos los archivos adjuntos que se pueden buscar y que no se han asociado con los candidatos. Esta acción no se puede deshacer. Estás seguro de que quieres continuar?')) document.location.href='<?php echo CATSUtility::getIndexName(); ?>?m=import&a=deleteBulkResumes';" />
                        </td>
                    </tr>
                </table>
            </div>
            <?php endif; ?>

            <br />

        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
