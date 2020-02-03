*** Settings ***
Library           SeleniumLibrary
Resource          General.robot

*** Variables ***
${locTxtDocPorte}    //*[@id="validarCupoSection"]/form/yrd-documento-porte/fieldset/div[1]/div[2]/yrd-texto-mascara-con-etiqueta/div/div/input
${locOptSinCupo}    //*[@id="radioSinCupo"]
${locBtnCancelar}    //*[@id="validarCupoSection"]/div/div[2]/button[2]
${locBtnConfNO}    xpath:/html/body/yrd-root/jaspero-confirmations/jaspero-confirmation/div[2]/div[3]/button[2]

*** Keywords ***
Ingresar Documento Porte
    [Arguments]    ${aNroDocPorte}
    ${txtDocPorte}    Capturar Elemento    ${locTxtDocPorte}
    Ingresar Texto    ${txtDocPorte}    ${aNroDocPorte}

Seleccionar Sin Cupo
    ${OptSinCupo}    Capturar Elemento    ${locOptSinCupo}
    Presionar Boton    ${OptSinCupo}

Presionar Cancelar
    ${btnCancelar}    Capturar Elemento    ${locBtnCancelar}
    Scrollear Hasta Final Pagina
    Presionar Boton    ${btnCancelar}

Presionar No en Confirmacion
    ${btnConfNO}    Capturar Elemento    ${locBtnConfNO}
    Presionar Boton    ${btnConfNO}
