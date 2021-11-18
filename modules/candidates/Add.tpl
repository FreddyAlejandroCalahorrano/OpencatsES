<?php /* $Id: Add.tpl 3746 2007-11-28 20:28:21Z andrew $ */ ?>
<?php if ($this->isModal): ?>
    <?php TemplateUtility::printModalHeader('Candidates', array('modules/candidates/validator.js', 'js/addressParser.js', 'js/listEditor.js',  'js/candidate.js', 'js/candidateParser.js'), 'Add New Candidate to this Job Order'); ?>
<?php else: ?>
    <?php TemplateUtility::printHeader('Candidates', array('modules/candidates/validator.js', 'js/addressParser.js', 'js/listEditor.js',  'js/candidate.js', 'js/candidateParser.js')); ?>
    <?php TemplateUtility::printHeaderBlock(); ?>
    <?php TemplateUtility::printTabs($this->active, $this->subActive); ?>

    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">

            <table>
                <tr>
                    <td width="3%">
                        <img src="images/candidate.gif" width="24" height="24" alt="Candidates" style="border: none; margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Candidatos: Añadir Candidato</h2></td>
                </tr>
            </table>

<?php endif; ?>

            <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>">Información Básica</p>

            <table style="font-weight:bold; border: 1px solid #000; background-color: #ffed1a; padding:5px; display:none; margin-bottom:7px;" width="100%" id="candidateAlreadyInSystemTable">
                <tr>
                    <td class="tdVertical">
                        Es posible que este perfil ya esté en el sistema.&nbsp;&nbsp;Posible perfil de candidato duplicado:&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="window.open('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;candidateID='+candidateIsAlreadyInSystemID);">
                            <img src="images/new_window.gif" border="0" />
                            <img src="images/candidate_small.gif" border="0" />
                            <span id="candidateAlreadyInSystemName"></span>
                        </a>
                    </td>
                </tr>
            </table>

            <?php if ($this->isModal): ?>
                <?php $URI = CATSUtility::getIndexName() . '?m=joborders&amp;a=addCandidateModal&jobOrderID=' . $this->jobOrderID; ?>
            <?php else: ?>
                <?php $URI = CATSUtility::getIndexName() . '?m=candidates&amp;a=add'; ?>
            <?php endif; ?>

            <form name="addCandidateForm" id="addCandidateForm" enctype="multipart/form-data" action="<?php echo($URI); ?>" method="post" onsubmit="return (checkAddForm(document.addCandidateForm) && onSubmitEmailInSystem() && onSubmitPhoneInSystem());" autocomplete="off" enctype="multipart/form-data">
                <?php if ($this->isModal): ?>
                    <input type="hidden" name="jobOrderID" id="jobOrderID" value="<?php echo($this->jobOrderID); ?>" />
                <?php endif; ?>
                <input type="hidden" name="postback" id="postback" value="postback" />

                <table class="editTable">
                    <?php if ($this->isParsingEnabled): ?>
                    <tr>
                        <td class="tdVertical" colspan="2">
                            <img src="images/parser/manual-es.png" border="0" />
                        </td>
                        <td class="tdVertical">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td align="left"><img src="images/parser/import-es.png" border="0" /></td>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <?php endif; ?>
                    <tr>
                        <td class="tdVertical">
                            <label id="firstNameLabel" for="firstName">Primer Nombre:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="1" name="firstName" id="firstName" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['firstName'])) $this->_($this->preassignedFields['firstName']); ?>" />&nbsp;*
                        </td>

                        <td rowspan="12" align="center" valign="top">
                            <?php if ($this->isParsingEnabled): ?>
                                <input type="hidden" name="loadDocument" id="loadDocument" value="" />
                                <input type="hidden" name="parseDocument" id="parseDocument" value="" />
                                <input type="hidden" name="documentTempFile" id="documentTempFile" value="<?php echo (isset($this->preassignedFields['documentTempFile']) ? $this->preassignedFields['documentTempFile'] : ''); ?>" />
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td valign="middle" align="right" colspan="2">
                                            <img src="images/parser/arrow.gif" border="0" />
                                            <input type="hidden" name="MAX_FILE_SIZE" VALUE="10000000" />
                                            <input type="file" id="documentFile" name="documentFile" onchange="documentFileChange();" size="<?php if ($this->isModal): ?>20<?php else: ?>40<?php endif; ?>" />
                                            <input type="button" id="documentLoad" value="Subir" onclick="loadDocumentFileContents();" disabled />
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left" colspan="2">
                                            <?php if (isset($this->preassignedFields['documentTempFile']) && ($tempFile = $this->preassignedFields['documentTempFile']) != ''): ?>
                                            <div id="showAttachmentDetails" style="height: 20px; background-color: #e0e0e0; width: 500px; margin: 1px 0 5px 0; padding: 0 3px 0 5px;">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left" valign="top" nowrap="nowrap" style="font-size: 11px;">
                                                            <img src="images/parser/attachment.gif" border="0" style="padding-top: 3px;" />
                                                            Attachment: <span style="font-weight: bold;"><?php echo $tempFile; ?></span>
                                                        </td>
                                                        <td align="right" valign="top" nowrap="nowrap" style="font-size: 11px;">
                                                            <a href="javascript:void(0);" onclick="removeDocumentFile();">(remover)</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <?php endif; ?>
                                            <textarea class="inputbox" tabindex="90" name="documentText" id="documentText" rows="5" cols="40" onmousemove="documentCheck();" onchange="documentCheck();" onmousedown="documentCheck();" onkeypress="documentCheck();" style="width: <?php if ($this->isModal): ?>320<?php else: ?>500<?php endif; ?>px; height: 210px; padding: 3px;"><?php echo $this->contents; ?></textarea>
                                            <br/>
                                            <div style="color: #666666; text-align: center;">
                                            (<b>Pista:</b> también puede pegar el contenido del currículum.)
                                            <br /><br />
                                                ¿Necesitas subir varios currículums? <a href="<?php echo CATSUtility::getIndexName(); ?>?m=import&a=massImport">¡Haga clic aquí!</a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            <?php else: ?>
                                <?php if (PARSING_ENABLED &&
                                    count($this->parsingStatus) &&
                                    $this->parsingStatus['parseUsed'] >= $this->parsingStatus['parseLimit'] &&
                                    $this->parsingStatus['parseLimit'] >= 0): ?>
                                <a href="http://www.catsone.com/professional" target="_blank">All daily resume imports used. For more, upgrade to CATS professional</a>.
                                <?php endif; ?>
                                <?php $freeformTop = '<p class="freeformtop">Cut and paste freeform address here.</p>'; ?>
                                <?php eval(Hooks::get('CANDIDATE_TEMPLATE_ABOVE_FREEFORM')); ?>
                                <?php echo($freeformTop); ?>

                                <textarea class="inputbox" tabindex="90" name="addressBlock" id="addressBlock" rows="5" cols="40" style="width: 500px; height: 250px;"></textarea>

                                <?php $freeformBottom = '<p class="freeformbottom">Cut and paste freeform address here.</p>'; ?>
                                <?php eval(Hooks::get('CANDIDATE_TEMPLATE_BELOW_FREEFORM')); ?>
                                <?php echo($freeformBottom); ?>
                            <?php endif; ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="middleNameLabel" for="middleName">Segundo Nombre:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="2" name="middleName" id="middleName" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['middleName'])) $this->_($this->preassignedFields['middleName']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="lastNameLabel" for="lastName">Apellido:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="2" name="lastName" id="lastName" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['lastName'])) $this->_($this->preassignedFields['lastName']); ?>" />&nbsp;*
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="emailLabel" for="email1">Correo Electrónico:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="3" name="email1" id="email1" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['email'])) $this->_($this->preassignedFields['email']); elseif (isset($this->preassignedFields['email1'])) $this->_($this->preassignedFields['email1']); ?>" onchange="checkEmailAlreadyInSystem(this.value);" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="email2Label" for="email2">2do C Electrónico:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="4" name="email2" id="email2" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['email2'])) $this->_($this->preassignedFields['email2']); ?>" onchange="checkEmailAlreadyInSystem(this.value);" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="webSiteLabel" for="webSite">Sitio Web:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="5" name="webSite" id="webSite" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['webSite'])) $this->_($this->preassignedFields['webSite']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneHomeLabel" for="phoneHome">Teléfono de Casa:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="6" name="phoneHome" id="phoneHome" class="inputbox" style="width: 150px;" value="<?php if (isset($this->preassignedFields['phoneHome'])) $this->_($this->preassignedFields['phoneHome']); ?>" onchange="checkPhoneAlreadyInSystem(this.value);"  />
                            <?php if ($this->isParsingEnabled): ?>
                                <?php if ($this->parsingStatus['parseLimit'] >= 0 && $this->parsingStatus['parseUsed'] >= $this->parsingStatus['parseLimit']): ?>
                                    &nbsp;
                                <?php else: ?>
                                    <?php if ($this->isModal): ?>&nbsp;&nbsp;<?php else: ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php endif; ?>
                                    <img id="transfer" src="images/parser/transfer<?php echo ($this->contents != '' ? '' : '_grey'); ?>.gif" <?php echo ($this->contents != '' ? 'style="cursor: pointer;"' : ''); ?> border="0" alt="Import Resume" onclick="parseDocumentFileContents();" />
                                <?php endif; ?>
                            <?php else: ?>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="arrowButton" tabindex="91" align="middle" type="button" value="&lt;--" class="arrowbutton" onclick="AddressParser_parse('addressBlock', 'person', 'addressParserIndicator', 'arrowButton'); document.addCandidateForm.firstName.focus();" />
                            <?php endif; ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneCellLabel" for="phoneCell">Teléfono Celular:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="7" name="phoneCell" id="phoneCell" class="inputbox" style="width: 150px;" value="<?php if (isset($this->preassignedFields['phoneCell'])) $this->_($this->preassignedFields['phoneCell']); ?>" onchange="checkPhoneAlreadyInSystem(this.value);" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="phoneWorkLabel" for="phoneWork">Teléfono del Trabajo:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="8" name="phoneWork" id="phoneWork" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['phoneWork'])) $this->_($this->preassignedFields['phoneWork']); ?>" onchange="checkPhoneAlreadyInSystem(this.value);" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="addressLabel" for="address">Dirección:</label>
                        </td>
                        <td class="tdData">
                            <textarea tabindex="9" name="address" id="address" rows="2" cols="40" class="inputbox" style="width: 150px"><?php if(isset($this->preassignedFields['address'])) $this->_($this->preassignedFields['address']); if(isset($this->preassignedFields['address2'])) $this->_("\n" . $this->preassignedFields['address2']); ?></textarea>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/indicator2.gif" id="addressParserIndicator" alt="" style="visibility: hidden; margin-left: 10px;" height="16" width="16" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="cityLabel" for="city">Ciudad:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="11" name="city" id="city" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['city'])) $this->_($this->preassignedFields['city']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="stateLabel" for="state">Provincia:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="12" name="state" id="state" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['state'])) $this->_($this->preassignedFields['state']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="zipLabel" for="zip">Código Postal:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="13" name="zip" id="zip" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['zip'])) $this->_($this->preassignedFields['zip']); ?>" />&nbsp;
                            <input type="button" tabindex="92" onclick="CityState_populate('zip', 'ajaxIndicator');" value="Buscar" />
                            <img src="images/indicator2.gif" alt="AJAX" id="ajaxIndicator" style="vertical-align: middle; visibility: hidden; margin-left: 5px;" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="stateLabel" for="state">Hora para Llamar:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="13" name="bestTimeToCall" id="bestTimeToCall" class="inputbox" style="width: 150px" value="<?php if(isset($this->preassignedFields['bestTimeToCall'])) $this->_($this->preassignedFields['bestTimeToCall']); ?>" />
                        </td>
                    </tr>

                    <?php $tabIndex = 15; ?>
                </table>

                <?php if (!$this->isParsingEnabled || $this->associatedAttachment != 0): ?>
                <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>" style="margin-top: 5px;">Resumen</p>

                <table class="editTable">
                    <tr>
                        <td class="tdVertical">Resumen:</td>
                        <td class="tdData" style="width:320px;">
                            <?php if ($this->associatedAttachment == 0): ?>
                                <nobr> <?php /* FIXME:  remove nobr stuff */ ?>
                                    <?php if (isset($this->overAttachmentQuota)): ?>
                                        <span style="font-size:10px;">(You have already reached your limit of <?php echo(FREE_ACCOUNT_SIZE/1024); ?> MB of attachments, and cannot add additional file attachments without upgrading to CATS Professional Hosted.)<br /></font>Copy and Paste Resume:&nbsp;
                                    <?php else: ?>
                                        <input type="file" id="file" name="file" size="21" tabindex="<?php echo($tabIndex++); ?>" <?php if($this->associatedTextResume !== false): ?>disabled<?php endif; ?> /> &nbsp;
                                    <?php endif; ?>
                                    <a href="javascript:void(0);" onclick="if (document.getElementById('textResumeTD').style.display != '') { document.getElementById('textResumeTD').style.display = ''; document.getElementById('file').disabled=true; } else { document.getElementById('textResumeTD').style.display='none'; document.getElementById('file').disabled = false; }">
                                        <img src="images/package_editors.gif" style="margin:0px; padding:0px;"  class="absmiddle" alt="" border="0" title="Copy / Paste Resume" />
                                    </a>
                                </nobr>
                             <?php else: ?>
                                <a href="<?php echo $this->associatedAttachmentRS['retrievalURL']; ?>">
                                    <img src="<?php $this->_($this->associatedAttachmentRS['attachmentIcon']) ?>" alt="" width="16" height="16" style="border: none;" />
                                </a>
                                <a href="<?php echo $this->associatedAttachmentRS['retrievalURL']; ?>">
                                    <?php $this->_($this->associatedAttachmentRS['originalFilename']) ?>
                                </a>
                                <?php echo($this->associatedAttachmentRS['previewLink']); ?>
                                <input type="hidden" name="associatedAttachment" value="<?php echo($this->associatedAttachment); ?>" />
                            <?php endif; ?>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left" valign="top">
                            <input type="hidden" name="textResumeFilename" value="<?php if(isset($this->preassignedFields['textResumeFilename'])) $this->_($this->preassignedFields['textResumeFilename']); else echo('resume.txt'); ?>" />
                            <div id="textResumeTD" <?php if($this->associatedTextResume === false): ?>style="display:none;"<?php endif; ?>>
                                <p class="freeformtop" style="width: 700px;">Cut and paste resume text here.</p>

                                &nbsp;<textarea class="inputbox" tabindex="90" name="textResumeBlock" id="textResumeBlock" rows="5" cols="60" style="width: 700px; height: 300px;"><?php if ($this->associatedTextResume !== false) $this->_($this->associatedTextResume); ?></textarea>

                                <p class="freeformtop" style="width: 700px;">Cut and paste resume text here.</p>
                            </div>
                        </td>
                    </tr>
                </table>
                <?php else: ?>
                <br />
                <?php endif; ?>

                <?php if($this->EEOSettingsRS['enabled'] == 1): ?>
                    <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>" style="margin-top: 5px;">Información EEO</p>
                    <table class="editTable">
                         <?php if ($this->EEOSettingsRS['genderTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Género:</label>
                                </td>
                                <td class="tdData">
                                    <select id="gender" name="gender" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="M"<?php if (isset($this->preassignedFields['gender']) && $this->preassignedFields['gender'] == 'M') echo ' selected'; ?>>Masculino</option>
                                        <option value="F"<?php if (isset($this->preassignedFields['gender']) && $this->preassignedFields['gender'] == 'F') echo ' selected'; ?>>Femenino</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                         <?php if ($this->EEOSettingsRS['ethnicTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Etnia:</label>
                                </td>
                                <td class="tdData">
                                    <select id="race" name="race" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="1"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '1') echo ' selected'; ?>>Indio Americano</option>
                                        <option value="2"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '2') echo ' selected'; ?>>Isleño Asiático o del Pacífico</option>
                                        <option value="3"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '3') echo ' selected'; ?>>Hispano o Latino</option>
                                        <option value="4"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '4') echo ' selected'; ?>>Negro no Hispano</option>
                                        <option value="5"<?php if (isset($this->preassignedFields['race']) && $this->preassignedFields['race'] == '5') echo ' selected'; ?>>Blanco no Hispano</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                         <?php if ($this->EEOSettingsRS['veteranTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Estado de Veterano:</label>
                                </td>
                                <td class="tdData">
                                    <select id="veteran" name="veteran" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="1"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '1') echo ' selected'; ?>>No</option>
                                        <option value="2"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '2') echo ' selected'; ?>>Veterano Elegible</option>
                                        <option valie="3"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '3') echo ' selected'; ?>>Veterano Discapacitado</option>
                                        <option value="4"<?php if (isset($this->preassignedFields['veteran']) && $this->preassignedFields['veteran'] == '4') echo ' selected'; ?>>Elegible y discapacitado</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                         <?php if ($this->EEOSettingsRS['disabilityTracking'] == 1): ?>
                             <tr>
                                <td class="tdVertical">
                                    <label id="canRelocateLabel" for="canRelocate">Estado de Discapacidad:</label>
                                </td>
                                <td class="tdData">
                                    <select id="disability" name="disability" class="inputbox" style="width:200px;" tabindex="<?php echo($tabIndex++); ?>">
                                        <option selected="selected" value="">----</option>
                                        <option value="No"<?php if (isset($this->preassignedFields['disability']) && $this->preassignedFields['disability'] == 'No') echo ' selected'; ?>>No</option>
                                        <option value="Yes"<?php if (isset($this->preassignedFields['disability']) && $this->preassignedFields['disability'] == 'Yes') echo ' selected'; ?>>Si</option>
                                    </select>
                                </td>
                             </tr>
                         <?php endif; ?>
                    </table>
                    <br />
                <?php endif; ?>

                <p class="note<?php if ($this->isModal): ?>Unsized<?php endif; ?>" style="margin-top: 5px;">Otro</p>
                <table class="editTable">

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
                            <label id="canRelocateLabel" for="canRelocate">Puede Reubicarse:</label>
                        </td>
                        <td class="tdData">
                            <input type="checkbox" tabindex="<?php echo($tabIndex++); ?>" id="canRelocate" name="canRelocate" value="1"<?php if (isset($this->preassignedFields['canRelocate']) && $this->preassignedFields['canRelocate'] == '1') echo ' checked'; ?> />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="dateAvailableLabel" for="dateAvailable">Fecha de Disponibilidad:</label>
                        </td>
                        <td class="tdData">
                            <script type="text/javascript">DateInput('dateAvailable', false, 'MM-DD-YY', '', <?php echo($tabIndex++); ?>);</script>

                            <?php /* DateInput()s take up 3 tabindexes. */ ?>
                            <?php $tabIndex += 2; ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="currentEmployerLabel" for="currentEmployer">Empleador actual:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="<?php echo($tabIndex++); ?>" name="currentEmployer" id="currentEmployer" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['currentEmployer'])) $this->_($this->preassignedFields['currentEmployer']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="currentPayLabel" for="currentEmployer">Pago Actual:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="<?php echo($tabIndex++); ?>" name="currentPay" id="currentPay" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['currentPay'])) $this->_($this->preassignedFields['currentPay']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="desiredPayLabel" for="currentEmployer">Pago Deseado:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" tabindex="<?php echo($tabIndex++); ?>" name="desiredPay" id="desiredPay" class="inputbox" style="width: 150px" value="<?php if (isset($this->preassignedFields['desiredPay'])) $this->_($this->preassignedFields['desiredPay']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="sourceLabel" for="sourceSelect">Fuente:</label>
                        </td>
                        <td class="tdData">
<?php if ($this->isModal): ?>
                            <select id="sourceSelect" tabindex="<?php echo($tabIndex++); ?>" name="source" class="inputbox" style="width: 150px;">
<?php else: ?>
                            <select id="sourceSelect" tabindex="<?php echo($tabIndex++); ?>" name="source" class="inputbox" style="width: 150px;" onchange="if (this.value == 'edit') { listEditor('Sources', 'sourceSelect', 'sourceCSV', false); this.value = '(none)'; } if (this.value == 'nullline') { this.value = '(none)'; }">
                                <option value="edit">(Editar Fuentes)</option>
                                <option value="nullline">-------------------------------</option>
<?php endif; ?>
                                    <option value="(none)" <?php if (!isset($this->preassignedFields['source'])): ?>selected="selected"<?php endif; ?>>(Ninguna)</option>
                                    <?php if (isset($this->preassignedFields['source'])): ?>
                                        <option value="<?php $this->_($this->_($this->preassignedFields['source'])); ?>" selected="selected"><?php $this->_($this->_($this->preassignedFields['source'])); ?></option>
                                    <?php endif; ?>
                                <?php foreach ($this->sourcesRS AS $index => $source): ?>
                                    <option value="<?php $this->_($source['name']); ?>"><?php $this->_($source['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <input type="hidden" id="sourceCSV" name="sourceCSV" value="<?php $this->_($this->sourcesString); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="keySkillsLabel" for="keySkills">Habilidades:</label>
                        </td>
                        <td class="tdData">
                            <input type="text" class="inputbox" tabindex="<?php echo($tabIndex++); ?>" name="keySkills" id="keySkills" style="width: 400px;" value="<?php if (isset($this->preassignedFields['keySkills'])) $this->_($this->preassignedFields['keySkills']); ?>" />
                        </td>
                    </tr>

                    <tr>
                        <td class="tdVertical">
                            <label id="notesLabel" for="notes">Notas:</label>
                        </td>
                        <td class="tdData">
                            <textarea class="inputbox" tabindex="<?php echo($tabIndex++); ?>" name="notes" id="notes" rows="5" cols="40" style="width: 400px;"><?php if (isset($this->preassignedFields['notes'])) $this->_($this->preassignedFields['notes']); ?></textarea>
                        </td>
                    </tr>
                </table>

                <input type="submit" tabindex="<?php echo($tabIndex++); ?>" class="button" value="Agregar candidato" />&nbsp;
                <input type="reset"  tabindex="<?php echo($tabIndex++); ?>" class="button" value="Borrar" />&nbsp;
                <?php if ($this->isModal): ?>
                    <input type="button" tabindex="<?php echo($tabIndex++); ?>" class="button" value="Volver a la Búsqueda" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=considerCandidateSearch&amp;jobOrderID=<?php echo($this->jobOrderID); ?>');" />
                <?php else: ?>
                    <input type="button" tabindex="<?php echo($tabIndex++); ?>" class="button" value="Volver a los Candidatos" onclick="javascript:goToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates');" />
                <?php endif; ?>
            </form>

<script type="text/javascript">
    document.addCandidateForm.firstName.focus();
    <?php if(isset($this->preassignedFields['email']) || isset($this->preassignedFields['email1'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['email'])) echo(urlencode($this->preassignedFields['email'])); else if(isset($this->preassignedFields['email1'])) echo(urlencode($this->preassignedFields['email1'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['email2']) || isset($this->preassignedFields['email2'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['email2'])) echo(urlencode($this->preassignedFields['email2'])); else if(isset($this->preassignedFields['email2'])) echo(urlencode($this->preassignedFields['email2'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['phoneCell']) || isset($this->preassignedFields['phoneCell'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['phoneCell'])) echo(urlencode($this->preassignedFields['phoneCell'])); else if(isset($this->preassignedFields['phoneCell'])) echo(urlencode($this->preassignedFields['phoneCell'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['phoneWork']) || isset($this->preassignedFields['phoneWork'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['phoneWork'])) echo(urlencode($this->preassignedFields['phoneWork'])); else if(isset($this->preassignedFields['phoneWork'])) echo(urlencode($this->preassignedFields['phoneWork'])); ?>"));
    <?php endif; ?>
    <?php if(isset($this->preassignedFields['phoneHome']) || isset($this->preassignedFields['phoneHome'])): ?>
        checkEmailAlreadyInSystem(urlDecode("<?php if(isset($this->preassignedFields['phoneHome'])) echo(urlencode($this->preassignedFields['phoneHome'])); else if(isset($this->preassignedFields['phoneHome'])) echo(urlencode($this->preassignedFields['phoneHome'])); ?>"));
    <?php endif; ?>
</script>

<?php if ($this->isModal): ?>
    </body>
</html>
<?php else: ?>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
<?php endif; ?>
