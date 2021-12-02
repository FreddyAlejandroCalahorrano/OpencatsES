<div class="stepContainer">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <?php if (LicenseUtility::isParsingEnabled()): ?>
            <td width="45%" valign="top">
                <span style="font-size: 18px; font-weight: bold;">
                <font color="green"><?php echo count($this->importedCandidates); ?></font> Candidate<?php echo count($this->importedCandidates) != 1 ? 's' : ''; ?> Imported
                </span>
                <p />
                Un candidato tiene toda la información aplicable (como nombre, dirección, conjunto de habilidades) en el archivo
                y puede agregarse a las órdenes de trabajo e incluirse en informes y acciones. El currículum subido
                Los documentos se adjuntan al registro del candidato para su posterior visualización y búsqueda..
                <p />
                <b>Candidatos Importados:</b>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color: #F8FAFF; padding: 10px; border: 1px solid #A5BAE9;">
                    <?php $col = false; for ($i=0; $i<count($this->importedCandidates) && $i<=10; $i++): $candidate = $this->importedCandidates[$i]; ?>
                    <tr>
                        <td nowrap="nowrap"<?php echo (($col = !$col) ? ' style="background-color: #EDF3FF;"' : ''); ?>>
                            <a href="<?php echo $candidate['url']; ?>"><?php echo $candidate['name']; ?></a> -
                            <?php echo $candidate['location']; ?>
                        </td>
                    </tr>
                    <?php if ($i == 10 && count($this->importedCandidates) > 10): ?>
                    <tr>
                        <td nowrap="nowrap"<?php echo (($col = !$col) ? ' style="background-color: #EDF3FF;"' : ''); ?>>
                            ... <span style="color: #666666; font-style: italic;"><?php echo number_format(count($this->importedCandidates)-10,0); ?> Candidatos no mostrados</span>
                        </td>
                    </tr>
                    <?php endif; ?>
                    <?php endfor; ?>
                </table>
                <?php if (count($this->importedDuplicates)): ?>
                <br />
                <span style="font-weight: bold; color: #800000;">
                <?php echo number_format(count($this->importedDuplicates), 0); ?> Los candidatos fueron duplicados y no añadidos.
                </span>
                <?php endif; ?>
            </td>
            <td width="10%">&nbsp;</td>
            <?php else: ?>
            <td colpan="2" width="1">&nbsp;</td>
            <?php endif; ?>
            <td <?php if (LicenseUtility::isParsingEnabled()): ?>width="45%" <?php endif; ?>valign="top">
                <span style="font-size: 18px; font-weight: bold;">
                <font color="blue"><?php echo count($this->importedDocuments); ?></font> Reanudar Documento<?php echo count($this->importedDocuments) != 1 ? 's' : ''; ?> Guardado
                </span>
                <p />
                Un documento de currículum es un archivo que no se puede convertir en un candidato porque le falta una clave
                información (como el nombre del candidato). Estos archivos se han guardado y se pueden buscar en texto completo. Ellos
                deben convertirse en candidatos manualmente.
                <p />
                <b>Resumen del Documento:</b>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color: #F8FAFF; padding: 10px; border: 1px solid #A5BAE9;">
                    <?php $col = false; for ($i=0; $i<count($this->importedDocuments) && $i<=10; $i++): $document = $this->importedDocuments[$i]; ?>
                    <tr>
                        <td nowrap="nowrap"<?php echo (($col = !$col) ? ' style="background-color: #EDF3FF;"' : ''); ?>>
                            <?php echo $document['name']; ?>
                        </td>
                    </tr>
                    <?php if ($i == 10 && count($this->importedDocuments) > 10): ?>
                    <tr>
                        <td nowrap="nowrap"<?php echo (($col = !$col) ? ' style="background-color: #EDF3FF;"' : ''); ?>>
                            ... <span style="color: #666666; font-style: italic;"><?php echo number_format(count($this->importedDocuments)-10,0); ?> documents not shown</span>
                        </td>
                    </tr>
                    <?php endif; ?>
                    <?php endfor; ?>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top" style="padding-top: 20px;">
                <br /><br />
                <span style="font-size: 18px; font-weight: bold;">
                <font color="red"><?php echo count($this->importedFailed); ?></font> Documento<?php echo count($this->importedFailed) != 1 ? 's' : ''; ?> No se pudo importar
                </span>
                <p />
                Un documento no se puede importar porque está dañado o CATS no sabe cómo abrirlo. usted
                podría intentar convertir estos archivos a formatos compatibles con CATS como Microsoft Word, Adobe PDF o como
                archivos de texto sin formato utilizando la aplicación adecuada.
                <p />
                <b>Documentos Fallidos:</b>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color: #F8FAFF; padding: 10px; border: 1px solid #A5BAE9;">
                    <?php $col = false; for ($i=0; $i<count($this->importedFailed); $i++): $failed = $this->importedFailed[$i]; ?>
                    <tr>
                        <td nowrap="nowrap"<?php echo (($col = !$col) ? ' style="background-color: #EDF3FF;"' : ''); ?>>
                            <?php echo $failed['name']; ?>
                        </td>
                    </tr>
                    <?php endfor; ?>
                </table>
            </td>
        </tr>
    </table>

</div>