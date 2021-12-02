<?php /* $Id: ImportCommits.tpl 1543 2007-01-22 23:23:24Z will $ */ ?>
<?php TemplateUtility::printHeader('Import', array('modules/import/import.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/reports.gif" width="24" height="24" border="0" alt="Import" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Importar Datos</h2></td>
                </tr>
            </table>

            <?php if (isset($this->successMessage)): ?>

                <p class="note">Éxito</p>

                <table class="searchTable">
                    <tr>
                        <td>
                            <?php echo($this->successMessage); ?>
                        </td>
                    </tr>
                </table>

                <br />

            <?php endif; ?>

            <p class="note">Compromisos Pendientes</p>

            <table class="searchTable">
                <tr>
                    <td>
                        <?php foreach ($this->data as $data): ?>
                            Importar #<?php echo($data['importID']); ?> - <?php echo($data['addedLines']); ?> entradas agregadas a la base de datos.<br />
                            <input type="button" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=revert&amp;importID=<?php echo($data['importID']) ?>';" value="Revertir Importación" class="button">
                            <input type="button" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=commit&amp;importID=<?php echo($data['importID']) ?>';" value="Confirmar Importación" class="button">
                            <input type="button" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=viewerrors&amp;importID=<?php echo($data['importID']) ?>';" value="Ver Errores" class="button">
                            <br /><br />
                        <?php endforeach; ?>
                    </td>
                </tr>
            </table>
            <br />

            <?php if (isset($this->importErrors)): ?>

                <p class="note">Errores Notificados por la Importación</p>

                <table class="searchTable" width="740">
                    <tr>
                        <td>
                            <?php echo($this->importErrors) ?>
                        </td>
                    </tr>
                </table>
                <input type="button" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=revert&amp;importID=<?php echo($this->importID); ?>';" value="Revertir Importación" class="button">
                <input type="button" onclick="document.location.href='<?php echo(CATSUtility::getIndexName()); ?>?m=import&amp;a=commit&amp;importID=<?php echo($this->importID); ?>';" value="Confirmar Importación" class="button">

            <?php endif; ?>

        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
