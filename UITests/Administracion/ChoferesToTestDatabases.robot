*** Settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections
Resource          ../../Resources/VariablesGenerales.robot

*** Test Cases ***
DBTest
    Connect To Database    pymssql    ${gDBNameUat}    ${gDBUserUat}    ${gDBPassUat}    ${gDBHostUat}    ${gDBPortUat}
    ################## Insert ###########################
    #${InsertOutput}=    Execute Sql String    INSERT INTO T_DRIVER VALUES (xxx,"xxxx");
    #Should Be Equal As Strings    ${InsertOutput}    None
    ################## Update ###########################
    #${UpdateOutput}=    Execute Sql String    UPDATE T_DRIVER SET xxx ="xxxx" WHERE xxx=xxx;
    #Should Be Equal As Strings    ${UpdateOutput}    None
    ################## Delete ###########################
    #${DeleteOutput}=    Execute Sql String    DELETE FROM T_DRIVER WHERE xxx=xxx;
    #Should Be Equal As Strings    ${DeleteOutput}    None
    ################## Script #######################33
    #${OutputScript}=    Execute Sql Script    C:/Neoris/xxx.sql
    #Should Be Equal As Strings    ${OutputScript}    None
    ################## Chequear si existe en BD #######################
    #Check If Exists In Database    SELECT xxx FROM xxx WHERE xxxx;    xxxx
    ################# Chequear si existe en BD #######################
    #Check If Not Exists In Database    SELECT xxx FROM xxx WHERE xxxx;    xxxx
    ################# Query #####################
    @{QueryResult}=    Query    SELECT * FROM T_DRIVER
    #Log Many    @{QueryResult}
    FOR    ${fil}    IN    @{QueryResult}
        ${QueryRow}    Convert To List    ${fil}
        #Log Many    ${QueryRow}
        ${CellRow}    Get From List    ${QueryRow}    0
        #Log To Console    ${CellRow}
        Exit For Loop If    ${CellRow}==3370
    END
    Log Many    ${QueryRow}
    Disconnect From Database
