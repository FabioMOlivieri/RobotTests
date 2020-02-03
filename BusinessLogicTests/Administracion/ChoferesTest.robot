*** Settings ***
Suite Setup       Iniciar Aplicacion    ${gWebUrlUat}    ${gBrowserChrome}    ${gUser}    ${gContrasenia}    ${gIDTerminalTimbues}
Suite Teardown    Close All Browsers
Resource          ../../Resources/UI/Login.robot
Resource          ../../Resources/BusinessLogic/General.robot
Resource          ../../Resources/BusinessLogic/Choferes.robot
Resource          ../../Resources/VariablesGenerales.robot
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           OperatingSystem
Library           JSONLibrary
Library           String

*** Test Cases ***
GetChofer
    ############# Crear sesión ################
    Create Session    mySession    ${URL}
    ############# setear autenticación en el header ####################
    ${headers}=    Create Dictionary    Authorization=${AutToken}
    ################ invocar método GET #####################
    ${response}=    Get Request    mySession    /choferes/2024306    headers=${headers}
    ################ controlar estado #####################3
    ${statusCode}=    Convert To String    ${response.status_code}
    Should Be Equal    ${statusCode}    200
    ################ convertir respuesta a String y controlar varor ###########
    ${bodyString}    Convert To String    ${response.content}
    Should Contain    ${bodyString}    RODRIGUEZ
    ################ convertir respuesta a Json y controlar valor ###############
    ${bodyJSon}=    To Json    ${response.content}
    ${Desc}=    Get Value From Json    ${bodyJSon}    $.descripcion
    Should Be Equal    ${Desc[0]}    RODRIGUEZ
    ############### controlar valor del header ############
    ${contentType}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentType}    application/json; charset=utf-8

GetChoferes
    Create Session    mySession    ${URL}
    ${headers}=    Create Dictionary    Authorization=${AutToken}
    ${response}=    Get Request    mySession    /choferes/Filtros    headers=${headers}
    ############# controlar estado###############
    ${statusCode}=    Convert To String    ${response.status_code}
    Should Be Equal    ${statusCode}    200
    Log To Console    ${response.content}
    ############## convertir la respuesta en Json y obtener un valor determinado #####################33
    ${bodyJSon}=    To Json    ${response.content}
    ${desc}=    Get Value From Json    ${bodyJSon}    $[0].descripcion
    #Log To Console    ${desc[0]}
    #Log To Console    ${response.headers}
    ############# iterar el diccionario devuelto como respuesta ###############
    @{Dicc}=    Set Variable    ${response.json()}
    FOR    ${item}    IN    @{Dicc}
        ${codigo}=    Get From Dictionary    ${item}    codigo
        Log To Console    ${codigo}
    END

PostChofer
    Create Session    mySession    ${URL}
    ############# setear autenticación en el header ####################
    ${headers}=    Create Dictionary    Authorization=${AutToken}    Content-Type=application/json
    ############# crear datos ################
    ${body}=    Create Dictionary    Cuil=20269125662    RazonSocial=Arzura Juan    Habilitado=true
    ############### invocar método POST ####################333
    ${response}=    Post Request    mySession    /choferes    data=${body}    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${statusCode}=    Convert To String    ${response.status_code}
    Should Be Equal    ${statusCode}    201

PostChoferFromFile
    Create Session    mySession    ${URL}
    ${headers}=    Create Dictionary    Authorization=${AutToken}    Content-Type=application/json
    ################# crear Body desde un archivo Json ################
    ${body}=    Load JSON From File    ${FilePathPruebaPost}
    ${response}=    Post Request    mySession    /choferes    data=${body}    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${statusCode}=    Convert To String    ${response.status_code}
    Should Be Equal    ${statusCode}    201

CargaJson
    ${Archivo}=    Load JSON From File    ${FilePathPrueba}
    ${LasName}=    Get Value From Json    ${Archivo}    $.lastName
    Log To Console    ${LasName[0]}

RespRecibidaVsEsperada
    ############# Crear sesión ################
    Create Session    mySession    ${URL}
    ############# setear autenticación en el header ####################
    ${headers}=    Create Dictionary    Authorization=${AutToken}
    ################ invocar método GET #####################
    ${response}=    Get Request    mySession    /choferes/2024306    headers=${headers}
    ##################dos formas de convertir el contenido a Json ##############33
    #${RespRecibida}=    Set Variable    ${response.json()}
    ${RespRecibida}=    To Json    ${response.content}
    Log To Console    ${RespRecibida}
    ################ cargo la resp esperada desde un archivo ###############
    ${RespEsperada}=    Load JSON From File    ${FilePathPruebaComp}
    Log To Console    ${RespEsperada}
    ################ comparación ###################
    Dictionaries Should Be Equal    ${RespRecibida}    ${RespEsperada}    value=true

CompRespMultiple
    Create Session    mySession    ${URL}
    ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8    Authorization=${AutToken}
    ${response}=    Get Request    mySession    /choferes/Filtros?$&habilitado=true&descripcion=RODRIGUEZ    headers=${headers}
    #Log To Console    ${response.content}
    ############## Resp recibida #####################
    ${RespRecibida}=    Set Variable    ${response.json()}
    #Log To Console    ${RespRecibida}
    ############## Resp esperada #####################
    ${RespEsperada}=    Load JSON From File    ${FilePathPruebaRodHab}
    #Log To Console    ${RespEsperada}
    ################ comparación ##############
    Lists Should Be Equal    ${RespRecibida}    ${RespEsperada}    value=true
