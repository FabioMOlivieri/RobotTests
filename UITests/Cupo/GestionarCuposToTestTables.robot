*** Settings ***
Suite Setup       Iniciar Aplicacion    ${gWebUrlUat}    ${gBrowserChrome}    ${gUser}    ${gContrasenia}    ${gIDTerminalTimbues}
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          ../../Resources/UI/General.robot
Resource          ../../Resources/UI/Login.robot
Resource          ../../Resources/UI/Menu.robot
Resource          ../../Resources/UI/GestionarCupo.robot
Resource          ../../Resources/VariablesGenerales.robot

*** Test Cases ***
TestTable
    Ir a Gestionar Cupo
    Presionar Buscar
    sleep    3
    ${cantFilas}    Obtener Cantidad Filas
    FOR    ${i}    IN RANGE    1    ${cantFilas}+1
        ${celda}    Obtener Valor Celda    ${i}    4
        Exit For Loop If    ${celda}==453453453453
    END
    Seleccionar Fila    ${i}
    Presionar Consultar
    CerrarPantalla
