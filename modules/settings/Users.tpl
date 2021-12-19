<?php /* $Id: Users.tpl 2452 2007-05-11 17:47:55Z brian $ */ ?>
<?php TemplateUtility::printHeader('Settings', 'js/sorttable.js'); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/settings.gif" width="24" height="24" alt="Settings" style="border: none; margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Ajustes: Gestión de Usuarios</h2></td>
                </tr>
            </table>

            <p class="note">Gestión de Usuarios</p>

            <table class="sortable">
                <thead>
                    <tr>
                        <th align="left" nowrap="nowrap">Nombre</th>
                        <th align="left" nowrap="nowrap">Apellido</th>
                        <th align="left">Nombre de Usuario</th>
                        <th align="left" nowrap="nowrap">Nivel de Acceso</th>
                        <th align="left" nowrap="nowrap">Último Exito</th>
                        <th align="left" nowrap="nowrap">Último Fallo</th>
                    </tr>
                </thead>

                <?php if (!empty($this->rs)): ?>
                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <td valign="top" align="left">
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=showUser&amp;userID=<?php $this->_($data['userID']); ?>">
                                    <?php $this->_($data['firstName']); ?>
                                </a>
                            </td>
                            <td valign="top" align="left">
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=showUser&amp;userID=<?php $this->_($data['userID']); ?>">
                                    <?php $this->_($data['lastName']); ?>
                                </a>
                            </td>
                            <td valign="top" align="left"><?php $this->_($data['username']); ?></td>
                            <td valign="top" align="left"><?php $this->_($data['accessLevelDescription']); ?></td>
                            <td valign="top" align="left"><?php $this->_($data['successfulDate']); ?></td>
                            <td valign="top" align="left"><?php $this->_($data['unsuccessfulDate']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </table>
            <?php if (AUTH_MODE != "ldap"): ?>
                <a id="add_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=addUser" title="Tienes <?php $this->_($this->license['diff']); ?> cuentas de usuario restantes.">
                    <img src="images/candidate_inline.gif" width="16" height="16" class="absmiddle" alt="add" style="border: none;" />&nbsp;Agregar Usuario
                </a>
            <?php endif; ?>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
