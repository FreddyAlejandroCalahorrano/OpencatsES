<?php /* $Id: Show.tpl 3582 2007-11-12 22:58:48Z brian $ */
include_once('./vendor/autoload.php');
use OpenCATS\UI\QuickActionMenu;
?>
<?php TemplateUtility::printHeader('Company - '.$this->data['name'], array( 'js/sorttable.js', 'js/attachment.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/companies.gif" width="24" height="24" border="0" alt="Companies" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Empresas: Detalles de la Empresa</h2></td>
               </tr>
            </table>

            <p class="note">Detalles de la Empresa</p>

            <table class="detailsOutside">
                <tr style="vertical-align:top;">
                    <td width="50%" height="100%">
                        <table class="detailsInside" height="100%">
                            <tr>
                                <td class="vertical">Nombre:</td>
                                <td class="data">
                                    <span class="<?php echo($this->data['titleClass']); ?>"><?php $this->_($this->data['name']); ?></span>
                                    <?php TemplateUtility::printSingleQuickActionMenu(new QuickActionMenu(DATA_ITEM_COMPANY, $this->companyID, $_SESSION['CATS']->getAccessLevel('companies.edit'))); ?>
                                </td>
                            </tr>

                            <!-- CONTACT INFO -->

                            <tr>
                                <td class="vertical">Teléfono Principal:</td>
                                <td class="data"><?php $this->_($this->data['phone1']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Teléfono Secundario:</td>
                                <td class="data"><?php $this->_($this->data['phone2']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Número de Fax:</td>
                                <td class="data"><?php $this->_($this->data['faxNumber']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Dirección:</td>
                                <td class="data"><?php echo(nl2br(htmlspecialchars($this->data['address']))); ?>&nbsp;
                                <?php echo($this->data['googleMaps']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">&nbsp;</td>
                                <td class="data">
                                    <?php $this->_($this->data['cityAndState']); ?>
                                    <?php $this->_($this->data['zip']); ?>
                                </td>
                            </tr>

                            <?php for ($i = 0; $i < intval(count($this->extraFieldRS)/2); $i++): ?>
                               <tr>
                                    <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                    <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>
                               </tr>
                            <?php endfor; ?>

                            <!-- /CONTACT INFO -->
                       </table>
                    </td>

                    <td width="50%" height="100%">
                        <table class="detailsInside" height="100%">
                        <!-- CONTACT INFO -->

                            <tr>
                                <td class="vertical">Contacto de Facturación:</td>
                                <td class="data">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php echo($this->data['billingContact']); ?>">
                                        <?php $this->_($this->data['billingContactFullName']); ?>
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td class="vertical">Sitio Web:</td>
                                <td class="data">
                                    <a href="<?php $this->_($this->data['url']); ?>" target="_blank">
                                        <?php $this->_($this->data['url']); ?>
                                    </a>
                                </td>
                            </tr>

                        <!-- /CONTACT INFO -->

                            <tr>
                                <td class="vertical">Tecnologías Clave:</td>
                                <td class="data"><?php $this->_($this->data['keyTechnologies']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">Creado:</td>
                                <td class="data"><?php $this->_($this->data['dateCreated']); ?> (<?php $this->_($this->data['enteredByFullName']); ?>)</td>
                            </tr>

                            <tr>
                                <td class="vertical">Dueño</td>
                                <td class="data"><?php $this->_($this->data['ownerFullName']); ?></td>
                            </tr>

                            <tr>
                                <td class="vertical">&nbsp;</td>
                                <td class="data">&nbsp;</td>
                            </tr>

                        <!-- CONTACT INFO -->

                            <?php for ($i = (intval(count($this->extraFieldRS))/2); $i < (count($this->extraFieldRS)); $i++): ?>
                                <tr>
                                    <td class="vertical"><?php $this->_($this->extraFieldRS[$i]['fieldName']); ?>:</td>
                                    <td class="data"><?php echo($this->extraFieldRS[$i]['display']); ?></td>                                </tr>
                            <?php endfor; ?>

                        <!-- /CONTACT INFO -->
                        </table>
                    </td>
                </tr>
            </table>

            <!-- CONTACT INFO -->
            <?php if (count($this->departmentsRS) > 0): ?>
                <table class="detailsOutside">
                    <tr>
                        <td>
                            <table class="detailsInside">
                                <tr>
                                    <td valign="top" class="vertical">Departamentos:</td>
                                    <td valign="top" class="data">
                                        <?php foreach ($this->departmentsRS as $departmentRecord): ?>
                                            <?php $this->_($departmentRecord['name']); ?>
                                            <br />
                                        <?php endforeach; ?>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            <?php endif; ?>
            <!-- /CONTACT INFO -->

            <!-- CONTACT INFO -->
            <table class="detailsOutside">
                <tr>
                    <td>
                        <table class="detailsInside">
                            <tr>
                                <td valign="top" class="vertical">Archivos Adjuntos:</td>
                                <td valign="top" class="data">
                                    <table class="attachmentsTable">
                                        <?php foreach ($this->attachmentsRS as $rowNumber => $attachmentsData): ?>
                                            <tr>
                                                <td>
                                                    <?php echo $attachmentsData['retrievalLink']; ?>
                                                        <img src="<?php $this->_($attachmentsData['attachmentIcon']) ?>" alt="" width="16" height="16" border="0" />
                                                        &nbsp;
                                                        <?php $this->_($attachmentsData['originalFilename']) ?>
                                                    </a>
                                                </td>
                                                <td><?php $this->_($attachmentsData['dateCreated']) ?></td>
                                                <td>
                                                    <?php if ($this->getUserAccessLevel('companies.deleteAttachment') >= ACCESS_LEVEL_DELETE): ?>
                                                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=deleteAttachment&amp;companyID=<?php echo($this->companyID); ?>&amp;attachmentID=<?php $this->_($attachmentsData['attachmentID']) ?>"  title="Borrar" onclick="javascript:return confirm('Eliminar este archivo Adjunto?');">
                                                            <img src="images/actions/delete.gif" alt="" width="16" height="16" border="0" />
                                                        </a>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </table>
                                    <?php if ($this->getUserAccessLevel('companies.createAttachment') >= ACCESS_LEVEL_EDIT): ?>
                                            <?php if (isset($this->attachmentLinkHTML)): ?>
                                                <?php echo($this->attachmentLinkHTML); ?>
                                            <?php else: ?>
                                                <a href="#" onclick="showPopWin('<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=createAttachment&amp;companyID=<?php echo($this->companyID); ?>', 400, 125, null); return false;">
                                            <?php endif; ?>
                                            <img src="images/paperclip_add.gif" width="16" height="16" border="0" alt="add attachment" class="absmiddle" />&nbsp;Añadir Archivo Adjunto
                                        </a>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="vertical">Notas:</td>
                                <?php if ($this->isShortNotes): ?>
                                    <td id="shortNotes" style="display:block;" class="data">
                                        <?php echo($this->data['shortNotes']); ?><span class="moreText">...</span>&nbsp;
                                        <p><a href="#" class="moreText" onclick="toggleNotes(); return false;">[More]</a></p>
                                    </td>
                                    <td id="fullNotes" style="display:none;" class="data">
                                        <?php echo($this->data['notes']); ?>&nbsp;
                                        <p><a href="#" class="moreText" onclick="toggleNotes(); return false;">[Less]</a></p>
                                    </td>
                                <?php else: ?>
                                    <td id="shortNotes" style="display:block;" class="data">
                                        <?php echo($this->data['notes']); ?>
                                    </td>
                                <?php endif; ?>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!-- /CONTACT INFO -->

            <?php if ($this->getUserAccessLevel('companies.edit') >= ACCESS_LEVEL_EDIT): ?>
                <a id="edit_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=edit&amp;companyID=<?php echo($this->companyID); ?>">
                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />&nbsp;Editar
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <?php endif; ?>
            <?php if ($this->getUserAccessLevel('companies.delete') >= ACCESS_LEVEL_DELETE && $this->data['defaultCompany'] != 1): ?>
                <a id="delete_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=companies&amp;a=delete&amp;companyID=<?php echo($this->companyID); ?>" onclick="javascript:return confirm('Desea Eliminar esta Empresa?');">
                    <img src="images/actions/delete.gif" width="16" height="16" class="absmiddle" alt="delete" border="0" />&nbsp;Borrar
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <?php endif; ?>
            <?php if ($this->privledgedUser): ?>
                <a id="history_link" href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=viewItemHistory&amp;dataItemType=200&amp;dataItemID=<?php echo($this->companyID); ?>">
                    <img src="images/icon_clock.gif" width="16" height="16" class="absmiddle"  border="0" />&nbsp;Ver Historial
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <?php endif; ?>
            <br clear="all" />
            <br />

            <p class="note">Órdenes de Trabajo </p>
            <table class="sortable">
                <tr>
                    <th align="left" width="30" nowrap="nowrap">ID</th>
                    <th align="left" width="200">Título</th>
                    <th align="left" width="15">Tipo</th>
                    <th align="left" width="15">Estado</th>
                    <th align="left" width="60">Creado</th>
                    <th align="left" width="60">Modificado</th>
                    <th align="left" width="60">Inicio</th>
                    <th align="left" width="15">Años</th>
                    <th align="left" width="10">S</th>
                    <th align="left" width="10">P</th>
                    <th align="left" width="65">Reclutador</th>
                    <th align="left" width="68">Dueño</th>
                    <th align="left" width="25">Acción</th>
                </tr>

                <?php foreach ($this->jobOrdersRS as $rowNumber => $jobOrdersData): ?>
                    <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['jobOrderID']) ?></td>
                        <td valign="top">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=show&amp;jobOrderID=<?php $this->_($jobOrdersData['jobOrderID']) ?>">
                                <?php $this->_($jobOrdersData['title']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['type']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['status']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['dateCreated']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['dateModified']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['startDate']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['daysOld']) ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['submitted']); ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['pipeline']); ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['recruiterAbbrName']); ?></td>
                        <td valign="top" align="left"><?php $this->_($jobOrdersData['ownerAbbrName']); ?></td>
                        <td valign="top" align="center">
                            <?php if ($this->getUserAccessLevel('joborders.edit') >= ACCESS_LEVEL_EDIT): ?>
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=edit&amp;jobOrderID=<?php $this->_($jobOrdersData['jobOrderID']) ?>">
                                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>

            <?php if ($this->getUserAccessLevel('joborders.add') >= ACCESS_LEVEL_EDIT): ?>
                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=joborders&amp;a=add&amp;selected_company_id=<?php echo($this->companyID); ?>" title="Agregar Orden de Trabajo">
                    <img src="images/actions/job_order.gif" width="16" height="16" class="absmiddle" alt="New Job Order" border="0" /> Agregar Orden de Trabajo
                </a>
            <?php endif; ?>
            <br clear="all" />
            <br />

            <!-- CONTACT INFO -->
            <p class="note">Contactos</p>
            <table class="sortable">
                <tr>
                    <th align="left" nowrap="nowrap">Nombre</th>
                    <th align="left" nowrap="nowrap">Apellido</th>
                    <th align="left">Titulo</th>
                    <th align="left">Departamento</th>
                    <th align="left" nowrap="nowrap">Teléfono de Trabajo</th>
                    <th align="left" nowrap="nowrap">Teléfono Celular</th>
                    <th align="left">Creado</th>
                    <th align="left">Dueño</th>
                    <th align="center">Acción</th>
                </tr>

                <?php if (count($this->contactsRSWC) != 0): ?>
                 <?php foreach ($this->contactsRSWC as $rowNumber => $contactsData): ?>
                    <tr id="ContactsDefault<?php echo($rowNumber) ?>" class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php $this->_($contactsData['contactID']) ?>" class="<?php $this->_($contactsData['linkClass']); ?>">
                                <?php $this->_($contactsData['firstName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php $this->_($contactsData['contactID']) ?>" class="<?php $this->_($contactsData['linkClass']); ?>">
                                <?php $this->_($contactsData['lastName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left"><?php $this->_($contactsData['title']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['department']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['phoneWork']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['phoneCell']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['dateCreated']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['ownerAbbrName']); ?></td>
                        <td valign="top" align="center">
                            <?php if (!empty($contactsData['email1'])): ?>
                                <a href="mailto:<?php $this->_($contactsData['email1']); ?>" title="Send E-Mail (<?php $this->_($contactsData['email1']); ?>)">
                                    <img src="images/actions/email.gif" width="16" height="16" alt="" class="absmiddle" border="0" />
                                </a>
                            <?php else: ?>
                                <img src="images/actions/email_no.gif" title="No E-Mail Address" width="16" height="16" alt="" class="absmiddle" border="0" />
                            <?php endif; ?>
                            <?php if ($this->getUserAccessLevel('contacts.edit') >= ACCESS_LEVEL_EDIT): ?>
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=edit&amp;contactID=<?php $this->_($contactsData['contactID']) ?>">
                                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
               <?php endif; ?>

                <?php /* The following are hidden by default */ ?>
                <?php if (count($this->contactsRSWC) != count($this->contactsRS) && count($this->contactsRS) != 0) : ?>
                 <?php foreach ($this->contactsRS as $rowNumber => $contactsData): ?>
                    <tr id="ContactsFull<?php echo($rowNumber) ?>" class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>" style="display:none;">
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php $this->_($contactsData['contactID']) ?>" class="<?php $this->_($contactsData['linkClass']); ?>">
                                <?php $this->_($contactsData['firstName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left">
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=show&amp;contactID=<?php $this->_($contactsData['contactID']) ?>" class="<?php $this->_($contactsData['linkClass']); ?>">
                                <?php $this->_($contactsData['lastName']) ?>
                            </a>
                        </td>
                        <td valign="top" align="left"><?php $this->_($contactsData['title']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['department']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['phoneWork']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['phoneCell']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['dateCreated']) ?></td>
                        <td valign="top" align="left"><?php $this->_($contactsData['ownerAbbrName']); ?></td>
                        <td valign="top" align="center">
                            <?php if (!empty($contactsData['email1'])): ?>
                                <a href="mailto:<?php $this->_($contactsData['email1']); ?>">
                                    <img src="images/actions/email.gif" width="16" height="16" alt="" class="absmiddle" border="0" title="Send E-Mail (<?php $this->_($contactsData['email1']); ?>)"/>
                                </a>
                            <?php else: ?>
                                <img src="images/actions/email_no.gif" title="No E-Mail Address" width="16" height="16" alt="" class="absmiddle" border="0" />
                            <?php endif; ?>
                            <?php if ($this->getUserAccessLevel('contacts.edit') >= ACCESS_LEVEL_EDIT): ?>
                                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=edit&amp;contactID=<?php $this->_($contactsData['contactID']) ?>">
                                    <img src="images/actions/edit.gif" width="16" height="16" class="absmiddle" alt="edit" border="0" />
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                 <?php endforeach; ?>
                <?php endif; ?>

            </table>

            <?php if ($this->getUserAccessLevel('contacts.add') >= ACCESS_LEVEL_EDIT): ?>
                <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=contacts&amp;a=add&amp;selected_company_id=<?php echo($this->companyID); ?>" title="Add Contact">
                    <img src="images/actions/add_contact.gif" width="16" height="16" class="absmiddle" alt="add contact" border="0" title="Agregar Contacto"/>&nbsp;Agregar Contacto
                </a>
            <?php endif; ?>
            <?php if (count($this->contactsRSWC) != count($this->contactsRS)) : ?>
                &nbsp;
                <a href="javascript:void(0)" id="linkShowAll" onclick="javascript:for (i = 0; i< <?php echo(count($this->contactsRSWC)); ?>; i++) document.getElementById('ContactsDefault'+i).style.display='none'; for (i = 0; i< <?php echo(count($this->contactsRS)); ?>; i++) document.getElementById('ContactsFull'+i).style.display=''; document.getElementById('linkShowAll').style.display='none'; document.getElementById('linkHideSome').style.display='';">
                    <img src="images/actions/add_contact.gif" width="16" height="16" class="absmiddle" alt="add contact" border="0" title="Mostrar Todo"/>
                    &nbsp;Mostrar contactos que se fueron (<?php echo(count($this->contactsRS) - count($this->contactsRSWC)); ?>)
                </a>
                <a href="javascript:void(0)" id="linkHideSome" style="display:none;" onclick="javascript:for (i = 0; i< <?php echo(count($this->contactsRSWC)); ?>; i++) document.getElementById('ContactsDefault'+i).style.display=''; for (i = 0; i< <?php echo(count($this->contactsRS)); ?>; i++) document.getElementById('ContactsFull'+i).style.display='none'; document.getElementById('linkShowAll').style.display=''; document.getElementById('linkHideSome').style.display='none';">
                    <img src="images/actions/add_contact.gif" width="16" height="16" class="absmiddle" alt="add contact" border="0" title="Ocultar Algunos"/>
                    &nbsp;Ocultar contactos que se han ido (<?php echo(count($this->contactsRS) - count($this->contactsRSWC)); ?>)
                </a>
            <?php endif; ?>
            <!-- /CONTACT INFO -->
        </div>
    </div>

<?php TemplateUtility::printFooter(); ?>
