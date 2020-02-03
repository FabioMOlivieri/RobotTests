*** Settings ***
Library           SeleniumLibrary
Resource          General.robot

*** Variables ***
${locBtnMenu}     id:dropdownMenuButton
${locBtnCupo}     xpath: //*[contains(text(), "Cupo")]
${locBtnValidarCupo}    xpath: //*[contains(text(), "Validar Cupo")]
${locBtnGestionarCupo}    xpath: //*[contains(text(), "Gestionar Cupo")]

*** Keywords ***
Ir a Validar Cupo
    ${btnMenu}    Capturar Elemento    ${locBtnMenu}
    Presionar Boton    ${btnMenu}
    ${btnCupo}    Capturar Elemento    ${locBtnCupo}
    Presionar Boton    ${btnCupo}
    ${btnValidarCupo}    Capturar Elemento    ${locBtnValidarCupo}
    Presionar Boton    ${btnValidarCupo}

Ir a Gestionar Cupo
    ${btnMenu}    Capturar Elemento    ${locBtnMenu}
    Presionar Boton    ${btnMenu}
    ${btnCupo}    Capturar Elemento    ${locBtnCupo}
    Presionar Boton    ${btnCupo}
    ${btnGestionarCupo}    Capturar Elemento    ${locBtnGestionarCupo}
    Presionar Boton    ${btnGestionarCupo}
