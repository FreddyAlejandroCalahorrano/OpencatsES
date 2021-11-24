<?php /* $Id: NewVersionCheck.tpl 3585 2007-11-12 23:27:30Z andrew $ */ ?>
<?php TemplateUtility::printHeader('Settings', array('modules/settings/validator.js')); ?>
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
                    <td><h2>Ajustes: Administración</h2></td>
                </tr>
            </table>

            <p class="note">Nueva Versión</p>

            <table class="searchTable" width="100%">
                <tr>
                    <td>
                        <?php if ($this->versionCheckPref): ?>
                            <p>
                                Tu versión actual es: <span class="bold"><?php echo(CATSUtility::getVersion()); ?> Construida <?php echo(CATSUtility::getBuild()); ?></span>.<br />
                                <?php if ($this->newVersion): ?>
                                    <span class="bold">¡Una nueva version esta disponible!</span><br />
                                    Ir a <a href="http://www.catsone.com/" target="_blank">www.catsone.com</a> para saber más.<br />
                                <?php else: ?>
                                    Catsone.com informa que su versión está actualizada.<br />
                                <?php endif; ?>
                            </p>
                            <?php $this->_($this->newVersionNews); ?>
                        <?php else: ?>
                            <span>La verificación de versiones está actualmente deshabilitada.</span><br /><br />
                        <?php endif; ?>
                        <!-- <form action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration" id="changeNewVersionForm" method="post">
                            <input type="hidden" name="postback" value="postback" />
                            <input type="hidden" name="administrationMode" value="changeVersionCheck" />

                            <input type="checkbox" name="versionCheck" id="versionCheck"<?php if ($this->versionCheckPref): ?> checked<?php endif; ?> />Enable New Version Check (Recommended)<br /><br />
                            <input type="submit" name="save" class = "button" value="Save" />
                            <input type="button" name="back" class = "button" value="Back" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=administration';" />
                        </form> -->
                    </td>
                </tr>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
