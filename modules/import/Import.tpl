<?php /* $Id: Import.tpl 3370 2007-11-01 16:43:07Z andrew $ */ ?>
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
                <p class="note" id="importHide0">Advertencia!</p>

                <table class="searchTable" id="importTable1" width="100%">
                    <tr>
                        <td>
                            CATS puede descartar o no leer algunos de los datos importados que no
                            entiende cómo utilizar. ¡No deseche los datos originales!
                        </td>
                    </tr>

                </table>

                <br />
            <?php endif; ?>

            <p class="warning" id="importShow0" style="display:none;">ESPERE POR FAVOR!</p>

            <table class="searchTable" id="importShow1" style="display:none;">
                <tr>
                    <td>
                        ¡Espere por favor! La importación de datos puede tardar unos minutos.<br />
                        <img src="images/loading.gif" />
                    </td>
                </tr>
            </table>

            <p class="note" id="importHide2">Importar Datos</p>

            <form name="importDataForm" id="importDataForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=import&amp;#step2" enctype="multipart/form-data" method="post" autocomplete="off" <?php if (isset($this->contactsUploadNotice) && $this->contactsUploadNotice): ?> onsubmit="return checkField(<?php echo(count($this->theFields)); ?>, 'company_id', 'You must have 1 field set as Company.') && showLoading();"<?php else: ?> onsubmit="return showLoading();"<?php endif; ?>>
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="fileName" name="fileName" value="<?php echo($this->fileName); ?>" />
                <input type="hidden" id="dataContaining" name="dataContaining" value="<?php echo($this->dataContaining) ?>" />
                <input type="hidden" name="importInto" id="importInto" value="<?php echo($this->importInto) ?>" />
                <input type="hidden" name="typeOfImport" value="<?php echo($this->typeOfImport); ?>">
                <input type="hidden" id="dataType" name="dataType" value="<?php echo($this->dataType) ?>" />

                <table class="searchTable" width="740" id="importHide3">

                    <tr>
                        <td class="tdVertical">
                            <label id="dataContainingDisabledLabel" for="dataContainingDisabled">Formato de Archivo:</label>
                        </td>
                        <td class="tdData">
                            <?php if ($this->dataContaining == 'tab'): ?>
                                Datos Delimitados por Tabuciones
                            <?php elseif ($this->dataContaining == 'csv'): ?>
                                Datos Delimitados por Comas (CSV)
                            <?php endif; ?>

                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="importIntoLabel" for="importIntoDisabled">Importar en:</label>
                        </td>
                        <td class="tdData">
                            <?php if ($this->importInto == 'Candidates'): ?>
                                <img src="images/candidate_inline.gif">&nbsp;Candidatos
                            <?php elseif ($this->importInto == 'Companies'): ?>
                                <img src="images/mru/company.gif">&nbsp;Empresas
                            <?php elseif ($this->importInto == 'Contacts'): ?>
                                <img src="images/mru/contact.gif">&nbsp;Contactos
                            <?php endif; ?>
                        </td>
                    </tr>
                </table>

                    <input type="reset"  class="button" name="reset" id="importHide4" value="Reset" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=import';" />&nbsp;

            <br />
            <br />


            <p class="note" id="importHide5"><a name="step2">Mapa de Datos</a></p>

            <?php if (isset($this->contactsUploadNotice) && $this->contactsUploadNotice): ?>

            <table class="searchTable" id="importHide6">
                <tr>
                    <td>
                        Estás importando datos a Contactos. Cada contacto debe tener asociado una
                        Empresa.<br /><br />

                        Si lo desea, CATS puede crear las empresas para cada empresa que no se encuentre en la base de datos.
                        La información de contacto de la empresa será idéntica a la información de contacto de los primeros contactos.
                        <br /><br />

                        Por ejemplo, si agrega John Smith como asociado a Fun Industries, y John
                        Smith figura con la dirección de trabajo '1234 Fun St.', luego CATS puede crear la empresa Fun
                        Industrias con dirección '1234 Fun St.'.<br /><br />

                        Si elige no generar datos de la empresa, los contactos con empresas desconocidas no serán
                        importados.<br /><br />

                        <span class="bold">¿Debería CATS generar los datos de la empresa automáticamente??</span><br />
                        <select id="generateCompanies" name="generateCompanies" class ="inputBox" style="width: 260px;" onchange="evaluateUnnamedContacts();">
                            <option value="yes" selected="selected">Sí, generar datos de empresa asociados.</option>
                            <option value="no">No, solo importa los contactos.</option>
                        </select>
                        <br />
                        <span id='unnamedContactsSpan'>
                        <br />
                        <span class="bold">Si no hay un nombre para el contacto de la empresa, ¿CATS debería nombrar el contacto "nadie" y agregarlo a la empresa?</span><br />
                        <select id="unnamedContacts" name="unnamedContacts" class ="inputBox" style="width: 260px;">
                            <option value="yes" selected="selected">Sí, agregue un nombre según sea necesario.</option>
                            <option value="no">No, elimine estos registros.</option>
                        </select>
                        </span>
                    </td>
                </tr>
            </table>
            <br />

            <?php endif; ?>

            <table class="searchTable" id="importHide9">
                <tr>
                    <td>siguientes campos en sus datos. Elija dónde poner los
                        datos de cada campo, luego presione importar en la parte inferior.</td>
                </tr>
            </table>

            <br />
            <table class="editTable" width="740" id="importHide10">
                <?php foreach ($this->theFields AS $fieldIndex => $theField): ?>
                    <tr>
                        <td class="tdVertical">
                            <?php echo($theField); ?>
                        </td>
                        <td class="tdData">
                            <?php $match = false; ?>
                            <?php foreach ($this->matchingFields as $matchingField): ?>
                                <?php if (trim(strtolower($theField)) == strtolower($matchingField)): ?>
                                    <?php $match = true; ?>
                                <?php endif; ?>
                            <?php endforeach; ?>
                            <a href="javascript:void(0);" onclick="showSampleData(<?php echo($fieldIndex); ?>);" onmouseout="hideSampleData(<?php echo($fieldIndex); ?>);" title="Data de Muestra">
                                <img src="images/mru/contact.gif" alt="" border="0" />
                            </a>
                            &nbsp;
                            <select id="importType<?php echo($fieldIndex); ?>" name="importType<?php echo($fieldIndex); ?>" class="inputbox" style="width: 230px;" onchange="evaluateFieldSelection(<?php echo($fieldIndex); ?>);">
                                <option value="">No importar.</option>
                                <option value="cats" <?php if ($match): ?>selected<?php endif; ?>>Importar como <?php echo($this->importInto); ?> campo.</option>
                                <?php if ($this->isSA): ?><option value="foreign">Agregar campo a Campos Adicionales e Importar.</option><?php endif; ?>
                            </select>
                            <span <?php if (!$match): ?>style="display:none;"<?php endif; ?> id="importIntoSpan<?php echo($fieldIndex); ?>">
                                &nbsp;<?php echo($this->importInto); ?> Campo:&nbsp;
                                <select id="importIntoField<?php echo($fieldIndex); ?>" name="importIntoField<?php echo($fieldIndex); ?>" class="inputbox" style="width: 180px;">
                                    <?php for ($i = 0; $i < count($this->importTypes); $i += 2): ?>
                                        <option value='<?php echo($this->importTypes[$i+1]); ?>' <?php if ($match && strtolower($theField) == strtolower($this->importTypes[$i])): ?>selected<?php endif; ?>><?php echo($this->importTypes[$i]); ?></option>
                                    <?php endfor; ?>
                                </select>
                            </span>
                            <div id="importSample<?php echo($fieldIndex); ?>" style="display:none;">
                                <br /><br />
                                <table class="searchTable">
                                    <tr>
                                        <td>
                                            <span class="bold">Datos de Muestra</span>

                                            <?php $fieldsDisplayed = 0; ?>
                                            <?php for ($i = 0; $i < 20; $i++): ?>
                                                <?php if (isset($this->arrayOfData[$i][$fieldIndex]) && $this->arrayOfData[$i][$fieldIndex] != '' && $fieldsDisplayed < 5): ?>
                                                    <br />&#39;<?php $this->_($this->arrayOfData[$i][$fieldIndex]); $fieldsDisplayed++;  ?>&#39;
                                                <?php endif; ?>
                                            <?php endfor; ?>
                                            <?php if ($fieldsDisplayed == 0): ?>
                                                <br /><i>(ninguno)</i>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>

            <input type="reset"  class="button" name="reset"  id="importHide8"  value="Reiniciar" onclick="for (var i = 0; i < <?php echo(count($this->theFields)); ?>; i++) evaluateFieldSelection(i); " />&nbsp;
            <input type="submit" class="button" name="submit" id="importHide7" value="Siguiente: Importar Datos" />&nbsp;
            </form>
        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
