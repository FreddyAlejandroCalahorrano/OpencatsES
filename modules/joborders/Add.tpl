<?php /* $Id: Add.tpl 3810 2007-12-05 19:13:25Z brian $ */ ?>
<?php TemplateUtility::printHeader('Job Orders', array('modules/joborders/validator.js',  'js/company.js', 'js/sweetTitles.js', 'js/suggest.js', 'js/joborder.js', 'js/lib.js', 'js/listEditor.js', 'vendor/ckeditor/ckeditor/ckeditor.js', 'js/ckeditor-manager.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Órdenes de Trabajo: Agregar Orden de Trabajo</h2></td>
                </tr>
            </table>

            <p class="note">Agregue una nueva Orden de Trabajo al sistema.</p>

            <?php if ($this->noCompanies): ?>
                <table style="margin-top: 8px; width: 50%;" class="selectView">
                    <tr>
                        <td>
                            <span><span class="bold">Aún no ha agregado ninguna empresa.</span> No puede agregar una orden de trabajo hasta
                            agrega al menos una empresa. Por favor ve al <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies">Empresas</a>
                            módulo y agregue una empresa.</span>
                        </td>
                    </tr>
                </table>
            <?php else: ?>
                <form name="addJobOrderForm" id="addJobOrderForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=add" method="post" onsubmit="return checkAddForm(document.addJobOrderForm);" autocomplete="off">
                    <input type="hidden" name="postback" id="postback" value="postback" />

                    <table class="editTable" width="700">
                        <tr>
                            <td class="tdVertical">
                                <label id="titleLabel" for="title">Título:</label>
                            </td>
                            <td class="tdData">
                                <input type="text" tabindex="1" class="inputbox" id="title" name="title" style="width: 150px;" <?php if(isset($this->jobOrderSourceRS['title'])): ?>value="<?php $this->_($this->jobOrderSourceRS['title']); ?>"<?php endif; ?> />&nbsp;*
                            </td>

                            <td class="tdVertical">
                                <label id="startDateLabel" for="startDate">Fecha de Inicio:</label>
                            </td>
                            <td class="tdData">
                                <script type="text/javascript">DateInput('startDate', false, 'MM-DD-YY', '', 8);</script>
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="companyIDLabel" for="companyID">Empresa:</label>
                            </td>

                            <td class="tdData">
                                <input type="hidden" name="companyID" id="companyID" value="<?php if ($this->selectedCompanyID === false) { if (isset($this->jobOrderSourceRS['companyID'])) { echo ($this->jobOrderSourceRS['companyID']); } else { echo(0); } } else { echo($this->selectedCompanyID); } ?>" />

                                <?php if ($this->defaultCompanyID !== false): ?>
                                    <input type="radio" name="typeCompany" checked onchange="document.getElementById('companyName').disabled = false; if (oldCompanyID != -1) document.getElementById('companyID').value = oldCompanyID;">
                                    <input type="text" name="companyName" id="companyName" tabindex="2" value="<?php if ($this->selectedCompanyID !== false) { $this->_($this->companyRS['name']); } ?><?php if(isset($this->jobOrderSourceRS['companyName']) && $this->selectedCompanyID == false ): ?><?php $this->_($this->jobOrderSourceRS['companyName']); ?><?php endif; ?>" class="inputbox" style="width: 125px" onFocus="suggestListActivate('getCompanyNames', 'companyName', 'CompanyResults', 'companyID', 'ajaxTextEntryHover', 0, '<?php echo($this->sessionCookie); ?>', 'helpShim');" <?php if ($this->selectedCompanyID !== false) { echo('disabled'); } ?>/>&nbsp;*
                                <?php else: ?>
                                    <input type="text" name="companyName" id="companyName" tabindex="2" value="<?php if ($this->selectedCompanyID !== false) { $this->_($this->companyRS['name']); } ?><?php if(isset($this->jobOrderSourceRS['companyName']) && $this->selectedCompanyID == false ): ?><?php $this->_($this->jobOrderSourceRS['companyName']); ?><?php endif; ?>" class="inputbox" style="width: 150px" onFocus="suggestListActivate('getCompanyNames', 'companyName', 'CompanyResults', 'companyID', 'ajaxTextEntryHover', 0, '<?php echo($this->sessionCookie); ?>', 'helpShim');" <?php if ($this->selectedCompanyID !== false) { echo('disabled'); } ?>/>&nbsp;*
                                <?php endif; ?>
                                <br />
                                <iframe id="helpShim" src="javascript:void(0);" scrolling="no" frameborder="0" style="position:absolute; display:none;"></iframe>
                                <div id="CompanyResults" class="ajaxSearchResults"></div>

                                <?php if ($this->defaultCompanyID !== false): ?>
                                    <input type="radio" name="typeCompany" id="defaultCompany" onchange="if(document.getElementById('companyName').disabled == false && document.getElementById('companyID').value > 0) {oldCompanyID = document.getElementById('companyID').value; } else if(document.getElementById('companyName').disabled == false) { oldCompanyID = 0; } document.getElementById('companyName').disabled = true; document.getElementById('companyID').value = '<?php echo($this->defaultCompanyID); ?>'; ">&nbsp;Contabilización Interna<br />
                                <?php endif; ?>

                                <script type="text/javascript">oldCompanyID = -1; watchCompanyIDChangeJO('<?php echo($this->sessionCookie); ?>');</script>
                            </td>

                            <td class="tdVertical">
                                <label id="durationLabel" for="duration">Duración:</label>
                            </td>
                            <td class="tdData">
                                <input type="text" tabindex="11" class="inputbox" id="duration" name="duration" style="width: 150px;" <?php if(isset($this->jobOrderSourceRS['duration'])): ?>value="<?php $this->_($this->jobOrderSourceRS['duration']); ?>"<?php endif; ?> />
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="departmentLabel" for="department">Departamento:</label>
                            </td>
                            <td class="tdData">
                                <select id="departmentSelect" name="department" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Departments', 'departmentSelect', 'departmentsCSV', false); this.value = '(none)'; } if (this.value == 'nullline') { this.value = '(none)'; }">
                                        <option value="(none)" selected="selected">Ninguno</option>
                                </select>
                                <input type="hidden" id="departmentsCSV" name="departmentsCSV" value="<?php if ($this->selectedCompanyID !== false): $this->_($this->selectedDepartmentsString); endif; ?>" />
                                <?php if ($this->selectedCompanyID !== false): ?>
                                    <script type="text/javascript">listEditorUpdateSelectFromCSV('departmentSelect', 'departmentsCSV', true, false);</script>
                                <?php endif; ?>
                            </td>

                            <td class="tdVertical">
                                <label id="maxRateLabel" for="maxRate">Tarifa Máxima:</label>
                            </td>
                            <td class="tdData">
                                <input type="text" tabindex="12" class="inputbox" id="maxRate" name="maxRate" style="width: 150px;" <?php if(isset($this->jobOrderSourceRS['maxRate'])): ?>value="<?php $this->_($this->jobOrderSourceRS['maxRate']); ?>"<?php endif; ?>/>
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="contactIDLabel" for="contactID">Contacto:</label>
                            </td>
                            <td class="tdData">
                                <select tabindex="3" id="contactID" name="contactID" class="inputbox" style="width: 150px;">
                                    <option value="-1">Ninguno</option>

                                    <?php if ($this->selectedCompanyID !== false): ?>
                                        <?php foreach ($this->selectedCompanyContacts as $rowNumber => $contactsData): ?>
                                            <option value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </select>&nbsp;
                                <img src="images/indicator2.gif" id="contactsIndicator" alt="" style="visibility: hidden; margin-left: 5px;" height="16" width="16" />
                            </td>

                            <td class="tdVertical">
                                <label id="typeLabel" for="type">Tipo:</label>
                            </td>
                            <td class="tdData">
                                <select tabindex="7" id="type" name="type" class="inputbox" style="width: 150px;">
                                <?php foreach($this->jobTypes as $jobTypeShort => $jobTypeLong): ?>
                                    <option value="<?php echo $jobTypeShort ?>" 
                                            <?php if(isset($this->jobOrderSourceRS['type']) && $this->jobOrderSourceRS['type'] == $jobTypeShort) echo('selected'); ?>>
                                            <?php echo $jobTypeShort." (".$jobTypeLong.")";?>
                                    </option>
                                <?php endforeach; ?>
                                <?php if(count($this->jobTypes) < 1): ?>
                                    <option value="N/A" selected>N/A (No Aplica)</option>
                                <?php endif; ?>
                                </select>&nbsp;*
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="cityLabel" for="city">Ciudad:</label>
                            </td>
                            <td class="tdData">
                                <?php if ($this->selectedCompanyID !== false): ?>
                                    <input type="text" tabindex="4" class="inputbox" id="city" name="city" value="<?php $this->_($this->selectedCompanyLocation['city']); ?>" style="width: 150px;" />&nbsp;*
                                <?php else: ?>
                                    <input type="text" tabindex="4" class="inputbox" id="city" name="city" style="width: 150px;" />&nbsp;*
                                <?php endif; ?>
                            </td>

                            <td class="tdVertical">
                                <label id="salaryLabel" for="salary">Salario:</label>
                            </td>
                            <td class="tdData">
                                <input type="text" tabindex="13" class="inputbox" id="salary" name="salary" style="width: 150px;" <?php if(isset($this->jobOrderSourceRS['salary'])): ?>value="<?php $this->_($this->jobOrderSourceRS['salary']); ?>"<?php endif; ?>/>
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="stateLabel" for="state">Provincia:</label>
                            </td>
                            <td class="tdData">
                                <?php if ($this->selectedCompanyID !== false): ?>
                                    <input type="text" tabindex="5" class="inputbox" id="state" name="state" value="<?php $this->_($this->selectedCompanyLocation['state']); ?>" style="width: 150px;" />&nbsp;*
                                <?php else: ?>
                                    <input type="text" tabindex="5" class="inputbox" id="state" name="state" style="width: 150px;" />&nbsp;*
                                <?php endif; ?>
                            </td>

                            <td class="tdVertical">
                                <label id="openingsLabel" for="openings">Vacantes:</label>
                            </td>
                            <td class="tdData">
                                <input type="text" tabindex="14" class="inputbox" id="openings" name="openings" style="width: 150px;" <?php if(isset($this->jobOrderSourceRS['openings'])): ?>value="<?php $this->_($this->jobOrderSourceRS['openings']); ?>"<?php else: ?>value="1"<?php endif; ?>/>&nbsp;*
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="recruiterLabel" for="recruiter">Reclutador:</label>
                            </td>
                            <td class="tdData">
                                <select tabindex="6" id="recruiter" name="recruiter" class="inputbox" style="width: 150px;">
                                    <option value="">(Seleccionar un Usuario)</option>

                                    <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                        <?php if ($usersData['userID'] == $this->userID): ?>
                                            <option selected value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>&nbsp;*
                            </td>

                            <td class="tdVertical">
                                <label id="companyJobIDLabel" for="companyJobID">ID de Trabajo de la Empresa:</label>
                            </td>
                            <td class="tdData">
                                <input type="text" tabindex="15" class="inputbox" id="companyJobID" name="companyJobID" style="width: 150px;" />
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="ownerLabel" for="owner">Dueño:</label>
                            </td>
                            <td class="tdData">
                                <select tabindex="6" id="owner" name="owner" class="inputbox" style="width: 150px;">
                                    <option value="">(Seleccionar un Usuario)</option>

                                    <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                        <?php if ($usersData['userID'] == $this->userID): ?>
                                            <option selected value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php else: ?>
                                            <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>&nbsp;*
                            </td>

                            <td class="tdVertical">
                                <label id="isHotLabel" for="isHot">Aspirante:</label>
                            </td>
                            <td class="tdData">
                                <input type="checkbox" tabindex="16" id="isHot" name="isHot" />&nbsp;
                                <img title="Marcar esta casilla indica que la orden de trabajo está 'activa' y aparece resaltada en todo el sistema." src="images/information.gif" alt="" width="16" height="16" />
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">

                            </td>
                            <td class="tdData">

                            </td>

                            <td class="tdVertical">
                                <label id="publicLabel" for="public">Pública:</label>
                            </td>
                            <td class="tdData">
                                <input type="checkbox" tabindex="17" id="public" name="public" onchange="checkPublic(this);" onclick="checkPublic(this);" onkeydown="checkPublic(this);" />&nbsp;
                                <img title="Marcar esta casilla indica que la orden de trabajo es pública. Las órdenes de trabajo marcadas como públicas podrán ser vistas por usuarios anónimos." src="images/information.gif" alt="" width="16" height="16" />
                            </td>
                        </tr>
                    </table>

                    <table class="editTable" width="700">

                        <?php for ($i = 0; $i < count($this->extraFieldRS); $i++): ?>
                            <tr>
                                <td class="tdVertical" id="extraFieldTd<?php echo($i); ?>">
                                    <label id="extraFieldLbl<?php echo($i); ?>">
                                        <?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:
                                    </label>
                                </td>
                                <td class="tdData" id="extraFieldData<?php echo($i); ?>">
                                    <?php echo($this->extraFieldRS[$i]['addHTML']); ?>
                                </td>
                            </tr>
                        <?php endfor; ?>

                        <tr>
                            <td class="tdVertical">
                                <label id="descriptionLabel" for="description">Descripción:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="18" class="ckEditor" name="description" id="description" rows="15" style="width: 500px;"><?php if(isset($this->jobOrderSourceRS['description'])): ?><?php $this->_($this->jobOrderSourceRS['description']); ?><?php endif; ?></textarea>
                            </td>
                        </tr>

                        <tr>
                            <td class="tdVertical">
                                <label id="notesLabel" for="notes">Notas:</label>
                            </td>
                            <td class="tdData">
                                <textarea tabindex="19" class="ckEditor" name="notes" id="notes" rows="5" style="width: 500px;"><?php if(isset($this->jobOrderSourceRS['notes'])): ?><?php $this->_($this->jobOrderSourceRS['notes']); ?><?php endif; ?></textarea>
                            </td>
                        </tr>

                        <tr id="displayQuestionnaires" style="display: none;">
                            <?php if ($this->careerPortalEnabled): ?>
                            <td class="tdVertical">
                                <label id="notesLabel" for="notes">Cuestionario:</label>
                            </td>
                            <td class="tdData">
                                <select id="questionnaire" name="questionnaire" class="inputbox" style="width: 500px;">
                                <option value="none" selected>Ninguna</option>
                                <?php foreach ($this->questionnaires as $questionnaire): ?>
                                    <option value="<?php echo $questionnaire['questionnaireID']; ?>"><?php echo $questionnaire['title']; ?></option>
                                <?php endforeach; ?>
                                </select>
                                <?php if ($this->getUserAccessLevel('settings.careerPortalSettings') >= ACCESS_LEVEL_SA): ?>
                                <br />
                                <a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalSettings" target="_blank">Añadir / Editar / Borrar Cuestionarios</a>
                                <?php endif; ?>
                            </td>
                            <?php endif; ?>
                        </tr>
                    </table>
                    <input type="submit" tabindex="20" class="button" name="submit" value="Agregar Orden de Trabajo" />&nbsp;
                    <input type="reset"  tabindex="21" class="button" name="reset"  value="Borrar" />&nbsp;
                    <input type="button" tabindex="22" class="button" name="back"   value="Volver a Órdenes de Trabajo" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=listByView');" />
                </form>
                
                <script type="text/javascript">
                    placeCkEditorIn('description');
                </script>

                <script type="text/javascript">
                    document.addJobOrderForm.title.focus();
                    <?php if (isset($this->jobOrderSourceRS['companyID'])): ?>updateCompanyData('<?php echo($this->sessionCookie); ?>');<?php endif; ?>
                </script>

            <?php endif; ?>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
