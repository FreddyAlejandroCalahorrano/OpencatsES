<?php /* $Id: CreateAttachmentModal.tpl 3093 2007-09-24 21:09:45Z brian $ */ ?>
<?php TemplateUtility::printModalHeader('Candidates', array('modules/candidates/validator.js'), 'Agregar Archivo Adjunto'); ?>

    <?php if (!$this->isFinishedMode){ ?>
        <form name="createAttachmentForm" id="createAttachmentForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=createAttachment" enctype="multipart/form-data" method="post" onsubmit="return checkCreateAttachmentForm(document.createAttachmentForm);">
            <input type="hidden" name="postback" id="postback" value="postback" />
            <input type="hidden" id="candidateID" name="candidateID" value="<?php echo($this->candidateID); ?>" />

            <table class="editTable">
                <tr>
                    <td class="tdVertical">Archivo Adjunto:</td>
                    <td class="tdData"><input type="file" id="file" name="file" /></td>
                </tr>
                <tr>
                    <td class="tdVertical">Currículum:</td>
                    <td>
                        <input type="radio" id="resume" name="resume" value="1" checked="checked" />Si
                        <input type="radio" id="resume" name="resume" value="0" />No
                    </td>
                </tr>
            </table>
            <input type="submit" class="button" name="submit" id="submit" value="Crear Archivo Adjunto" />&nbsp;
            <input type="button" class="button" name="cancel" value="Cancelar" onclick="parentHidePopWin();" />
        </form>
    <?php } else { ?>
        <?php if(isset($this->resumeText) && $this->resumeText == ''): ?>
            <p>El archivo se adjuntó correctamente, pero OpenCATS no pudo indexar las palabras clave del currículum para que el documento se pueda buscar. Es posible que el formato de archivo no sea compatible con OpenCATS.</p>
        <?php else: ?>
            <p>El archivo se ha adjuntado correctamente.</p>
        <?php endif; ?>
        <form>
            <input type="button" name="close" value="Cerrar" onclick="parentHidePopWinRefresh();" />
        </form>
    <?php } ?>
    </body>
</html>
