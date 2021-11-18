<?php /* $Id: Lists.tpl 3311 2007-10-25 21:36:18Z andrew $ */ ?>
<?php TemplateUtility::printHeader('Lists', array( 'js/highlightrows.js', 'js/sweetTitles.js', 'js/export.js', 'js/dataGrid.js', 'js/dataGridFilters.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents"<?php echo !$this->dataGrid->getNumberOfRows() ? ' style="background-color: #E6EEFF; padding: 0px;"' : ''; ?>>
            <?php if ($this->dataGrid->getNumberOfRows()): ?>
            <table width="100%">
                <tr>
                    <td width="3%">
                        <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Lists: Home</h2></td>
                    <td align="right">
                        <form name="jobOrdersViewSelectorForm" id="jobOrdersViewSelectorForm" action="<?php echo(CATSUtility::getIndexName()); ?>" method="get">
                            <input type="hidden" name="m" value="joborders" />
                            <input type="hidden" name="a" value="list" />

                            <table class="viewSelector">
                                <tr>
                                    <td>
                                    </td>
                                 </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>

            <p class="note">
                <span style="float:left;">Listas  -
                    Página <?php echo($this->dataGrid->getCurrentPageHTML()); ?> (<?php echo($this->dataGrid->getNumberOfRows()); ?> Elementos)
                </span>
                <span style="float:right;">
                    <?php $this->dataGrid->drawRowsPerPageSelector(); ?>
                </span>&nbsp;
            </p>

            <?php $this->dataGrid->drawFilterArea(); ?>
            <?php $this->dataGrid->draw();  ?>

            <div style="display:block;">
                <span style="float:left;">

                </span>
                <span style="float:right;">
                    <?php $this->dataGrid->printNavigation(true); ?>
                </span>&nbsp;
            </div>
            <?php else: ?>

            <br /><br /><br /><br />
            <div style="height: 95px; background: #E6EEFF url(images/nodata/listsTop.jpg);">
                &nbsp;
            </div>
            <br /><br />
            <table cellpadding="0" cellspacing="0" border="0" width="956">
                <tr>
                <td style="padding-left: 62px;" align="center" valign="center">

                    <div style="text-align: center; width: 600px; line-height: 22px; font-size: 18px; font-weight: bold; color: #666666; padding-bottom: 20px;">
                    Cree listas para agrupar candidatos, órdenes de trabajo, empresas y contactos y realice acciones sobre ellos rápidamente.
                    <br /><br />
                    <span style="font-size: 14px; font-weight: normal;">
                    Crea listas a partir de <b>órdenes de trabajo, candidatos, empresas </b>o<b> contactos.</b>
                    </span>
                    </div>
                </td>

                </tr>
            </table>

            <?php endif; ?>

        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
