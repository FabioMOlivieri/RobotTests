*** Settings ***
Suite Setup       AbrirNavegador    ${gWebUrlUat}    ${gBrowserChrome}
Suite Teardown    CerrarTodo
Test Template     TestCredencialesIncorrectas
Library           SeleniumLibrary
Resource          ../../Resources/UI/General.robot
Resource          ../../Resources/UI/Login.robot
Resource          ../../Resources/VariablesGenerales.robot

*** Test Cases ***    usaurio           contrasenia
ok Timbues            fabio.olivieri    Colorado111

ok BB                 faboo.olivieri    Colorado8888

*** Keywords ***
TestCredencialesIncorrectas
    [Arguments]    ${usuario}    ${contrasenia}
    Ingresar Usuario    ${usuario}
    Ingresar Contrasenia    ${contrasenia}
    Presionar Ingresar
    Validar mensaje    Credenciales incorrectas
