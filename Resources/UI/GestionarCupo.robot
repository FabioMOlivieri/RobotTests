*** Settings ***
Library           SeleniumLibrary
Resource          General.robot

*** Variables ***
${locBtnBuscar}    xpath:/html/body/yrd-root/yrd-home/yrd-gestionar-cupos/form/fieldset/yrd-search-form-template/fieldset[1]/div/button[1]
${locFila}        xpath:/html/body/yrd-root/yrd-home/yrd-gestionar-cupos/form/fieldset/yrd-search-form-template/fieldset[2]/yrd-data-grid/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper
${locColumnaFila2}    xpath:/html/body/yrd-root/yrd-home/yrd-gestionar-cupos/form/fieldset/yrd-search-form-template/fieldset[2]/yrd-data-grid/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper[2]/datatable-body-row/div[2]/datatable-body-cell
${locBtnConsultar}    xpath:/html/body/yrd-root/yrd-home/yrd-gestionar-cupos/form/fieldset/yrd-search-form-template/fieldset[3]/div[2]/button[2]

*** Keywords ***
Presionar Buscar
    ${btnBuscar}    Capturar Elemento    ${locBtnBuscar}
    Presionar Boton    ${btnBuscar}

Obtener Cantidad Filas
    ${cantFilas}    Get Element Count    ${locFila}
    [Return]    ${cantFilas}

Obtener Cantidad Columnas
    ${cantColumnas}    Get Element Count    ${locColumnaFila2}
    [Return]    ${cantColumnas}

Obtener Valor Celda
    [Arguments]    ${aFila}    ${aColumna}
    ${celda}    Get Text    xpath:/html/body/yrd-root/yrd-home/yrd-gestionar-cupos/form/fieldset/yrd-search-form-template/fieldset[2]/yrd-data-grid/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper[${aFila}]/datatable-body-row/div[2]/datatable-body-cell[${aColumna}]
    [Return]    ${celda}

Seleccionar Fila
    [Arguments]    ${aFila}
    ${seleccion}    Capturar Elemento    xpath:/html/body/yrd-root/yrd-home/yrd-gestionar-cupos/form/fieldset/yrd-search-form-template/fieldset[2]/yrd-data-grid/div/ngx-datatable/div/datatable-body/datatable-selection/datatable-scroller/datatable-row-wrapper[${aFila}]/datatable-body-row/div[2]/datatable-body-cell[1]/div/label/input
    Presionar Boton    ${seleccion}

Presionar Consultar
    ${btnConsultar}    Capturar Elemento    ${locBtnConsultar}
    Presionar Boton    ${btnConsultar}
