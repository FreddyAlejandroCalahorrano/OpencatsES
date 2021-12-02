/*
 * CATS
 * Candidates Form Validation
 *
 * Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
 *
 *
 * The contents of this file are subject to the CATS Public License
 * Version 1.1a (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.catsone.com/.
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is "CATS Standard Edition".
 *
 * The Initial Developer of the Original Code is Cognizo Technologies, Inc.
 * Portions created by the Initial Developer are Copyright (C) 2005 - 2007
 * (or from the year in which this file was created to the year 2007) by
 * Cognizo Technologies, Inc. All Rights Reserved.
 *
 *
 * $Id: validator.js 1479 2007-01-17 00:22:21Z will $
 */

function checkChangePasswordForm(form)
{
    var errorMessage = '';

    errorMessage += checkCurrentPassword();
    errorMessage += checkNewPassword();
    errorMessage += checkRetypeNewPassword();

    if (errorMessage == '')
    {
        errorMessage += checkPasswordsMatch();
    }

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkAddUserForm(form)
{
    var errorMessage = '';

    errorMessage += checkUserFirstName();
    errorMessage += checkUserLastName();
    errorMessage += checkUserUsername();
    errorMessage += checkUserPassword();
    errorMessage += checkUserRetypePassword();

    if (errorMessage == '')
    {
        errorMessage += checkUserPasswordsMatch();
    }

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkEditUserForm(form)
{
    var errorMessage = '';

    errorMessage += checkUserFirstName();
    errorMessage += checkUserLastName();
    errorMessage += checkUserUsername();

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}

function checkSiteNameForm(form)
{
    var errorMessage = '';

    errorMessage += checkValidSiteName();

    if (errorMessage != '')
    {
        alert("Error de Formulario:\n" + errorMessage);
        return false;
    }

    return true;
}


function checkUserFirstName()
{
    var errorMessage = '';

    fieldValue = document.getElementById('firstName').value;
    fieldLabel = document.getElementById('firstNameLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar un Nombre.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkUserLastName()
{
    var errorMessage = '';

    fieldValue = document.getElementById('lastName').value;
    fieldLabel = document.getElementById('lastNameLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar un Apellido.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkUserUsername()
{
    var errorMessage = '';

    fieldValue = document.getElementById('username').value;
    fieldLabel = document.getElementById('usernameLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar un Nombre de Usuario.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkUserPassword()
{
    var errorMessage = '';

    fieldValue = document.getElementById('password').value;
    fieldLabel = document.getElementById('passwordLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar una Contraseña.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkUserRetypePassword()
{
    var errorMessage = '';

    fieldValue = document.getElementById('retypePassword').value;
    fieldLabel = document.getElementById('retypePasswordLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar una Contraseña en Ambos Campos.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkUserPasswordsMatch()
{
    var errorMessage = '';

    fieldValue1 = document.getElementById('password').value;
    fieldValue2 = document.getElementById('retypePassword').value;

    fieldLabel1 = document.getElementById('passwordLabel');
    fieldLabel2 = document.getElementById('retypePasswordLabel');

    if (fieldValue1 != fieldValue2)
    {
        errorMessage = "    - Las dos Contraseñas que Ingresó no Coinciden.\n";

        fieldLabel1.style.color = '#ff0000';
        fieldLabel2.style.color = '#ff0000';
    }
    else
    {
        fieldLabel1.style.color = '#000';
        fieldLabel2.style.color = '#000';
    }

    return errorMessage;
}

function checkCurrentPassword()
{
    var errorMessage = '';

    fieldValue = document.getElementById('currentPassword').value;
    fieldLabel = document.getElementById('currentPasswordLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar su Contraseña Actual\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkNewPassword()
{
    var errorMessage = '';

    fieldValue = document.getElementById('newPassword').value;
    fieldLabel = document.getElementById('newPasswordLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar una Nueva Contraseña.\n";

        fieldLabel.style.color = '#FF0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkRetypeNewPassword()
{
    var errorMessage = '';

    fieldValue = document.getElementById('retypeNewPassword').value;
    fieldLabel = document.getElementById('retypeNewPasswordLabel');
    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar su Nueva Contraseña en Ambos Campos.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
        fieldLabel.style.color = '#000';
    }

    return errorMessage;
}

function checkPasswordsMatch()
{
    var errorMessage = '';

    fieldValue1 = document.getElementById('newPassword').value;
    fieldValue2 = document.getElementById('retypeNewPassword').value;

    fieldLabel1 = document.getElementById('newPasswordLabel');
    fieldLabel2 = document.getElementById('retypeNewPasswordLabel');

    if (fieldValue1 != fieldValue2)
    {
        errorMessage = "    - Las dos Contraseñas que Ingresó no Coinciden.\n";

        fieldLabel1.style.color = '#ff0000';
        fieldLabel2.style.color = '#ff0000';
    }
    else
    {
        fieldLabel1.style.color = '#000';
        fieldLabel2.style.color = '#000';
    }

    return errorMessage;
}

function checkValidSiteName()
{
    var errorMessage = '';
    fieldValue = document.getElementById('siteName').value;
    fieldLabel = document.getElementById('siteNameLabel');

    if (fieldValue == '')
    {
        errorMessage = "    - Debe Ingresar un Nombre de Sitio.\n";

        fieldLabel.style.color = '#ff0000';
    }
    else
    {
       fieldLabel.style.color = '#000';
    }
    return errorMessage;
}