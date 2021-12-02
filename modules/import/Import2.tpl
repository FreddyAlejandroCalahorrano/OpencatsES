<?php /* $Id: Import2.tpl 3370 2007-11-01 16:43:07Z andrew $ */ ?>
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

                <table class="searchTable" id="importHide1">
                    <tr>
                        <td>
                            <?php echo($this->errorMessage); ?>
                        </td>
                    </tr>
                </table>

                <br />

            <?php elseif (isset($this->successMessage)): ?>

                <p class="note" id="importHide0">Éxito</p>

                <table class="searchTable" id="importHide1">
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


            <?php else: ?>

            <p class="note" id="importHide2">Importar Datos - Paso 2</p>

            <table class="searchTable" id="importTable1" width="100%">
                <tr>
                    <td>CATS puede descartar o no leer algunos de los datos enviados que no
                        entiende cómo utilizar. ¡No deseche los datos originales!
                    </td>
                </tr>

            </table>

            <br />
            <?php endif; ?>

            <form name="importDataForm" id="importDataForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=importUploadFile" enctype="multipart/form-data" method="post" autocomplete="off" onsubmit="document.getElementById('nextSpan').style.display='none'; document.getElementById('uploadingSpan').style.display='';">
                <table class="searchTable" width="740" id="importHide3" width="100%">
                    <tr>
                        <td class="tdVertical">
                            <label id="fileLabel" for="file">Importar en:</label>
                        </td>
                        <td class="tdData">
                            <?php if ($this->typeOfImport == 'Candidates'): ?>
                                <img src="images/candidate_inline.gif">&nbsp;Candidatos
                            <?php elseif ($this->typeOfImport == 'JobOrders'): ?>
                                <img src="images/mru/job_order.gif">&nbsp;Órdenes de Trabajo
                            <?php elseif ($this->typeOfImport == 'Companies'): ?>
                                <img src="images/mru/company.gif">&nbsp;Empresas
                            <?php elseif ($this->typeOfImport == 'Contacts'): ?>
                                <img src="images/mru/contact.gif">&nbsp;Contactos
                            <?php endif; ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="fileLabel" for="file">Archivo:</label>
                        </td>
                        <td class="tdData">
                            <input type="file" id="file" name="file" style="width: 260px;" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="dataTypeLabel" for="dataType">Formato de Archivo:</label>
                        </td>
                        <td class="tdData">
                                <input type="hidden" name="typeOfImport" value="<?php echo($this->typeOfImport); ?>">

                                <input type="radio" name="typeOfFile" value="csv" checked>&nbsp;Separado por Comas (CSV)<br />
                                <input type="radio" name="typeOfFile" value="tab" >&nbsp;Delimitado por tabulaciones<br />
                                <br />
                                <span id="nextSpan">
                                    <input class="button" type="button" value="Atrás" onclick="document.location.href='?m=import';">
                                    <input class="button" type="submit" value="Siguiente">
                                </span>
                                <span id="uploadingSpan" style="display:none;">
                                    Subiendo archivo, espere...<br />
                                    <img src="images/loading.gif" />
                                </span>
                                </td>
                        </td>
                    </tr>

                </table>
            </form>
        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
