<?php

//TODO: License

include_once(LEGACY_ROOT . '/lib/Candidates.php');
include_once(LEGACY_ROOT . '/lib/Width.php');

class candidatesListByViewDataGrid extends CandidatesDataGrid
{
    public function __construct($siteID, $parameters, $misc)
    {
        /* Pager configuration. */
        $this->_tableWidth = new Width(100, '%');
        $this->_defaultAlphabeticalSortBy = 'lastName';
        $this->ajaxMode = false;
        $this->showExportCheckboxes = true; //BOXES WILL NOT APPEAR UNLESS SQL ROW exportID IS RETURNED!
        $this->showActionArea = true;
        $this->showChooseColumnsBox = true;
        $this->allowResizing = true;
        $this->ignoreSavedColumnLayouts = true;

        $this->defaultSortBy = 'dateModifiedSort';
        $this->defaultSortDirection = 'DESC';

        $this->_defaultColumns = array(
            array('name' => 'Archivos Adjuntos', 'width' => 31),
            array('name' => 'Nombre', 'width' => 75),
            array('name' => 'Apellido', 'width' => 85),
            array('name' => 'Ciudad', 'width' => 75),
            array('name' => 'Provincia', 'width' => 50),
            array('name' => 'Habilidades', 'width' => 215),
            array('name' => 'Propietario', 'width' => 65),
            array('name' => 'Creado', 'width' => 60),
            array('name' => 'Modificado', 'width' => 60),
        );

         parent::__construct("candidates:candidatesListByViewDataGrid",
                             $siteID, $parameters, $misc
                        );
    }


    /**
     * Adds more options to the action area on the pager.  Overloads
     * DataGrid Inner Action Area function.
     *
     * @return html innerActionArea commands.
     */
    public function getInnerActionArea()
    {
        //TODO: Add items:
        //  - Add to List
        //  - Add to Job Order
        //  - Mass set rank (depends on each candidate having their own personal rank - are we going to do this?)
        $html = '';

        $html .= $this->getInnerActionAreaItemPopup('Add To List', CATSUtility::getIndexName().'?m=lists&amp;a=addToListFromDatagridModal&amp;dataItemType='.DATA_ITEM_CANDIDATE, 450, 350);
        
        if($_SESSION['CATS']->getAccessLevel('pipelines.addToPipeline') >= ACCESS_LEVEL_EDIT) 
        {
            $html .= $this->getInnerActionAreaItemPopup('Add To Job Order', CATSUtility::getIndexName().'?m=candidates&amp;a=considerForJobSearch', 750, 460);
        }
        
        if(MAIL_MAILER != 0 && $_SESSION['CATS']->getAccessLevel('candidates.emailCandidates') >= ACCESS_LEVEL_SA)
        {
            $html .= $this->getInnerActionAreaItem('Send E-Mail', CATSUtility::getIndexName().'?m=candidates&amp;a=emailCandidates');
        }
        $html .= $this->getInnerActionAreaItem('Export', CATSUtility::getIndexName().'?m=export&amp;a=exportByDataGrid');

        $html .= parent::getInnerActionArea();

        return $html;
    }
}

class candidatesSavedListByViewDataGrid extends CandidatesDataGrid
{
    public function __construct($siteID, $parameters, $misc)
    {
        $this->_tableWidth = new Width(100, '%');
        $this->_defaultAlphabeticalSortBy = 'lastName';
        $this->ajaxMode = false;
        $this->showExportCheckboxes = true; //BOXES WILL NOT APPEAR UNLESS SQL ROW exportID IS RETURNED!
        $this->showActionArea = true;
        $this->showChooseColumnsBox = true;
        $this->allowResizing = true;

        $this->defaultSortBy = 'dateModifiedSort';
        $this->defaultSortDirection = 'DESC';

        $this->_defaultColumns = array(
            array('name' => 'Archivos Adjuntos', 'width' => 31),
            array('name' => 'Nombre', 'width' => 75),
            array('name' => 'Apellido', 'width' => 85),
            array('name' => 'Ciudad', 'width' => 75),
            array('name' => 'Provincia', 'width' => 50),
            array('name' => 'Habilidades', 'width' => 200),
            array('name' => 'Propietario', 'width' => 65),
            array('name' => 'Modificado', 'width' => 60),
            array('name' => 'Agregado a la lista', 'width' => 75),
        );

         parent::__construct("candidates:candidatesSavedListByViewDataGrid",
                             $siteID, $parameters, $misc
                        );
    }

    /**
     * Adds more options to the action area on the pager.  Overloads
     * DataGrid Inner Action Area function.
     *
     * @return html innerActionArea commands.
     */
    public function getInnerActionArea()
    {
        //TODO: Add items:
        //  - Add to List
        //  - Add to Job Order
        //  - Mass set rank (depends on each candidate having their own personal rank - are we going to do this?)
        $html = '';

        $html .= $this->getInnerActionAreaItem('Remove From This List', CATSUtility::getIndexName().'?m=lists&amp;a=removeFromListDatagrid&amp;dataItemType='.DATA_ITEM_CANDIDATE.'&amp;savedListID='.$this->getMiscArgument(), false);
        $html .= $this->getInnerActionAreaItemPopup('Add To Job Order', CATSUtility::getIndexName().'?m=candidates&amp;a=considerForJobSearch', 750, 460);
        if(MAIL_MAILER != 0 && $_SESSION['CATS']->getAccessLevel('candidates.emailCandidates') >= ACCESS_LEVEL_SA)
        {
            $html .= $this->getInnerActionAreaItem('Send E-Mail', CATSUtility::getIndexName().'?m=candidates&amp;a=emailCandidates');
        }
        $html .= $this->getInnerActionAreaItem('Export', CATSUtility::getIndexName().'?m=export&amp;a=exportByDataGrid');

        $html .= parent::getInnerActionArea();

        return $html;
    }
}


?>