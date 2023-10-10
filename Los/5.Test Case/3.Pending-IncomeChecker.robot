*** Settings ***
Resource    ..//1.Setting/Setting.robot

*** Tasks ***

Run Task

    FOR    ${ROW}    IN RANGE    2    ${MAX_ROW}  
           ${Ref no_Excel} =      Read Excel Data      ${ROW}
           ${Ref no_Excel} =      Convert To String    ${Ref no_Excel}

           ${isREFEmpty} =    Run Keyword And Return Status    Should Be Empty    ${Ref no_Excel}
        
           Exit For Loop If    ${isREFEmpty}

            Open Google with Profile 1    ${Username}    ${Password}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@placeholder="Search..."]
            Sleep    5s
            Input Text    //*[@placeholder="Search..."]    ${Ref no_Excel}
            
            Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_Excel}')]
            Click Element    //span/mark[contains(text(), '${Ref no_Excel}')]
            Sleep    5s



            Wait Until Element Is Visible    ${STATUS_Income Checker}
            ${status_text}=    Get Text      ${STATUS_Income Checker}
            Run Keyword If    '${status_text}' == 'Pending-IncomeChecker'    Click Next Button and swict to Income Checker AuthLevel30

            Sleep    5s


            FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
                Click Element    //button[@title='Actions for ${Ref no_Excel} | Loan Application']
                Wait Until Element Is Visible    ${REFRESH_XPATH}
                Click Element    ${REFRESH_XPATH}
                ${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${PENDING_XPATH_Pending-WebVerification}
                Exit For Loop If    ${isFound}
                Sleep    5s
            END
    END