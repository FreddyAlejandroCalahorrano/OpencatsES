<?php /* $Id: Show.tpl 3814 2007-12-06 17:54:28Z brian $ */
include_once('./vendor/autoload.php');
use OpenCATS\UI\QuickActionMenu;
?>
<?php if ($this->isPopup): ?>
    <?php TemplateUtility::printHeader('Job Order - '.$this->data['title'], array('js/sorttable.js', 'js/match.js', 'js/pipeline.js', 'js/attachment.js')); ?>
<?php else: ?>
    <?php TemplateUtility::printHeader('Job Order - '.$this->data['title'], array( 'js/sorttable.js', 'js/match.js', 'js/pipeline.js', 'js/attachment.js')); ?>
    <?php TemplateUtility::printHeaderBlock(); ?>
    <?php TemplateUtility::printTabs($this->active); ?>
        <div id="main">
            <?php TemplateUtility::printQuickSearch(); ?>
<?php endif; ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Órdenes de Trabajo: Detalles de la Orden de Trabajo</h2></td>
                </tr>
            </table>

            <p class="note">Detalles de la Orden de Trabajo</p>

            <?php if ($this->data['isAdminHidden'] == 1): ?>
                <p class="warning">Orden de Trabajo oculta. Solo administradores CATS pueden verlo o buscarlo. Para hacerla visible a los usuarios, haga clic <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=administrativeHideShow&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;state=0" style="font-weight:bold;">Aquí.</a></p>
            <?php endif; ?>

            <?php if (isset($this->frozen)): ?>
                <table style="font-weight:bold; border: 1px solid #000; background-color: #ffed1a; padding:5px; margin-bottom:7px;" width="100%" id="candidateAlreadyInSystemTable">
                    <tr>
                        <td class="tdVertical">
                            Esta Orden de Trabajo es<?php $this->_($this->data['status']); ?> y no se puede modificar.
                           <?php if ($this->getUserAccessLevel('joborders.edit') >= ACCESS_LEVEL_EDIT): ?>
                               <a id="edit_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=edit&amp;jobOrderID=<?php echo($this->jobOrderID); ?>">
                                   <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />&nbsp;Editar
                               </a>
                            Orden de trabajo para activarlo.&nbsp;&nbsp;
                           <?php endif; ?>
                        </td>
                    </tr>
                </table>
            <?php endif; ?>

            <table class="detailsOutside" width="100%" height="<?php echo((count($this->extraFieldRS)/2 + 12) * 22); ?>">
                <tr style="vertical-align:top;">
                    <td width="50%" height="100%">
                        <table class="detailsInside" height="100%">
                            <tr>
                                <td class="vertical">Título:</td>
                                <td class="data" width="300">
                                    <span class="<?php echo($this->data['titleClass']); ?>"><?php $this->_($this->data['title']); ?></span>
                                    <?php echo($this->data['public']) ?>
                                    <?php TemplateUtility::printSingleQuickActionMenu(new QuickActionMenu(DATA_ITEM_JOBORDER, $this->data['jobOrderID'], $_SESSION['CATS']->getAccessLevel('joborders.edit'))); ?>
                                </td>
                            </tr>

                            <tr>
                                <td class="vertical">Nombre de Empresa:</td>
                                <td class="data">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=show&amp;companyID=<?php echo($this->data['companyID']); ?>">
                                        <?php echo($this->data['companyName']); ?>
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td class="vertical">Departamento:</td>
                                <td class="data">
                                    <?php echo($this->data['department']); ?>
                                </td>
                            </tr>

                            <tr>
                                <td class="vertical">ID de Trabajo de CATS:</td>
                                <td class="data" width="300"><?php $this->_($this->data['jobOrderID']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">ID de Trabajo de la Empresa:</td>
                                <td class="data"><?php echo($this->data['companyJobID']); ?></td>
                            </tr>

                            <!-- CONTACT INFO -->
                            <tr>
                                <td class="vertical">Nombre de Contacto:</td>
                                <td class="data">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php echo($this->data['contactID']); ?>">
                                        <?php echo($this->data['contactFullName']); ?>
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td class="vertical">Teléfono de Contacto:</td>
                                <td class="data"><?php echo($this->data['contactWorkPhone']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Correo Electrónico de Contacto:</td>
                                <td class="data">
                                    <a href="mailto:<?php $this->_($this->data['contactEmail']); ?>"><?php $this->_($this->data['contactEmail']); ?></a>
                                </td>
                            </tr>
                            <!-- /CONTACT INFO -->

                            <tr>
                                <td class="vertical">Ubicación:</td>
                                <td class="data"><?php $this->_($this->data['cityAndState']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Tarifa Máxima:</td>
                                <td class="data"><?php $this->_($this->data['maxRate']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Salario:</td>
                                <td class="data"><?php $this->_($this->data['salary']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Fecha de Inicio:</td>
                                <td class="data"><?php $this->_($this->data['startDate']); ?></td>
                            </tr>

                            <?php for ($i = 0; $i < intval(count($this->extraFieldRS)/2); $i++): ?>
                               <?php if(($this->extraFieldRS[$i]['extraFieldType']) != EXTRA_FIELD_TEXTAREA): ?>
                                   <tr>
                                        <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                        <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>
                                   </tr>
                                <?php endif; ?>
                            <?php endfor; ?>

                            <?php eval(Hooks::get('JO_TEMPLATE_SHOW_BOTTOM_OF_LEFT')); ?>

                        </table>
                    </td>

                    <td width="50%" height="100%" style="vertical-align:top;" >
                        <table class="detailsInside" height="100%">
                            <tr>
                                <td class="vertical">Duración:</td>
                                <td class="data"><?php $this->_($this->data['duration']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Aspirante:</td>
                                <td class="data"><?php $this->_($this->data['openings']); if ($this->data['openingsAvailable'] != $this->data['openings']): ?> (<?php $this->_($this->data['openingsAvailable']); ?> Available)<?php endif; ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Tipo:</td>
                                <td class="data"><?php $this->_($this->data['typeDescription']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Estado:</td>
                                <td class="data"><?php $this->_($this->data['status']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Pipelines:</td>
                                <td class="data"><?php $this->_($this->data['pipeline']) ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Enviado:</td>
                                <td class="data"><?php $this->_($this->data['submitted']) ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Días de Duración:</td>
                                <td class="data"><?php $this->_($this->data['daysOld']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Creado:</td>
                                <td class="data"><?php $this->_($this->data['dateCreated']); ?> (<?php $this->_($this->data['enteredByFullName']); ?>)</td>
                            </tr>

                            <tr>
                                <td class="vertical">Reclutador:</td>
                                <td class="data"><?php $this->_($this->data['recruiterFullName']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Dueño:</td>
                                <td class="data"><?php $this->_($this->data['ownerFullName']); ?></td>
                            </tr>

                            <?php for ($i = (intval(count($this->extraFieldRS))/2); $i < (count($this->extraFieldRS)); $i++): ?>
                                <?php if(($this->extraFieldRS[$i]['extraFieldType']) != EXTRA_FIELD_TEXTAREA): ?>
                                    <tr>
                                        <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                        <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>
                                    </tr>
                                <?php endif; ?>
                            <?php endfor; ?>

                            <?php eval(Hooks::get('JO_TEMPLATE_SHOW_BOTTOM_OF_RIGHT')); ?>
                        </table>
                    </td>
                </tr>
            </table>

            <?php if ($this->isPublic): ?>
            <div style="background-color: #E6EEFE; padding: 10px; margin: 5px 0 12px 0; border: 1px solid #728CC8;">
                <b>Esta Orden de Trabajo es pública<?php if ($this->careerPortalURL === false): ?>.</b><?php else: ?>
                    y se mostrará en tu
                    <?php if ($this->getUserAccessLevel('joborders.careerPortalUrl') >= ACCESS_LEVEL_SA): ?>
                        <a style="font-weight: bold;" href="<?php $this->_($this->careerPortalURL); ?>">Sitio Web de Carreras</a>.
                    <?php else: ?>
                    Sitio Web de Carreras.
                    <?php endif; ?></b>
                <?php endif; ?>

                <?php if ($this->questionnaireID !== false): ?>
                    <br />Los solicitantes deben completar el "<i><?php echo $this->questionnaireData['title']; ?></i>" (<a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalQuestionnaire&questionnaireID=<?php echo $this->questionnaireID; ?>">editar</a>) cuestionario al aplicar.
                <?php else: ?>
                    <br />No has adjuntado ninguna
                    <?php if ($this->getUserAccessLevel('setting.carrerPortalSettings') >= ACCESS_LEVEL_SA): ?>
                        <a href="<?php echo CATSUtility::getIndexName(); ?>?m=settings&a=careerPortalSettings">Cuestionarios</a>.
                    <?php else: ?>
                        Cuestionarios.
                    <?php endif; ?>
                <?php endif; ?>
            </div>
            <?php endif; ?>

            <table class="detailsOutside">
                <tr>
                    <td>
                        <table class="detailsInside">
                            <tr>
                                <td valign="top" class="vertical">Archivos Adjuntos:</td>
                                <td valign="top" class="data">
                                    <table class="attachmentsTable">
                                        <?php foreach ($this->attachmentsRS as $rowNumber => $attachmentsData): ?>
                                            <tr>
                                                <td>
                                                    <?php echo $attachmentsData['retrievalLink']; ?>
                                                        <img src="<?php $this->_($attachmentsData['attachmentIcon']) ?>" alt="" width="16" height="16" border="0" />
                                                        &nbsp;
                                                        <?php $this->_($attachmentsData['originalFilename']) ?>
                                                    </a>
                                                </td>
                                                <td><?php $this->_($attachmentsData['dateCreated']) ?></td>
                                                <td>
                                                    <?php if (!$this->isPopup): ?>
                                                        <?php if ($this->getUserAccessLevel('joborders.deleteAttachment') >= ACCESS_LEVEL_DELETE): ?>
                                                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=deleteAttachment&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;attachmentID=<?php $this->_($attachmentsData['attachmentID']) ?>"  title="Borrar" onclick="javascript:return confirm('¿Eliminar este archivo adjunto?');">
                                                                <img src="images/actions/delete.gif" alt="" width="16" height="16" border="0" />
                                                            </a>
                                                        <?php endif; ?>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </table>
                                    <?php if (!$this->isPopup): ?>
                                        <?php if ($this->getUserAccessLevel('joborders.createAttachment') >= ACCESS_LEVEL_EDIT): ?>
                                            <?php if (isset($this->attachmentLinkHTML)): ?>
                                                <?php echo($this->attachmentLinkHTML); ?>
                                            <?php else: ?>
                                                <a href="#" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=createAttachment&amp;jobOrderID=<?php echo($this->jobOrderID); ?>', 400, 125, null); return false;">
                                            <?php endif; ?>
                                                <img src="images/paperclip_add.gif" width="16" height="16" border="0" alt="add attachment" class="absmiddle" />&nbsp;Añadir un Archivo Adjunto
                                            </a>
                                        <?php endif; ?>
                                    <?php endif; ?>
                                </td>
                            </tr>

                            <tr>
                                <td valign="top" class="vertical">Descripción:</td>

                                <td class="data" colspan="2">
                                    <?php if($this->data['description'] != ''): ?>
                                    <div id="shortDescription" style="overflow: auto; height:170px; border: #AAA 1px solid; padding:5px;">
                                        <?php echo($this->data['description']); ?>
                                    </div>
                                    <?php endif; ?>
                                </td>

                            </tr>
                
                            <?php for ($i = (intval(count($this->extraFieldRS))/2); $i < (count($this->extraFieldRS)); $i++): ?>
                                <?php if(($this->extraFieldRS[$i]['extraFieldType']) == EXTRA_FIELD_TEXTAREA): ?>
                                    <tr>
                                        <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                        <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>
                                    </tr>
                                <?php endif; ?>
                            <?php endfor; ?>

                            <tr>
                                <td valign="top" class="vertical">Notas:</td>

                                <td class="data" style="width:320px;">
                                    <?php if($this->data['notes'] != ''): ?>
                                        <div id="shortDescription" style="overflow: auto; height:240px; border: #AAA 1px solid; padding:5px;">
                                            <?php echo($this->data['notes']); ?>
                                        </div>
                                    <?php endif; ?>
                                </td>

                                <td style="vertical-align:top;">
                                    <?php echo($this->pipelineGraph);  ?>
                                </td>

                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
<?php if (!$this->isPopup): ?>
            <div id="actionbar">
                <span style="float:left;">
                    <?php if ($this->getUserAccessLevel('joborders.edit') >= ACCESS_LEVEL_EDIT): ?>
                        <a id="edit_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=edit&amp;jobOrderID=<?php echo($this->jobOrderID); ?>">
                            <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />&nbsp;Editar
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                    <?php if ($this->getUserAccessLevel('joborders.delete') >= ACCESS_LEVEL_DELETE): ?>
                        <a id="delete_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=delete&amp;jobOrderID=<?php echo($this->jobOrderID); ?>" onclick="javascript:return confirm('Eliminar esta orden de trabajo?');">
                            <img src="images/actions/delete.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Borrar
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                    <?php if ($this->getUserAccessLevel('joborders.hidden') >= ACCESS_LEVEL_MULTI_SA): ?>
                        <?php if ($this->data['isAdminHidden'] == 1): ?>
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=administrativeHideShow&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;state=0">
                                <img src="images/resume_preview_inline.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Ver como Administrador
                            </a>
                            <?php else: ?>
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=administrativeHideShow&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;state=1">
                                <img src="images/resume_preview_inline.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Ocualtar vista de Administrador
                            </a>
                        <?php endif; ?>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                </span>
                <span style="float:right;">
                    <?php if (!empty($this->data['public']) && $this->careerPortalEnabled): ?>
                        <a id="public_link" href="<?php echo(CATSUtility::getAbsoluteURI()); ?>careers/<?php echo(CATSUtility::getIndexName()); ?>?p=showJob&amp;ID=<?php echo($this->jobOrderID); ?>">
                            <img src="images/public.gif" width="16" height="16" class="absmiddle" alt="Online Application" border="0" />&nbsp;Aplicaciones en Linea
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <?php endif; ?>
                    <?php /* TODO: Make report available for every site. */ ?>
                    <a id="report_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=reports&amp;a=customizeJobOrderReport&amp;jobOrderID=<?php echo($this->jobOrderID); ?>">
                        <img src="images/reportsSmall.gif" width="16" height="16" class="absmiddle" alt="report" border="0" />&nbsp;Generar Informe
                    </a>
                    <?php if ($this->privledgedUser): ?>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a id="history_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=viewItemHistory&amp;dataItemType=400&amp;dataItemID=<?php echo($this->jobOrderID); ?>">
                            <img src="images/icon_clock.gif" width="16" height="16" class="absmiddle"  border="0" />&nbsp;Ver Historial
                        </a>
                    <?php endif; ?>
                </span>
            </div>
<?php endif; ?>
            <br clear="all" />
            <br />

            <p class="note">Candidatos en Orden de Trabajo</p>

            <p id="ajaxPipelineControl">
                Número de Entradas Visibles:&nbsp;&nbsp;
                <select id="numberOfEntriesSelect" onchange="PipelineJobOrder_changeLimit(<?php $this->_($this->data['jobOrderID']); ?>, this.value, <?php if ($this->isPopup) echo(1); else echo(0); ?>, 'ajaxPipelineTable', '<?php echo($this->sessionCookie); ?>', 'ajaxPipelineTableIndicator', '<?php echo(CATSUtility::getIndexName()); ?>');" class="selectBox">
                    <option value="15" <?php if ($this->pipelineEntriesPerPage == 15): ?>selected<?php endif; ?>>15 entries</option>
                    <option value="30" <?php if ($this->pipelineEntriesPerPage == 30): ?>selected<?php endif; ?>>30 entries</option>
                    <option value="50" <?php if ($this->pipelineEntriesPerPage == 50): ?>selected<?php endif; ?>>50 entries</option>
                    <option value="99999" <?php if ($this->pipelineEntriesPerPage == 99999): ?>selected<?php endif; ?>>All entries</option>
                </select>&nbsp;
                <span id="ajaxPipelineNavigation">
                </span>&nbsp;
                <img src="images/indicator.gif" alt="" id="ajaxPipelineTableIndicator" />
            </p>

            <div id="ajaxPipelineTable"></div>
            <input type="checkbox" name="select_all" onclick="selectAll_candidates(this)" title="Select all candidates" /> <a href="javascript:void(0);" onclick="exportFromPipeline()" title="Export selected candidates">Exportar</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <script type="text/javascript">
            	function exportFromPipeline(){
<?php
	$params = array(
			'sortBy' => 'dateModifiedSort',
			'sortDirection' => 'DESC',
	        'filterVisible' => false,
	        'rangeStart' => 0,
	        'maxResults' => 100000000,
	        'exportIDs' => '<dynamic>',
	        'noSaveParameters' => true);

	$instance_name = 'candidates:candidatesListByViewDataGrid';
	$instance_md5 = md5($instance_name);
?>
					var exportArray<?= $instance_md5 ?> = getSelected_candidates();
            		if (exportArray<?= $instance_md5 ?>.length>0) {
                		window.location.href='<?= CATSUtility::getIndexName()?>?m=export&a=exportByDataGrid&i=<?= urlencode($instance_name); ?>&p=<?= urlencode(serialize($params)) ?>&dynamicArgument<?= $instance_md5 ?>=' + urlEncode(serializeArray(exportArray<?= $instance_md5 ?>));
            		} else {
                		alert('No se seleccionó ningún dato');
            		}
            	}


            </script>
            <script type="text/javascript">
                PipelineJobOrder_populate(<?php $this->_($this->data['jobOrderID']); ?>, 0, <?php $this->_($this->pipelineEntriesPerPage); ?>, 'dateCreatedInt', 'desc', <?php if ($this->isPopup) echo(1); else echo(0); ?>, 'ajaxPipelineTable', '<?php echo($this->sessionCookie); ?>', 'ajaxPipelineTableIndicator', '<?php echo(CATSUtility::getIndexName()); ?>');
            </script>

            <?php if (!$this->isPopup): ?>
            <?php if ($this->getUserAccessLevel('joborders.considerCandidateSearch') >= ACCESS_LEVEL_EDIT && !isset($this->frozen)): ?>
                <a href="#" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=considerCandidateSearch&amp;jobOrderID=<?php echo($this->jobOrderID); ?>', 820, 550, null); return false;">
                    <img src="images/consider.gif" width="16" height="16" class="absmiddle" alt="add candidate" border="0" />&nbsp;Agregar Candidato a esta Orden de Trabajo
                </a>
            <?php endif; ?>
        </div>
    </div>

<?php endif; ?>
<?php TemplateUtility::printFooter(); ?>
