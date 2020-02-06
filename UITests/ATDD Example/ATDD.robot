*** Settings ***
Library           SeleniumLibrary
Resource          ../../Resources/UI/General.robot
Resource          ../../Resources/UI/Login.robot
Resource          ../../Resources/UI/Menu.robot
Resource          ../../Resources/UI/GestionarCupo.robot
Resource          ../../Resources/VariablesGenerales.robot    

*** Test Cases ***   
Scenario: Probar formato ATDD
    Given El usuario Administrador ingresa a Gestionar Cupo
    When Realiza la busqueda por XXX con valor YYY
    Then Las filas devueltas deben ser mayores a 2

*** Keywords ***
El usuario ${rol} ingresa a Gestionar Cupo
    #el ejemplo debería obtener el usuario y contraseña del rol. para simplificar el ej lo toma de la variable global
    Iniciar Aplicacion  ${gWebUrlUat}  ${gBrowserChrome}  ${gUser}  ${gContrasenia}  ${gIDTerminalTimbues}    
    Ir a Gestionar Cupo

Realiza la busqueda por ${campoFiltro} con valor ${ValorFiltro}
    #el ejemplo debería invocar una keyword donde filtre por el campo con el valor de filtro.  lo dejo así para simplificar el ejemplo.
    Presionar Buscar

Las filas devueltas deben ser mayores a ${cantfilas}
    sleep    3
    ${cantFilasDevueltas}    Obtener Cantidad Filas
    Should Be True  ${cantfilas} < ${cantFilasDevueltas} 
