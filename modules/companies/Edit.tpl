<?php /* $Id: Edit.tpl 3093 2007-09-24 21:09:45Z brian $ */ ?>
<?php TemplateUtility::printHeader('Companies', array('modules/companies/validator.js', 'js/sweetTitles.js', 'js/listEditor.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/companies.gif" width="24" height="24" border="0" alt="Companies" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Empresas: Editar Empresa</h2></td>
               </tr>
            </table>

            <form name="editCompanyForm" id="editCompanyForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=edit" method="post" onsubmit="return checkEditForm(document.editCompanyForm);" autocomplete="off">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="companyID" name="companyID" value="<?php echo($this->companyID); ?>" />

                <table width="100%">
                    <tr>
                        <td valign="top" width="50%" height="285">
                            <p class="noteUnsized">Información Básica</p>

                            <table class="editTable" width="100%" height="100%">
                                <tr>
                                    <td class="tdVertical">
                                        <label id="nameLabel" for="name">Nombre de la Empresa:</label>
                                    </td>
                                    <td class="tdData">
                                        <?php if ($this->data['defaultCompany'] != 1): ?>
                                            <input type="text" name="name" id="name" value="<?php $this->_($this->data['name']); ?>" class="inputbox" style="width: 150px;" />&nbsp;*
                                        <?php else: ?>
                                            <?php $this->_($this->data['name']); ?>
                                            <input type="hidden" name="name" id="name" value="<?php $this->_($this->data['name']); ?>" />
                                        <?php endif; ?>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="billingContactLabel" for="billingContact">Contacto de Facturación:</label>
                                    </td>
                                    <td class="tdData">
                                        <select tabindex="3" id="billingContact" name="billingContact" class="inputbox" style="width: 150px;">
                                            <option value="-1">Ninguno</option>

                                            <?php foreach ($this->contactsRS as $rowNumber => $contactsData): ?>
                                                <?php if ($this->data['billingContact'] == $contactsData['contactID']): ?>
                                                    <option selected="selected" value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>
                                                <?php else: ?>
                                                    <option value="<?php $this->_($contactsData['contactID']) ?>"><?php $this->_($contactsData['lastName']) ?>, <?php $this->_($contactsData['firstName']) ?></option>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="departmentsLabel" for="departmentsSelect">Departamentos:</label>
                                    </td>
                                    <td class="tdData">
                                        <select tabindex="3" id="departmentsSelect" name="departmentsSelect" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Departamentos', 'departmentsSelect', 'departmentsCSV'); } this.value = 'num';">
                                            <option value="edit">(Editar Departamentos)</option>
                                            <option value="num" selected="selected"><?php echo(count($this->departmentsRS)); ?> Departamentos</option>
                                            <option value="nullline">-------------------------------</option>
                                            <?php foreach ($this->departmentsRS AS $index => $department): ?>
                                                <option value="<?php $this->_($department['name']); ?>"><?php $this->_($department['name']); ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <input type="hidden" id="departmentsCSV" name="departmentsCSV" value="<?php $this->_($this->departmentsString); ?>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="urlLabel" for="url">Sitio Web:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="url" id="url" value="<?php $this->_($this->data['url']); ?>" class="inputbox" style="width: 150px" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="isHotLabel" for="isHot"></label>
                                    </td>
                                    <td class="tdData">
                                        <?php if ($this->data['isHot'] == 1): ?>
                                            <input type="checkbox" id="isHot" name="isHot" checked />
                                        <?php else: ?>
                                            <input type="checkbox" id="isHot" name="isHot" />
                                        <?php endif; ?>&nbsp;Empresa Aspirante
                                    </td>
                                </tr>

                                <?php /* These empty rows force the other rows to group at the top and align with the right-side table. */ ?>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td>&nbsp;</td></tr>
                            </table>
                        </td>

                        <td width="50%" valign="top" height="285">
                            <p class="noteUnsized">Información de Contacto</p>

                            <table class="editTable" width="100%" height="100%">
                                <tr>
                                    <td class="tdVertical">
                                        <label id="phone1Label" for="phone1">Teléfono Principal:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="phone1" id="phone1" value="<?php $this->_($this->data['phone1']); ?>" class="inputbox" style="width: 150px" onkeydown="document.getElementById('changeAddress').style.display='';" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="phone2Label" for="phone2">Teléfono Secundario:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="phone2" id="phone2" value="<?php $this->_($this->data['phone2']); ?>" class="inputbox" style="width: 150px" onkeydown="document.getElementById('changeAddress').style.display='';" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="faxNumberLabel" for="faxNumber">Número de Fax:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="faxNumber" id="faxNumber" value="<?php $this->_($this->data['faxNumber']); ?>" class="inputbox" style="width: 150px" onkeydown="document.getElementById('changeAddress').style.display='';" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="addressLabel" for="address">Dirección:</label>
                                    </td>
                                    <td class="tdData">
                                        <textarea name="address" id="address" class="inputbox" style="width: 150px" onkeydown="document.getElementById('changeAddress').style.display='';"/><?php $this->_($this->data['address']); ?></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="cityLabel" for="city">Ciudad:</label>
                                    </td>
                                    <td class="tdData"><input type="text" name="city" id="city" value="<?php $this->_($this->data['city']); ?>" class="inputbox" style="width: 150px" onkeydown="document.getElementById('changeAddress').style.display='';"/></td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="stateLabel" for="state">Provincia:</label>
                                    </td>
                                    <td class="tdData"><input type="text" name="state" id="state" value="<?php $this->_($this->data['state']); ?>" class="inputbox" style="width: 150px" onkeydown="document.getElementById('changeAddress').style.display='';"/></td>
                                </tr>

                                <tr>
                                    <td class="tdVertical">
                                        <label id="zipLabel" for="zip">Código Postal:</label>
                                    </td>
                                    <td class="tdData">
                                        <input type="text" name="zip" id="zip" value="<?php $this->_($this->data['zip']); ?>" class="inputbox" style="width: 150px" onkeydown="document.getElementById('changeAddress').style.display='';" />
                                        <input type="button" class="button" onclick="CityState_populate('zip', 'ajaxIndicator');" value="Buscar" />
                                        <img src="images/indicator2.gif" alt="AJAX" id="ajaxIndicator" style="vertical-align: middle; visibility: hidden; margin-left: 5px;" />
                                    </td>
                                </tr>

                                <tr id="changeAddress" style="display:none;">
                                    <td colspan="2" style="text-align:center;">
                                        ¿Editar la información de la dirección de todos los contactos para que coincida con la dirección de la empresa?<br />
                                        <select id="updateContacts" name="updateContacts" class="inputbox">
                                            <option value="yes">Sí, sincronizar direcciones.</option>
                                            <option value="no" selected="selected">No, no modifique las direcciones.</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <p class="noteUnsized">Otro</p>

                <table class="editTable" width="100%">
                    
                    <?php for ($i = 0; $i < count($this->extraFieldRS); $i++): ?>
                        <tr>
                            <td class="tdVertical" id="extraFieldTd<?php echo($i); ?>">
                                <label id="extraFieldLbl<?php echo($i); ?>">
                                    <?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:
                                </label>
                            </td>
                            <td class="tdData" id="extraFieldData<?php echo($i); ?>">
                                <?php echo($this->extraFieldRS[$i]['editHTML']); ?>
                            </td>
                        </tr>
                    <?php endfor; ?>
                    
                    <tr>
                        <td class="tdVertical">
                            <label id="ownerLabel" for="owner">Dueño:</label>
                        </td>
                        <td class="tdData">
                            <select id="owner" name="owner" class="inputbox" style="width: 150px;" <?php if (!$this->emailTemplateDisabled): ?>onchange="document.getElementById('divOwnershipChange').style.display=''; <?php if ($this->canEmail): ?>document.getElementById('checkboxOwnershipChange').checked=true;<?php endif; ?>"<?php endif; ?>>
                                <option value="-1">Ninguno</option>

                                <?php foreach ($this->usersRS as $rowNumber => $usersData): ?>
                                    <?php if ($this->data['owner'] == $usersData['userID']): ?>
                                        <option selected="selected" value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php else: ?>
                                        <option value="<?php $this->_($usersData['userID']) ?>"><?php $this->_($usersData['lastName']) ?>, <?php $this->_($usersData['firstName']) ?></option>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </select>&nbsp;*
                            <div style="display:none;" id="divOwnershipChange">
                                <input type="checkbox" name="ownershipChange" id="checkboxOwnershipChange" <?php if (!$this->canEmail): ?>disabled<?php endif; ?>> Enviar un correo electrónico al nuevo propietario del cambio.
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="keyTechnologiesLabel" for="keyTechnologies">Tecnologías Clave:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" id="keyTechnologies" name="keyTechnologies" value="<?php $this->_($this->data['keyTechnologies']); ?>" style="width: 400px" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="notesLabel" for="notes">Notas:</label>
                        </td>
                        <td>
                            <textarea class="inputbox" name="notes" id="notes" rows="5" cols="40" style="width: 400px;"><?php $this->_($this->data['notes']); ?></textarea>
                        </td>
                    </tr>
                </table>

                <input type="submit" class="button" name="submit" id="submit" value="Guardar" />&nbsp;
                <input type="reset"  class="button" name="reset"  id="reset"  value="Borrar" />&nbsp;
                <input type="button" class="button" name="back"   id="back"   value="Volver a Detalles" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=show&amp;companyID=<?php echo($this->companyID); ?>');" />
            </form>

            <script type="text/javascript">
                document.editCompanyForm.name.focus();
            </script>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
