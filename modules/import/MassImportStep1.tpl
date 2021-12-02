<div class="stepContainer">

<?php if (isset($this->documents)): ?>
<div id="uploadQueue" style="background-color: #f0f0f0; color: #800000; border: 1px solid #800000; text-align: center; font-size: 14px; padding: 10px; margin: 0 0 15px 0; font-weight: bold;">
You have <?php echo number_format(count($this->documents), 0); ?> document<?php echo count($this->documents) != 1 ? 's' : ''; ?> in your upload queue.
<br /><br />
<input type="button" value="Delete File<?php echo count($this->documents) != 1 ? 's' : ''; ?>" onclick="deleteUploadFiles();" class="button" />
<input type="button" class="button" value="Import File<?php echo count($this->documents) != 1 ? 's' : ''; ?>" onclick="document.location.href='<?php echo CATSUtility::getIndexName(); ?>?m=import&a=massImport&step=2';" />
</div>
<?php endif; ?>

<?php if ($this->multipleFilesEnabled): ?>
    <span style="font-size: 16px;">
    <?php if ($this->uploadPath !== false): ?>
        Para importar varios archivos, mueva o copie sus documentos de currículum al siguiente directorio en la computadora
        que aloja CATS:
        <br /><br />

        <b><?php echo $this->uploadPath; ?></b>

        <br /><br />
        Una vez que tenga currículums en esta carpeta, <a href="<?php echo CATSUtility::getIndexName(); ?>?m=import&a=importSelectType&typeOfImport=resume">
        recargar</a> esta página para iniciar el proceso de importación.

        <br /><br />

        <?php if (LicenseUtility::isProfessional()): ?>
        Si necesita ayuda, comuníquese con el equipo de soporte de CATS.</br >
        <?php else: ?>
        Si necesita ayuda para cargar archivos en su servidor web, comuníquese con el administrador del sistema.<br />
        <?php endif; ?>
    <?php else: ?>
        Para importar documentos de currículum a CATS, debe crear un directorio llamado "<b>upload</b>" en la computadora
        que alberga CATS. Este directorio debe tener sus permisos configurados para su
        Servidor Web.
        <br /><br />
        <b>Instrucciones de Linux:</b>
        <br />
        <blockquote>
        <span style="color: #c0c0c0;">&gt;</span> mkdir /PATH/TO/CATS/upload<br />
        <span style="color: #c0c0c0;">&gt;</span> chmod -R 777 /PATH/TO/CATS/upload
        </blockquote>
        <br />
        <b>Instrucciones de Windows:</b>
        <blockquote>
        <span style="color: #c0c0c0;">&gt;</span> Crea una carpeta llamada <b>upload</b> en el directorio que instalaste CATS.<br />
        <span style="color: #c0c0c0;">&gt;</span> Establezca los permisos apropiados haciendo clic derecho en el archivo y seleccionando <b>Propiedades</b>, luego <b>Seguridad</b>.<br />
        <span style="color: #c0c0c0;">&gt;</span> Asegúrese de que todos los usuarios tengan acceso para leer, escribir y eliminar archivos y directorios.
        </blockquote>
    <?php endif; ?>
    </span>


<?php else: ?>
    La función de importación automática de currículums masivos se ha desactivado temporalmente.<br /><br />
    Para importar currículums al grupo de currículums masivos, comuníquese con <a href="mailto:support@catsone.com">support@catsone.com</a>
    para obtener ayuda del equipo CATS.
    <br />


<?php endif; ?>

<?php if (LicenseUtility::isParsingEnabled()): ?>
<div style="padding: 10px; margin-top: 15px; text-align: left;">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td align="left" valign="top" style="padding-right: 20px;">
                <a href="http://www.resfly.com" target="_blank">
                    <img src="images/poweredByResfly.jpg" border="0" style="border: 1px solid #c0c0c0;" />
                </a>
            </td>
            <td align="left" valign="top">
                <span style="font-size: 16px;">
                <?php if (LicenseUtility::isProfessional()): ?>
                   Eres un usuario profesional de CATS registrado <b><?php echo LicenseUtility::getName(); ?></b>.
                <?php elseif (LicenseUtility::isOpenSource()): ?>
                <b>Eres un usuario de código abierto registrado de CATS.</b>
                <?php endif; ?>
                </span>

                <p />
                <?php if ((is_array($status = LicenseUtility::getParsingStatus()) && $status['parseLimit'] == -1)): ?>
                    <span style="font-size: 14px; color: #333333;">
                    Tiene uso ilimitado del servicio de análisis de Resfly, que busca contactos en sus archivos de currículum
                    y reanudar la información. CATS importará todos los documentos de currículum correspondientes como candidatos.
                    </span>
                <?php else: ?>
                    <span style="font-size: 14px; color: #333333;">
                    Los documentos de su currículum se importarán como documentos de búsqueda, pero <b>no</b> como candidatos a menos que
                    completes manualmente los campos obligatorios para cada documento (nombre y apellido).
                    <br /><br />
                    Con el
                    Servicio de análisis de Resfly, gran parte de la información del candidato se puede importar automáticamente.
                    <br />
                    Considerar <a href="http://www.catsone.com/?a=getcats" style="font-size: 14px;" target="_blank">actualizar a CATS Professional</a>
                    para el uso ilimitado de este servicio.
                    </span>
                <?php endif; ?>
            </td>
        </tr>
    </table>
</div>
<?php endif; ?>

</div>
