<?php /* $Id: CreateAttachmentModal.tpl 3093 2007-09-24 21:09:45Z brian $ */ ?>
<?php TemplateUtility::printModalHeader('Companies', array('modules/companies/validator.js'), 'Agregar Archivo Adjunto'); ?>

    <?php if (!$this->isFinishedMode): ?>
        <form name="createAttachmentForm" id="createAttachmentForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=createAttachment" enctype="multipart/form-data" method="post" onsubmit="return checkAttachmentForm(document.createAttachmentForm);">
            <input type="hidden" name="postback" id="postback" value="postback" />
            <input type="hidden" id="companyID" name="companyID" value="<?php echo($this->companyID); ?>" />

            <table class="editTable">
                <tr>
                    <td class="tdVertical">Archivo Adjunto:</td>
                    <td class="tdData"><input type="file" id="file" name="file" /></td>
                </tr>
            </table>
            <input type="submit" class="button" name="submit" id="submit" value="Crear Archivo Adjunto" />&nbsp;
            <input type="button" class="button" name="cancel" value="Cancelar" onclick="parentHidePopWin();" />
        </form>
    <?php else: ?>
        <p>El archivo se ha adjuntado correctamente.</p>

        <form>
            <input type="button" name="close" value="Cerrar" onclick="parentHidePopWinRefresh();" />
        </form>
    <?php endif; ?>
    </body>
</html>