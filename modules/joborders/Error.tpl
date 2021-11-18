<?php /* $Id: Error.tpl 3093 2007-09-24 21:09:45Z brian $ */ ?>
<?php TemplateUtility::printHeader('Job Orders', array()); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>

    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Órdenes de Trabajo: Error</h2></td>
                </tr>
            </table>

            <p class="fatalError">
                Ha ocurrido un error fatal.<br />
                <br />
                <?php echo($this->errorMessage); ?>
            </p>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
