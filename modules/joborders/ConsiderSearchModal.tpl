<?php /* $Id: ConsiderSearchModal.tpl 3093 2007-09-24 21:09:45Z brian $ */ ?>
<?php TemplateUtility::printModalHeader('Job Orders', 'js/sorttable.js', 'Agregar Candidato a esta Orden de Trabajo'); ?>

    <?php if (!$this->isFinishedMode): ?>
        <p>Busque un candidato a continuación y luego haga clic en el
            nombre o apellido para agregar el candidato seleccionado a la Orden de Trabajo.</p>

        <table class="searchTable">
            <form id="searchByFullNameForm" name="searchByFullNameForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=considerCandidateSearch" method="post">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="mode_fullname" name="mode" value="searchByFullName" />
                <input type="hidden" id="jobOrderID_fullName" name="jobOrderID" value="<?php echo($this->jobOrderID); ?>" />

                <tr>
                    <td>Buscar por Nombre Completo:&nbsp;</td>
                    <td><input type="text" class="inputbox" id="wildCardString_fullname" name="wildCardString" />&nbsp;*</td>
                </tr>
                <tr>
                    <td><input type="submit" class="button" id="searchByFullName" name="searchByFullName" value="Buscar por Nombre Completo" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </form>
        </table>
        <br />

        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=addCandidateModal&amp;jobOrderID=<?php echo($this->jobOrderID); ?>">
            <img src="images/candidate_inline.gif" width="16" height="16" class="absmiddle" alt="add" border="0" />&nbsp;Añadir Candidato
        </a>
        <br />

        <?php if (empty($_POST['mode']) || $_POST['mode'] == 'searchByFullName'): ?>
            <script type="text/javascript">
                document.searchByFullNameForm.wildCardString.focus();
            </script>
        <?php else: ?>
            <script type="text/javascript">
                document.searchByKeySkillsForm.wildCardString.focus();
            </script>
        <?php endif; ?>

        <?php if ($this->isResultsMode): ?>
            <br />
            <p class="noteUnsized">Resultados de la Búsqueda</p>

            <?php if (!empty($this->rs)): ?>
                <table class="sortable" width="100%">
                    <tr>
                        <th align="left" nowrap="nowrap"></th>
                        <th align="left" nowrap="nowrap">Nombre</th>
                        <th align="left" nowrap="nowrap">Apellido</th>
                        <th align="left" nowrap="nowrap">Habilidades Clave</th>
                        <th align="left">Creado</th>
                        <th align="left">Dueño</th>
                        <th align="center">Acción</th>
                    </tr>

                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <?php if($data['isDuplicateCandidate'] == 1): ?>
                                <td valign="top" align="left">
                                    <img src="images/wf_error.gif" alt="" width="16" height="16" title="Candidato Duplicado"/>
                                </td>
                            <?php else: ?>
                                <td valign="top" align="left">
                                    <img src="images/mru/blank.gif" alt="" width="16" height="16" />
                                </td>
                            <?php endif; ?>
                            <?php if (!$data['inPipeline']): ?>
                                <td valign="top" align="left">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=addToPipeline&amp;getback=getback&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;candidateID=<?php $this->_($data['candidateID']); ?>">
                                        <?php $this->_($data['firstName']); ?>
                                    </a>
                                    &nbsp;
                                </td>
                                <td valign="top" align="left">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=addToPipeline&amp;getback=getback&amp;jobOrderID=<?php echo($this->jobOrderID); ?>&amp;candidateID=<?php $this->_($data['candidateID']); ?>">
                                        <?php $this->_($data['lastName']); ?>
                                    </a>
                                    &nbsp;
                                </td>
                            <?php else: ?>
                                <td valign="top" align="left"><?php $this->_($data['firstName']); ?>&nbsp;</td>
                                <td valign="top" align="left"><?php $this->_($data['lastName']); ?>&nbsp;</td>
                            <?php endif; ?>
                            <td valign="top" align="left"><?php $this->_($data['keySkills']); ?>&nbsp;</td>
                            <td valign="top" align="left" nowrap="nowrap"><?php $this->_($data['dateCreated']); ?>&nbsp;</td>
                            <td valign="top" align="left" nowrap="nowrap"><?php $this->_($data['ownerAbbrName']); ?>&nbsp;</td>
                            <td align="center" nowrap="nowrap">
                                <a href="#" title="Mostrar Candidato" onclick="javascript:openCenteredPopup('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;display=popup&amp;candidateID=<?php $this->_($data['candidateID']); ?>', 'viewCandidateDetails', 1000, 675, true); return false;">
                                    <img src="images/new_browser_inline.gif" alt="consider" width="16" height="16" border="0" class="absmiddle" />
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <p>No se encontraron entradas coincidentes.</p>
            <?php endif; ?>
        <?php endif; ?>
    <?php else: ?>
        <p>El candidato seleccionado se ha agregado correctamente a la canalización de esta orden de trabajo.</p>

        <form method="get" action="<?php echo(CATSUtility::getIndexName()); ?>">
            <input type="button" name="close" value="Cerrar" onclick="parentGoToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;jobOrderID=<?php echo($this->jobOrderID); ?>');" />
        </form>
    <?php endif; ?>
    </body>
</html>

