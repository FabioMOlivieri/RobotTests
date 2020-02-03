*** Settings ***
Suite Setup       Iniciar Aplicacion    ${gWebUrlUat}    ${gBrowserChrome}    ${gUser}    ${gContrasenia}    ${gIDTerminalTimbues}
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          ../../Resources/UI/General.robot
Resource          ../../Resources/UI/Login.robot
Resource          ../../Resources/UI/ValidarCupo.robot
Resource          ../../Resources/UI/Menu.robot
Resource          ../../Resources/VariablesGenerales.robot

*** Test Cases ***
TestNavegation
    Ir a Validar Cupo
    Ingresar Documento Porte    123456789
    Seleccionar Sin Cupo
    Scrollear Hasta Final Pagina
    Presionar Cancelar
    Presionar No en Confirmacion
    CerrarPantalla
