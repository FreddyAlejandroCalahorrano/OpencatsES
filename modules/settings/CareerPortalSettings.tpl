<?php /* $Id: CareerPortalSettings.tpl 3806 2007-12-05 00:39:15Z andrew $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js', 'modules/settings/Settings.js', 'js/careerportal.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
<?php $careerPortalEnabledId = 0; ?>
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

            <p class="note">Configuración del Portal de Carrera</p>

            <table width="100%">
                <tr>
                    <td>
                        <form name="careerPortalSettingsForm" id="careerPortalSettingsForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=careerPortalSettings" method="post">
                            <input type="hidden" name="postback" value="postback" />
                            <input type="hidden" name="configured" value="1" />

                            <table class="editTable" width="100%">
                                <tr>
                                    <td class="tdVertical" style="width: 425px;">
                                        Habilitar el Portal de Carreras Públicas:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="enabled"<?php if ($this->careerPortalSettingsRS['enabled'] == '1'): ?> checked<?php endif; ?> onclick="document.getElementById('careerPortalSettingsForm').submit();">
                                    </td>
                                </tr>

                                <tr id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">
                                    <td class="tdVertical">
                                        Permitir la Exploración de Todas las Órdenes de Trabajo Públicas:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="allowBrowse"<?php if ($this->careerPortalSettingsRS['allowBrowse'] == '1'): ?> checked<?php endif; ?>>
                                    </td>
                                </tr>

                                <tr id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">
                                    <td class="tdVertical">
                                        Permitir que los Candidatos se Registren y Actualicen su Información de Contacto:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="candidateRegistration"<?php if ($this->careerPortalSettingsRS['candidateRegistration'] == '1'): ?> checked<?php endif; ?>>
                                    </td>
                                </tr>

                                <tr id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">
                                    <td class="tdVertical">
                                        Mostrar la Columna de la Empresa en la Lista de Órdenes de Trabajo:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="showCompany"<?php if ($this->careerPortalSettingsRS['showCompany'] == '1'): ?> checked<?php endif; ?>>
                                    </td>
                                </tr>
                                <tr id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">
                                    <td class="tdVertical">
                                        Mostrar Columna de Departamento en la Lista de Órdenes de Trabajo:
                                    </td>
                                    <td class="tdData">
                                        <input type="checkbox" name="showDepartment"<?php if ($this->careerPortalSettingsRS['showDepartment'] == '1'): ?> checked<?php endif; ?>>
                                    </td>
                                </tr>
                                <?php eval(Hooks::get('CAREER_PORTAL_SUBMIT_XML_FEEDS')); ?>
                                <tr id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">
                                    <td class="tdVertical">
                                        URL del Portal de Carrera:
                                    </td>
                                    <td class="tdData">
                                        <a href="<?php $this->_($this->careerPortalURL); ?>"><?php $this->_($this->careerPortalURL); ?></a>
                                    </td>
                                </tr>
                            </table>
                            <script type="text/javascript">
                                function setVisibility(visibility)
                                {
                                    for (var i = 1; i < 50; i++)
                                    {
                                        var obj = document.getElementById('careerPortalEnabled'+i);
                                        if (obj)
                                        {
                                            obj.style.display = visibility;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                }
                                /* Returns true if a template name is already in use. */
                                function detectInputIsValid(name)
                                {
                                    <?php foreach ($this->careerPortalTemplateNames as $name => $data): ?>
                                        if (name.toLowerCase() == '<?php echo($data['careerPortalName']); ?>'.toLowerCase()) return true;
                                    <?php endforeach; ?>
                                    <?php foreach ($this->careerPortalTemplateCustomNames as $name => $data): ?>
                                        if (name.toLowerCase() == '<?php echo($data['careerPortalName']); ?>'.toLowerCase()) return true;
                                    <?php endforeach; ?>

                                    return false;
                                }
                                indexURL = '<?php echo(CATSUtility::getIndexName()); ?>';
                                usingID = '<?php $this->_($data['careerPortalName']); ?>';
                            </script>
                            <input type="submit" class="button" value="Guardar Ajustes" id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>" />&nbsp;
                            <br />
                            <br />
                        </form>
                    </td>
                </tr>
            </table>

            <div id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">
                <p class="note">Cuestionarios</p>

                <form method="post" action="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalQuestionnaireUpdate" name="questionnaireUpdateForm">

                <div id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">
                    Cree un cuestionario para proporcionar a los candidatos antes de que presenten su solicitud. Puedes especificar acciones
                    realizar en función de sus respuestas.
                    <br /><br />

                    <?php if (isset($this->questionnaires) && !empty($this->questionnaires)): ?>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border: 1px solid #c0c0c0; padding: 2px;">
                        <tr>
                            <td width="30%" style="font-weight: bold; padding-right: 10px; border-bottom: 1px solid black;">Título</td>
                            <td width="50%" style="font-weight: bold; padding-right: 10px; border-bottom: 1px solid black;">Descripción</td>
                            <td width="10%" style="font-weight: bold; padding-right: 10px; border-bottom: 1px solid black;">Estado</td>
                            <td width="10%" style="font-weight: bold; padding-right: 10px; border-bottom: 1px solid black;">Eliminar</td>
                        </tr>
                        <?php $highlight = 0; ?>
                        <?php for ($i = 0; $i < count($this->questionnaires); $i++): ?>
                            <?php $questionnaire = $this->questionnaires[$i]; ?>
                            <?php $col = ($highlight = !$highlight) ? 'f0f0f0' : 'ffffff'; ?>
                            <tr>
                                <td style="background-color: #<?php echo $col; ?>;">
                                    <a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalQuestionnaire&questionnaireID=<?php echo $questionnaire['questionnaireID']; ?>">
                                    <?php echo $questionnaire['title']; ?>
                                    </a>
                                </td>
                                <td style="background-color: #<?php echo $col; ?>;"><?php echo $questionnaire['description']; ?></td>
                                <td style="background-color: #<?php echo $col; ?>;"><?php echo $questionnaire['isActive'] ? 'Active' : 'Inactive'; ?></td>
                                <td style="background-color: #<?php echo $col; ?>;" align="center"><input type="checkbox" name="removeQuestionnaire<?php echo $i; ?>" value="si" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        <?php endfor; ?>
                        </table>
                    <?php else: ?>
                        <span style="color: ##00008b;">No tienes cuestionarios. Hacer click <b>Agregar Cuestionario</b> para crear uno.</span><br />
                    <?php endif; ?>

                    <br />
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td align="left">
                                <input type="button" class="button" value="Agregar Cuestionario" onclick="document.location.href='<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalQuestionnaire';" />
                            </td>
                            <td align="right">
                                <input type="submit" class="button" value="Actualizar" />
                            </td>
                        </tr>
                    </table>
                </div>

                </form>

            </div>

            <br /><br />
            <p class="note" id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>">Plantillas</p>

            <div id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>" style="width:700px;">

                Puede elegir un estilo para su Portal de Carrera haciendo clic en una de las plantillas a continuación y presionando "Establecer como Activo".<br />
                <br />
                También puede duplicar una plantilla existente para crear una plantilla personalizada, lo que le permite crear el portal de carrera.
                se asemeja más a la apariencia de su página web corporativa. Personalizar una plantilla requiere conocimientos básicos
                de HTML y CSS.<br />
                <br />
            </div>

            <table id="careerPortalEnabled<?php echo ++$careerPortalEnabledId; ?>" width="100%">
                <tr>
                    <td valign="top">
                        <table class="editTable" width="100%">
                            <tr>
                                <td class="tdVertical" style="width: 350px;" height="330">
                                    <table width="100%">
                                        <tr>
                                            <td valign="top" nowrap="nowrap">
                                                Plantillas Integradas:
                                            </td>
                                            <td valign="top">
                                                <?php foreach ($this->careerPortalTemplateNames as $name => $data): ?>
                                                    <a href="javascript:void(0);" onclick="setModifyingJobDefault('<?php echo($data['careerPortalName']); ?>','<?php echo(CATSUtility::getIndexName()); ?>?m=careers&amp;templateName=<?php echo(urlencode($data['careerPortalName'])); ?>');" >
                                                        <?php $this->_($data['careerPortalName']); ?>
                                                        <?php if($data['careerPortalName'] == $this->careerPortalSettingsRS['activeBoard']): ?>&nbsp;(Active)<?php endif; ?>
                                                        <br />
                                                    </a>
                                                <?php endforeach; ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" nowrap="nowrap">
                                                Plantillas Personalizadas:<br /><br />
                                                <input type="button" class="button" value="Nuevo" onclick="showNewInput();" />
                                            </td>
                                            <td valign="top" nowrap="nowrap">
                                                <div id="confirmNew" style="display: none;">
                                                    <form name="careerPortalSettingsForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=onCareerPortalTweak&amp;p=new" method="post" onsubmit="if (detectInputIsValid(document.getElementById('templateName').value)) {alert('Este nombre de plantilla ya está en uso, por favor utilice otro.'); return false;}" >
                                                        Nuevo Nombre de Plantilla:<br />
                                                        <input name="newName" id="templateName" value="Sin Nombre" style="width: 160px;" />&nbsp;
                                                        <input type="submit" class="button" value="OK" />
                                                        <input type="button" class="button" value="Cancelar" onclick="hideAllEditingFields();" />
                                                        <br />
                                                        <br />
                                                    </form>
                                                </div>
                                                <?php foreach ($this->careerPortalTemplateCustomNames as $name => $data): ?>
                                                    <a href="javascript:void(0);" onclick="setModifyingJobCustom('<?php echo($data['careerPortalName']); ?>','<?php echo(CATSUtility::getIndexName()); ?>?m=careers&amp;templateName=<?php echo(urlencode($data['careerPortalName'])); ?>');">
                                                        <?php $this->_($data['careerPortalName']); ?>
                                                        <?php if($data['careerPortalName'] == $this->careerPortalSettingsRS['activeBoard']): ?>&nbsp;(Activo)<?php endif; ?>
                                                        <br />
                                                    </a>
                                                <?php endforeach; ?>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>

                    <td class="tdVertical" valign="top" width="100%" height="330" nowrap="nowrap">
                        <table class="editTable" width="100%">
                            <tr>
                                <td valign="top" align="center" nowrap="nowrap">
                                    <span id="textTemplateName" style="font-weight: bold; font-size: 18px;"></span>
                                    <br />
                                    <input type="button" class="button" value="Vista Previa a Pantalla Completa" onclick="fullScreenPreview();" />
                                    <input type="button" class="button" value="Editar" id="buttonEdit" onclick="window.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=careerPortalTemplateEdit&amp;templateName='+encodeURI(usingID);" />
                                    <input type="button" class="button" value="Editar" id="buttonEditDefault" onclick="showEditDefaultInput();" style="display: none;" />
                                    <input type="button" class="button" value="Borrar" id="buttonDelete" onclick="showDeleteInput();" />
                                    <input type="button" class="button" value="Duplicar" onclick="showDuplicateInput();" />
                                    <input type="button" class="button" value="Establecer como Activo" onclick="setAsActive();" />
                                    <form name="setAsActiveForm" id="setAsActiveForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=onCareerPortalTweak&amp;p=setAsActive" method="post">
                                        <input name="activeName" id="activeName" type="hidden" value="" />
                                        <input type="submit" class="button" value="OK" style="display: none;" />
                                    </form>
                                    <br />
                                    <div id="confirmDuplicate" style="display: none; text-align: left;">
                                        <br />
                                        Nuevo Nombre
                                        <form name="careerPortalSettingsForm" id="careerPortalSettingsForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=onCareerPortalTweak&amp;p=duplicate" method="post" onsubmit="if (detectInputIsValid(document.getElementById('duplicateName').value)) {alert('Este nombre de plantilla ya está en uso, por favor utilice otro.'); return false;}" >
                                            <input name="origName" id="origName" type="hidden" value="" />
                                            <input name="duplicateName" id="duplicateName" style="width: 200px;" />&nbsp;
                                            <input type="submit" class="button" value="OK" />
                                            <input type="button" class="button" value="Cancelar" onclick="hideAllEditingFields();" />
                                        </form>
                                        <br />
                                    </div>
                                    <div id="confirmDelete" style="display: none;">
                                        <br />
                                        ¿Está seguro de que desea eliminar esta plantilla?
                                        <form name="careerPortalSettingsForm" id="careerPortalSettingsForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=onCareerPortalTweak&amp;p=delete" method="post">
                                            <input name="delName" id="delName" type="hidden" value="">
                                            <input type="submit" class="button" value="OK">
                                            <input type="button" class="button" value="Cancelar" onclick="hideAllEditingFields();">
                                        </form>
                                        <br />
                                    </div>
                                    <div id="confirmEditDefault" style="display: none;">
                                        <br />
                                        Para editar esta plantilla, primero debe realizar una duplicación.
                                        <input type="button" class="button" value="Duplicar" onclick="showDuplicateInput();">
                                        <br />
                                    </div>
                                    <br />
                                    <iframe id="previewBox" width="500" height="250"></iframe>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        setVisibility(<?php if ($this->careerPortalSettingsRS['enabled'] == '1'): ?>''<?php else: ?>'none'<?php endif; ?>);
        <?php if(isset($_GET['templateName'])) $this->careerPortalSettingsRS['activeBoard'] = $_GET['templateName']; ?>
        <?php foreach ($this->careerPortalTemplateCustomNames as $name => $data): ?>
            <?php if($data['careerPortalName'] == $this->careerPortalSettingsRS['activeBoard']): ?>
                setModifyingJobCustom('<?php echo($data['careerPortalName']); ?>','<?php echo(CATSUtility::getIndexName()); ?>?m=careers&amp;templateName=<?php echo(urlencode($data['careerPortalName'])); ?>');
            <?php endif; ?>
        <?php endforeach; ?>
        <?php foreach ($this->careerPortalTemplateNames as $name => $data): ?>
            <?php if($data['careerPortalName'] == $this->careerPortalSettingsRS['activeBoard']): ?>
                setModifyingJobDefault('<?php echo($data['careerPortalName']); ?>','<?php echo(CATSUtility::getIndexName()); ?>?m=careers&amp;templateName=<?php echo(urlencode($data['careerPortalName'])); ?>');
            <?php endif; ?>
        <?php endforeach; ?>
    </script>
<?php TemplateUtility::printFooter(); ?>
