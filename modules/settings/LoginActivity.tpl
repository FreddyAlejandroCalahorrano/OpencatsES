<?php /* $Id: LoginActivity.tpl 2452 2007-05-11 17:47:55Z brian $ */ ?>
<?php TemplateUtility::printHeader('Settings'); ?>
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
                    <td><h2>Ajustes: Actividad de Inicio de Sesión</h2></td>
                </tr>
            </table>

            <p class="note">Actividad de Inicio de Sesión Reciente</p>

            <form name="loginActivityViewSelectorForm" id="loginActivityViewSelectorForm" action="<?php echo(CATSUtility::getIndexName()); ?>" method="get">
                <input type="hidden" name="m" value="settings" />
                <input type="hidden" name="a" value="loginActivity" />

                <table class="viewSelector">
                    <tr>
                        <td>
                            <select name="view" id="view" onchange="document.loginActivityViewSelectorForm.submit();">
                                <?php if ($this->view == 'successful'): ?>
                                    <option value="successful" selected="selected">Inicios de Sesión Exitosos</option>
                                    <option value="unsuccessful">Inicios de Sesión Fallidos</option>
                                <?php elseif ($this->view == 'unsuccessful'): ?>
                                    <option value="successful">Inicios de Sesión Exitosos</option>
                                    <option value="unsuccessful" selected="selected">Inicios de Sesión Fallidos</option>
                                <?php else: ?>
                                    <option value="successful">Inicios de Sesión Exitosos</option>
                                    <option value="unsuccessful">Inicios de Sesión Fallidos</option>
                                <?php endif; ?>
                            </select>
                            <!--&nbsp;&nbsp;&nbsp;&nbsp;
                            Login activity older than 1 month plus 100 entries in the past is automatically cleared from the system.-->
                        </td>
                    </tr>
                </table>
            </form>

            <?php if (!empty($this->rs)): ?>
                <table class="sortable">
                    <thead>
                        <tr>
                            <th align="left" nowrap="nowrap">
                                <?php $this->pager->printSortLink('firstName', 'Nombre'); ?>
                            </th>
                            <th align="left" nowrap="nowrap">
                                <?php $this->pager->printSortLink('lastName', 'Apellido'); ?>
                            </th>
                            <th align="left">
                                <?php $this->pager->printSortLink('ip', 'IP'); ?>
                            </th>
                            <th align="left">
                                <?php $this->pager->printSortLink('hostname', 'Nombre de Host'); ?>
                            </th>
                            <th align="left" nowrap="nowrap">
                                <?php $this->pager->printSortLink('shortUserAgent', 'Agente de Usuario'); ?>
                            </th>
                            <th align="left" nowrap="nowrap">
                                <?php $this->pager->printSortLink('dateSort', 'Fecha / Hora'); ?>
                            </th>
                        </tr>
                    </thead>

                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <td valign="top" align="left">
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&a=showUser&userID=<?php $this->_($data['userID']); ?>">
                                    <?php $this->_($data['firstName']); ?>
                                </a>
                            </td>
                            <td valign="top" align="left">
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&a=showUser&userID=<?php $this->_($data['userID']); ?>">
                                    <?php $this->_($data['lastName']); ?>
                                </a>
                            </td>
                            <td valign="top" align="left"><?php $this->_($data['ip']); ?></td>
                            <td valign="top" align="left"><?php $this->_($data['hostname']); ?></td>
                            <td valign="top" align="left"><?php $this->_($data['shortUserAgent']); ?></td>
                            <td valign="top" align="left" nowrap="nowrap"><?php $this->_($data['date']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </table>
                <?php $this->pager->printNavigation('', true, 20); ?>
            <?php endif; ?>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
