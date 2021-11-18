<?php /* $Id: AddModalPopup.tpl 3321 2007-10-25 22:03:10Z brian $ */ ?>
<?php TemplateUtility::printModalHeader('Job Order', array('modules/joborders/validator.js')); ?>
    <table>
        <tr>
            <td width="3%">
                <img src="images/job_orders.gif" width="24" height="24" border="0" alt="Job Orders" style="margin-top: 3px;" />&nbsp;
            </td>
            <td><h2>Órdenes de Trabajo: Agregar Orden de Trabajo</h2></td>
       </tr>
    </table>

    <p class="noteUnsized">Agregar Orden de Trabajo</p>
            
        <script type="text/javascript">
            var typeOfAdd="new";
        </script>
            
        <table class="editTable" width="100%">
            <tr>
                <td class="tdData"><input type="radio" name="typeOfAddElement" onclick="document.getElementById('copyFrom').disabled=true; typeOfAdd='new';" checked>&nbsp;Orden de Trabajo Vacía</td>
            </tr>
            <tr>
                <td class="tdData"><input type="radio" name="typeOfAddElement" onclick="document.getElementById('copyFrom').disabled=false; typeOfAdd='existing';">&nbsp;Copiar Orden de Trabajo Existente</td>
            </tr>
            <tr id="hideShowCopyExisting">
                <td class="tdData">
                    <select name="copyFrom" id="copyFrom" style="width:350px;" disabled>
                        <?php foreach($this->rs as $index => $data): ?>
                            <option value="<?php echo($data['jobOrderID']); ?>"><?php $this->_($data['title'].' ('.$data['companyName'].')'); ?></option>
                        <?php endforeach; ?>
                    </select>
                </td>
            </tr>
        </table>
        <input type="button" class="button"  value="Crear Orden de Trabajor" onclick="parentGoToURL('<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=add&amp;jobOrderID='+document.getElementById('copyFrom').value+'&amp;typeOfAdd='+typeOfAdd);"/>&nbsp;
        <input type="button" class="button" name="close" value="Cerrar" onclick="parentHidePopWin();" />
    </body>
</html>