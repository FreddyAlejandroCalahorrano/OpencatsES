/*
 * CATS
 * Job Orders Form Validation
 *
 * Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
 * All rights reserved.
 *
 * $Id: validator.js 3634 2007-11-16 16:41:47Z brian $
 */

function checkAddForm(form)
{
    var errorMessage = '';

    errorMessage += checkTitle();
    errorMessage += checkCompany();
    errorMessage += checkRecruiter();
    errorMessage += checkCity();
    errorMessage += checkState();
    errorMessage += checkOpenings();

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkEditForm(form)
{
    var errorMessage = '';

    errorMessage += checkTitle();
    errorMessage += checkCompany();
    errorMessage += checkRecruiter();
    errorMessage += checkCity();
    errorMessage += checkState();
    errorMessage += checkOpenings();
    errorMessage += checkOpeningsAvailable();
    errorMessage += checkOwner();

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkSearchByJobTitleForm(form)
{
    var errorMessage = '';

    errorMessage += checkSearchJobTitle();

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkSearchByCompanyNameForm(form)
{
    var errorMessage = '';

    errorMessage += checkSearchCompanyName();

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkAttachmentForm(form)
{
    var errorMessage = '';

    errorMessage += checkFilename();

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkTitle()
{
    var errorMessage = '';

    fieldValue = document.getElementById('title').value;
    fieldLabel = document.getElementById('titleLabel');
    if (fieldValue.trim() == '')
    {
        errorMessage = "    - Debe ingresar un puesto de trabajo.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkCity()
{
    var errorMessage = '';

    fieldValue = document.getElementById('city').value;
    fieldLabel = document.getElementById('cityLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Usted debe ingresar una ciudad.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkState()
{
    var errorMessage = '';

    fieldValue = document.getElementById('state').value;
    fieldLabel = document.getElementById('stateLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debes ingresar a una provincia.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkCompany()
{
    var errorMessage = '';

    fieldValue = document.getElementById('companyID').value;
    fieldLabel = document.getElementById('companyIDLabel');
    if (fieldValue <= 0)
    {
        errorMessage = "    - Debes seleccionar una empresa.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkRecruiter()
{
    var errorMessage = '';

    fieldValue = document.getElementById('recruiter').selectedIndex;
    fieldLabel = document.getElementById('recruiterLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debes seleccionar un reclutador.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkOwner()
{
    var errorMessage = '';

    fieldValue = document.getElementById('owner').selectedIndex;
    fieldLabel = document.getElementById('ownerLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debes seleccionar un dueño.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkOpenings()
{
    var errorMessage = '';

    fieldValue = document.getElementById('openings').value;
    fieldLabel = document.getElementById('openingsLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debes ingresar una cantidad de vacantes.\n\n";

        fieldLabel.style.color = '#ff0000';
    }
    else if (!stringIsNumeric(fieldValue))
    {
        errorMessage = "    - Las vacantes deben ser un número.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkOpeningsAvailable()
{
    var errorMessage = '';

    fieldValue = document.getElementById('openingsAvailable').value;
    fieldLabel = document.getElementById('openingsAvailableLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debes ingresar una cantidad de vacantes.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else if (!stringIsNumeric(fieldValue))
    {
        errorMessage = "    - Las vacantes deben ser un número.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }
    
    fieldValueToCompare = document.getElementById('openings').value;
    if (stringIsNumeric(fieldValueToCompare) && stringIsNumeric(fieldValue) &&
        fieldValue > fieldValueToCompare) 
    {
        errorMessage = "    - Las vacantes restantes no pueden ser más de "+fieldValueToCompare+".\n";

        fieldLabel.style.color = '#ff0000';            
    }    

    return errorMessage;
}


function checkSearchJobTitle()
{
    var errorMessage = '';

    fieldValue = document.getElementById('wildCardString_jobTitle').value;
    fieldLabel = document.getElementById('wildCardStringLabel_jobTitle');
    if (fieldValue == '')
    {
        errorMessage = "    - Debes ingresar algún texto de búsqueda.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkSearchCompanyName()
{
    var errorMessage = '';

    fieldValue = document.getElementById('wildCardString_companyName').value;
    fieldLabel = document.getElementById('wildCardStringLabel_companyName');
    if (fieldValue == '')
    {
        errorMessage = "    - Debes ingresar algún texto de búsqueda.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkFilename()
{
    var errorMessage = '';

    fieldValue = document.getElementById('file').value;
    fieldLabel = document.getElementById('file');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe ingresar un archivo para cargar.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}



