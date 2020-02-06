*** Settings ***
Library           DatabaseLibrary
Resource          ../Resources/VariablesGenerales.robot

*** Tasks 
Control de integridad
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    @{QueryResult}=    Query    SELECT * FROM T_DRIVER
    #alguna acción de control
    Disconnect From Database