<?php /* $Id: ConsiderSearchModal.tpl 3093 2007-09-24 21:09:45Z brian $ */ ?>
<?php TemplateUtility::printModalHeader('Candidates', array(), 'Agregar Candidato a esta Orden de Trabajo'); ?>

    <?php if (!$this->isFinishedMode): ?>
        <p>Busque una orden de trabajo a continuación y luego haga clic en el título del trabajo para agregar
            el candidato a la orden de trabajo seleccionada.</p>

        <table class="searchTable">
            <form id="searchByJobTitleForm" name="searchByJobTitleForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=considerForJobSearch" method="post">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="mode_jobtitle" name="mode" value="searchByJobTitle" />
                <input type="hidden" id="candidateID_jobtitle" name="candidateIDArrayStored" value="<?php echo($this->candidateIDArrayStored); ?>" />

                <tr>
                    <td>Buscar por Puesto de Trabajo:&nbsp;</td>
                    <td><input type="text" class="inputbox" id="wildCardString_jobTitle" name="wildCardString"style="width:200px;" />&nbsp;*</td>
                </tr>
                <tr>
                    <td><input type="submit" class="button" id="searchByJobTitle" name="searchByJobTitle" value="Buscar por Puesto de Trabajo" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </form>

            <form id="searchByCompanyNameForm" name="searchByCompanyNameForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=considerForJobSearch" method="post">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="mode_companyname" name="mode" value="searchByCompanyName" />
                <input type="hidden" id="candidateID_companyname" name="candidateIDArrayStored" value="<?php echo($this->candidateIDArrayStored); ?>" />

                <tr>
                    <td>Buscar por Nombre de Empresa:&nbsp;</td>
                    <td><input type="text" class="inputbox" id="wildCardString_companyname" name="wildCardString" style="width:200px;" />&nbsp;*</td>
                </tr>
                <tr>
                    <td><input type="submit" class="button" id="searchByCompanyName" name="searchByCompanyName" value="Buscar por Nombre de Empresa" /></td>
                </tr>
            </form>
        </table>

        <?php if (empty($_POST['mode']) || $_POST['mode'] == 'searchByJobTitle'): ?>
            <script type="text/javascript">
                document.searchByJobTitleForm.wildCardString.focus();
            </script>
        <?php else: ?>
            <script type="text/javascript">
                document.searchByCompanyNameForm.wildCardString.focus();
            </script>
        <?php endif; ?>

        <?php if ($this->isResultsMode): ?>
            <br />
            <p class="noteUnsized">Resultados de la Búsqueda</p>

            <?php if (!empty($this->rs)): ?>
                <table class="sortable" width="100%">
                    <tr>
                        <th align="left">Número de Ref.</th>
                        <th align="left">Titulo</th>
                        <th align="left">Empresa</th>
                        <th align="left">Tipo</th>
                        <th align="left">Estado</th>
                        <th align="left">Creado</th>
                        <th align="left">Inicio</th>
                        <th align="left">Reclutador</th>
                        <th align="left">Dueño</th>
                        <th align="center">Acción</th>
                    </tr>

                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <td align="left" valign="top"><?php $this->_($data['jobID']); ?></td>
                            <td align="left" valign="top">
                                <?php if (!$data['inPipeline']): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=addToPipeline&amp;getback=getback&amp;candidateIDArrayStored=<?php echo($this->candidateIDArrayStored); ?>&amp;jobOrderID=<?php $this->_($data['jobOrderID']); ?>" class="<?php $this->_($data['linkClass']); ?>">
                                        <?php $this->_($data['title']); ?>
                                    </a>
                                <?php else: ?>
                                    <span class="<?php $this->_($data['linkClass']); ?>"><?php $this->_($data['title']); ?></span>
                                <?php endif; ?>
                            </td>
                            <td align="left" valign="top"><?php $this->_($data['companyName']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['type']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['status']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['dateCreated']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['startDate']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['recruiterAbbrName']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['ownerAbbrName']); ?></td>
                            <td align="center" nowrap="nowrap">
                                <a href="#" title="Show Job Order" onclick="javascript:openCenteredPopup('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;display=popup&amp;jobOrderID=<?php $this->_($data['jobOrderID']); ?>', 'viewJobOrderDetails', 1000, 675, true); return false;">
                                    <img src="images/new_browser_inline.gif" alt="consider" width="16" height="16" border="0" class="absmiddle" />
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <p>No se Encontraron Entradas Roincidentes.</p>
            <?php endif; ?>
            <input type="button" class="button" id="showRecentJobOrders" name="showRecentJobOrders" value="Mostrar Órdenes de Trabajo Modificadas Recientemente" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=considerForJobSearch&amp;candidateIDArrayStored=<?php echo($this->candidateIDArrayStored); ?>';" />
        <?php else: ?>
            <br />
            <p class="noteUnsized">Órdenes de Trabajo Modificadas Recientemente</p>

            <?php if (!empty($this->rs)): ?>
                <table class="sortable" width="100%">
                    <tr>
                        <th align="left">Número de Ref.</th>
                        <th align="left">Titulo</th>
                        <th align="left">Empresa</th>
                        <th align="left">Tipo</th>
                        <th align="left">Estado</th>
                        <th align="left">Creado</th>
                        <th align="left">Inicio</th>
                        <th align="left">Reclutador</th>
                        <th align="left">Dueño</th>
                        <th align="center">Acción</th>
                    </tr>

                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <td align="left" valign="top"><?php $this->_($data['jobID']); ?></td>
                            <td align="left" valign="top">
                                <?php if (!$data['inPipeline']): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=addToPipeline&amp;getback=getback&amp;candidateIDArrayStored=<?php echo($this->candidateIDArrayStored); ?>&amp;jobOrderID=<?php $this->_($data['jobOrderID']); ?>" class="<?php $this->_($data['linkClass']); ?>">
                                        <?php $this->_($data['title']); ?>
                                    </a>
                                <?php else: ?>
                                    <span class="<?php $this->_($data['linkClass']); ?>"><?php $this->_($data['title']); ?></span>
                                <?php endif; ?>
                            </td>
                            <td align="left" valign="top"><?php $this->_($data['companyName']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['type']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['status']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['dateModified']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['startDate']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['recruiterAbbrName']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['ownerAbbrName']); ?></td>
                            <td align="center" nowrap="nowrap">
                                <a href="#" title="Show Job Order" onclick="javascript:openCenteredPopup('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;display=popup&amp;jobOrderID=<?php $this->_($data['jobOrderID']); ?>', 'viewJobOrderDetails', 1000, 675, true); return false;">
                                    <img src="images/new_browser_inline.gif" alt="consider" width="16" height="16" border="0" class="absmiddle" />
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <p>No se Encontraron Ódenes de Trabajo Recientes.</p>
            <?php endif; ?>
        <?php endif; ?>
    <?php else: ?>
        <p>The <?php if(count($this->candidateIDArray)>1): ?> <?php echo(count($this->candidateIDArray)); ?> candidates have<?php else: ?>candidate has<?php endif; ?> se ha agregado con éxito a la canalización para la orden de trabajo seleccionada.</p>

        <form method="get" action="<?php echo(CATSUtility::getIndexName()); ?>">
            <input type="button" name="close" value="Cerrar" onclick="parentHidePopWinRefresh();" />
        </form>
    <?php endif; ?>

    </body>
</html>
