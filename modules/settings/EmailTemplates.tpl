<?php /* $Id: EmailTemplates.tpl 1929 2007-02-22 06:18:30Z will $ */ ?>
<?php TemplateUtility::printHeader('Settings', array()); ?>
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
                    <td><h2>Administración: Plantillas de Correo Electrónico</h2></td>
                </tr>
            </table>

            <p class="note">Plantillas de Correo Electrónico</p>

            <script type="text/javascript">
                $(document).ready(function() { 
                    $("select option:last").attr("selected", "selected");
                    showLastTemplate();
                });
                function showTemplate(templateID)
                {
                    <?php foreach ($this->emailTemplatesRS as $data): ?>
                        document.getElementById('editTable<?php echo($data['emailTemplateID']); ?>').style.display = 'none';
                    <?php endforeach; ?>
                    document.getElementById('editTable' + templateID).style.display = '';
                }
                function showLastTemplate()
                {
                    <?php foreach ($this->emailTemplatesRS as $data): ?>
                        document.getElementById('editTable<?php echo($data['emailTemplateID']); ?>').style.display = 'none';
                    <?php endforeach; ?>
                    <?php $templateID = end($this->emailTemplatesRS)['emailTemplateID'];?>
                    document.getElementById('editTable' + <?php echo $templateID; ?>).style.display = '';
                }
                function insertAtCursor(myField, myValue)
                {
                    if (document.selection)
                    {
                        myField.focus();
                        sel = document.selection.createRange();
                        sel.text = myValue;
                    }
                    else if (myField.selectionStart || myField.selectionStart == 0)
                    {
                        var startPos = myField.selectionStart;
                        var endPos = myField.selectionEnd;
                        myField.value = myField.value.substring(0, startPos)
                            + myValue
                            + myField.value.substring(endPos, myField.value.length);
                    }
                    else
                    {
                        myField.value += myValue;
                    }
                }
                <?php function generateInsertAtCursorLink($data, $description, $value)
                {
                    echo('<input type="button" class="button" style="width:235px;" value="'.$description.'" onclick="insertAtCursor(document.getElementById(\'messageText'.$data['emailTemplateID'].'\'),  \''.$value.'\');"><br />');
                } ?>
                <?php function generateInsertAtCursorLinkConditional($data, $description, $value)
                {
                    if (strrpos($data['possibleVariables'], $value) !== false)
                    {
                        generateInsertAtCursorLink($data, $description, $value);
                    }
                } ?>
            </script>

            <table style="width:850px;" class="searchTable">
                <tr>
                    <td>
                        <input type="button" value="Agregar una Plantilla" onclick="window.location='index.php?m=settings&a=addEmailTemplate'">
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="width:210px;">
                                    <div style="font-weight:bold;">
                                        Plantilla:
                                    </div>
                                </td>
                                <td>
                                    <span id="selectorSpan">
                                        <select id="titleSelect" style="width:550px;" onclick="showTemplate(this.value);">
                                            <?php foreach ($this->emailTemplatesRS as $data): ?>
                                                <option value="<?php echo($data['emailTemplateID']); ?>"><?php echo($data['emailTemplateTitle']); ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </span>
                                    <?php foreach ($this->emailTemplatesRS as $data): ?>
                                        <span id="templateTitleSpan<?php echo($data['emailTemplateID']); ?>" style="display:none; border:1px solid #000000; background-color:#ffffff; padding:5px;">
                                            Edición: <?php echo($data['emailTemplateTitle']); ?>
                                        </span>
                                    <?php endforeach; ?>
                                    <!--&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="button" class="button" value="New">-->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>

                        <?php foreach ($this->emailTemplatesRS as $index => $data): ?>
                            <form action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=emailTemplates" method="post">
                                <input type="hidden" name="postback" value="postback" />
                                <input type="hidden" name="templateID"  value="<?php echo($data['emailTemplateID']); ?>" />
                                <table id="editTable<?php echo($data['emailTemplateID']); ?>" class="editTable" width="850" <?php if ($index != 0): ?>style="display:none;"<?php endif; ?>>
                                    <tr>
                                        <!--<td class="tdVertical" style="width:150px;">
                                            Email Tag:
                                        </td>
                                        <td class="tdData">
                                            <?php echo($data['emailTemplateTag']); ?>
                                        </td>-->
                                    </tr>
                                    <tr>
                                        <td class="tdVertical" style="width:150px;">
                                            Mensaje:
                                        </td>
                                        <td class="tdData">
                                            <table>
                                                <?php if(strpos($data['emailTemplateTag'], "CUSTOM") === 0): ?>
                                                <tr>
                                                    <td>
                                                        <input type="text" name="emailTemplateTitle" value="<?php echo($data['emailTemplateTitle']); ?>"/>
                                                        <input type="button" value="Eliminar Plantilla" onclick="window.location='index.php?m=settings&a=deleteEmailTemplate&id=<?php echo $data['emailTemplateID']?>'">
                                                    </td>
                                                </tr>
                                                <?php endif; ?>
                                                
                                                <tr style="vertical-align:top;">
                                                    <td>
                                                        <textarea class="inputbox" name="messageText" <?php if ($data['disabled'] == 1) echo('disabled'); ?> id="messageText<?php echo($data['emailTemplateID']); ?>" style="width:450px; height:280px;" onclick="document.getElementById('selectorSpan').style.display='none'; document.getElementById('templateTitleSpan<?php echo($data['emailTemplateID']); ?>').style.display='';" ><?php echo($this->_($data['text'])); ?></textarea>
                                                        <input type="hidden" name="messageTextOrigional" id="messageTextOrigional<?php echo($data['emailTemplateID']); ?>" value="<?php echo($this->_($data['text'])); ?>">
                                                        <br /><br />
                                                        <input type="checkbox" name="useThisTemplate" id="useThisTemplate<?php echo($data['emailTemplateID']); ?>" <?php if ($data['disabled'] == 0) echo('checked'); ?> onclick="if (this.checked) {document.getElementById('messageText<?php echo($data['emailTemplateID']); ?>').disabled=false;} else {document.getElementById('messageText<?php echo($data['emailTemplateID']); ?>').disabled=true;} document.getElementById('selectorSpan').style.display='none'; document.getElementById('templateTitleSpan<?php echo($data['emailTemplateID']); ?>').style.display='';"> Utilice esta Plantilla / Artículo<br />
                                                    </td>
                                                    <td style="text-align: center;">
                                                    <div style="font-weight:bold;">Insertar Formato:</div>
                                                        <?php generateInsertAtCursorLink($data, 'Negrita', '<B></B>'); ?>
                                                        <?php generateInsertAtCursorLink($data, 'Cursiva', '<I></I>'); ?>
                                                        <?php generateInsertAtCursorLink($data, 'Subrayar', '<U></U>'); ?>
                                                        <br />
                                                        <div style="font-weight:bold;">Insertar Campos de Combinación de Correspondencia:</div>
                                                        <?php /* Global vars */ ?>
                                                        <?php if(!isset($this->noGlobalTemplates)): ?>
                                                            <?php generateInsertAtCursorLink($data, 'Fecha / Hora Actual', '%DATETIME%'); ?>
                                                            <?php generateInsertAtCursorLink($data, 'Nombre del Sitio', '%SITENAME%'); ?>
                                                            <?php generateInsertAtCursorLink($data, 'Reclutador / Nombre de Usuario Actual', '%USERFULLNAME%'); ?>
                                                            <?php generateInsertAtCursorLink($data, 'Reclutador / Enlace de Correo Electrónico', '%USERMAIL%'); ?>
                                                        <?php endif; ?>

                                                        <?php /* Template specific vars */ ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Estado Anterior del Candidato', '%CANDPREVSTATUS%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Estado Actual del Candidato', '%CANDSTATUS%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Propietario Candidato', '%CANDOWNER%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Nombre del Candidato', '%CANDFIRSTNAME%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Nombre Completo del Candidato', '%CANDFULLNAME%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'URL del candidato de CATS', '%CANDCATSURL%'); ?>

                                                        <?php generateInsertAtCursorLinkConditional($data, 'Dueño de la Empres', '%CLNTOWNER%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Nombre de Empresa', '%CLNTNAME%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'URL de la empresa CATS', '%CLNTCATSURL%'); ?>

                                                        <?php generateInsertAtCursorLinkConditional($data, 'Dueño del Contacto', '%CONTOWNER%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Nombre del contacto', '%CONTFIRSTNAME%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Nombre Completo del Contacto', '%CONTFULLNAME%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Nombre de la Empresa del Contacto', '%CONTCLIENTNAME%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'URL del Contacto de CATS', '%CONTCATSURL%'); ?>

                                                        <?php generateInsertAtCursorLinkConditional($data, 'Dueño de la Orden de Trabajo', '%JBODOWNER%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Título de la Orden de Trabajo', '%JBODTITLE%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'Empresa de la Orden de Trabajo', '%JBODCLIENT%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'ID de la Orden de Trabajo', '%JBODID%'); ?>
                                                        <?php generateInsertAtCursorLinkConditional($data, 'URL de la Orden de Trabajo de CATS', '%JBODCATSURL%'); ?>
                                                    </td>
                                                 </tr>
                                             </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdVertical" style="width:150px;">
                                        </td>
                                        <td>
                                            <input type="submit" class="button" value="Guardar Plantilla">
                                            <input type="reset" class="button" value="Restablecer Plantilla" onclick="document.getElementById('selectorSpan').style.display=''; document.getElementById('templateTitleSpan<?php echo($data['emailTemplateID']); ?>').style.display='none'; document.getElementById('messageText<?php echo($data['emailTemplateID']); ?>').disabled=<?php if ($data['disabled'] == 0) {echo('false'); } else {echo('true'); } ?>;">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        <?php endforeach; ?>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
