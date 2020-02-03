*** Settings ***
Library           SeleniumLibrary
Resource          General.robot

*** Variables ***
${locTxtUsuario}    id:usuario
${locTxtContrasenia}    id:contrasenia
${locBtnIngresar}    xpath:/html/body/yrd-root/yrd-login/div[1]/div/form/div[3]/button
${locDdlTerminal}    id:selectTerminal
${locMensajes}    xpath://*[@id="toast-container"]
${FilePathExcel}    ../../ExternalFiles/ParametrosVerificarCredencialesIncorrectas.xlsx
${HojaExcel}      datos

*** Keywords ***
Ingresar Usuario
    [Arguments]    ${aUser}
    ${txtUsuario}    Capturar Elemento    ${locTxtUsuario}
    Ingresar Texto    ${txtUsuario}    ${aUser}

Ingresar Contrasenia
    [Arguments]    ${aPass}
    ${txtContrasenia}    Capturar Elemento    ${locTxtContrasenia}
    Ingresar Texto    ${txtContrasenia}    ${aPass}

Presionar Ingresar
    ${btnIngresar}    Capturar Elemento    ${locBtnIngresar}
    Presionar Boton    ${btnIngresar}

Seleccionar Terminal
    [Arguments]    ${aValor}
    ${ddlTerminal}    Capturar Elemento    ${locDdlTerminal}
    Elegir Opcion Lista Por Valor    ${ddlTerminal}    ${aValor}

Guardar Token
    ${localStorageToken}=    Execute Javascript    return window.localStorage.getItem("YardToken")
    ${BearerToken}=    Catenate    Bearer    ${localStorageToken}
    Set Global Variable    ${AutToken}    ${BearerToken}

Validar mensaje
    [Arguments]    ${aMsj}
    ${lblMensaje}    Capturar Elemento    ${locMensajes}
    Element Should Contain    ${lblMensaje}    ${aMsj}

Iniciar Aplicacion
    [Arguments]    ${aUrl}    ${aBrowser}    ${aUsuario}    ${aContrasenia}    ${aTerminal}
    AbrirNavegador    ${aUrl}    ${aBrowser}
    Ingresar Usuario    ${aUsuario}
    Ingresar Contrasenia    ${aContrasenia}
    Presionar Ingresar
    Seleccionar Terminal    ${aTerminal}
    Presionar Ingresar
    sleep    5
    Guardar Token
