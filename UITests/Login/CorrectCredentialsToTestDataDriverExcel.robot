*** Settings ***
Suite Teardown    CerrarTodo
Test Template     TestCredencialesCorrectas
Resource          ../../Resources/UI/General.robot
Resource          ../../Resources/UI/Login.robot
Resource          ../../Resources/VariablesGenerales.robot
Library           SeleniumLibrary
Library           DataDriver    ${FilePathExcel}    sheet_name=${HojaExcel}

*** Test Cases ***    usaurio        contrasenia        Terminal
TestLoginWithExcel    ${eUsuario}    ${eContrasenia}    ${eTerminal}

*** Keywords ***
TestCredencialesCorrectas
    [Arguments]    ${eUsuario}    ${eContrasenia}    ${eTerminal}
    AbrirNavegador    ${gWebUrlUat}    ${gBrowserChrome}
    Ingresar Usuario    ${eUsuario}
    Ingresar Contrasenia    ${eContrasenia}
    Presionar Ingresar
    Seleccionar Terminal    ${eTerminal}
    Presionar Ingresar
    sleep    1
    Page Should Contain    UAT
    Close Browser
