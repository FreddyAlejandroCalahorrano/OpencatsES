<?php /* $Id: ErrorModal.tpl 652 2006-08-25 02:45:43Z will $ */ ?>
<?php TemplateUtility::printModalHeader('Import'); ?>
    <table>
        <tr>
            <td><h2>Importar: Error</h2></td>
        </tr>
    </table>

    <p class="fatalError">
            Ha ocurrido un error fatal.<br />
        <br />
        <?php echo($this->errorMessage); ?>
    </p>
    </body>
</html>

