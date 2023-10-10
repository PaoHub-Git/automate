*** Settings ***
Resource    ..//1.Setting/Setting.robot



*** Tasks ***

RUN TASK LOS
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
            Click Element    //*[@placeholder="Search..."]
            Input Text    //*[@placeholder="Search..."]    ${Ref no_Excel}
        
            Sleep    10s
            Click Element    //span/mark[contains(text(), '${Ref no_Excel}')]


			Wait Until Element Is Visible    ${STATUS_Prescreening}
            Wait Until Element Is Visible    //*[@data-label="Products" and text()="Products"]
            Click Element    //*[@data-label="Products" and text()="Products"]
			${status_text}=    Get Text    ${STATUS_Prescreening}
            Wait Until Element Is Visible    //lst-template-list-field/lightning-formatted-number
			${amount_text}=   Get Text    //lst-template-list-field/lightning-formatted-number
			# Remove commas and convert the string to a number
			${amount}=       Convert To Number    ${amount_text.replace(',', '')}
            ${condition}=    Evaluate    '${status_text}' == 'Pending-Prescreening' and ${amount} <= 3000000
            Run Keyword If    ${condition}
            ...    Run Keywords
            ...    Capture Page Screenshot
			...    AND
			...    Click Next Button and swict to Operations AuthLevel30

            # Wait Until Element Is Visible    ${STATUS_Prescreening}
            # ${status_text}=    Get Text      ${STATUS_Prescreening}
            # Run Keyword If    '${status_text}' == 'Pending-Prescreening'    Click Next Button and swict to Operations AuthLevel30

            Sleep    5s

            FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
                Click Element    //button[@title='Actions for ${Ref no_Excel} | Loan Application']
                Wait Until Element Is Visible    ${REFRESH_XPATH}
                Click Element    ${REFRESH_XPATH}
                ${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${PENDING_XPATH_Pending-IncomeMaker}
                Exit For Loop If    ${isFound}    
                Sleep    5s
            END
                Close Browser


             #LOGIN Income Maker AuthLevel30

            Open Google with Profile 1    ${Username}    ${Password}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@placeholder="Search..."]
            Input Text    //*[@placeholder="Search..."]    ${Ref no_Excel}
            
            Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_Excel}')]
            Click Element    //span/mark[contains(text(), '${Ref no_Excel}')]
            

            Wait Until Element Is Visible    ${STATUS_Income Maker}
            ${status_text}=    Get Text      ${STATUS_Income Maker}
            Run Keyword If    '${status_text}' == 'Pending-IncomeMaker'    Click Next Button and swict to Income Maker AuthLevel30

            Sleep    5s


            #FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
            #    Click Element    //button[@title='Actions for ${Ref no_Excel} | Loan Application']
            #    Wait Until Element Is Visible    ${REFRESH_XPATH}
            #    Click Element    ${REFRESH_XPATH}
            #    ${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${PENDING_XPATH_Pending-WebVerification}
            #    Exit For Loop If    ${isFound}
            #    Sleep    5s
            #END
            Close Browser


            #LOGIN Income Checker AuthLevel30
          
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
            Close Browser





                    #LOGIN Call Ver AuthLevel30
            Open Google with Profile 1    ${Username}    ${Password}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@placeholder="Search..."]
            Input Text    //*[@placeholder="Search..."]    ${Ref no_Excel}
            
            Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_Excel}')]
            Click Element    //span/mark[contains(text(), '${Ref no_Excel}')]
            Sleep    5s


            Wait Until Element Is Visible    ${STATUS_WebVerification}
            ${status_text}=    Get Text      ${STATUS_WebVerification}
            Run Keyword If    '${status_text}' == 'Pending-WebVerification'    Click Next Button and swict to Call Ver AuthLevel30


			FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
				Click Element    //button[@title='Actions for ${Ref no_Excel} | Loan Application']
				Wait Until Element Is Visible    ${REFRESH_XPATH}
				Click Element    ${REFRESH_XPATH}
				${isFoundResolved}=    Run Keyword And Return Status    Element Should Be Visible    ${PENDING_XPATH_Resolved-Completed}
				${isFoundPending}=    Run Keyword And Return Status    Element Should Be Visible    ${PENDING_XPATH_Pending-PotentialMatch}
				
				Exit For Loop If    ${isFoundResolved}
				Exit For Loop If    ${isFoundPending}
				
				Sleep    5s
			END
			
				Run Keyword If    ${isFoundResolved}    Status_Check_2    ${ROW}
				Run Keyword If    ${isFoundResolved}    Close Browser
				Run Keyword If    ${isFoundPending}    Click Next Button and swict to Manual UW AuthLevel30            
			
			
			FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
					Click Element    //button[@title='Actions for ${Ref no_Excel} | Loan Application']
					Wait Until Element Is Visible    ${REFRESH_XPATH}
					Click Element    ${REFRESH_XPATH}
					${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${PENDING_XPATH_Resolved-Completed}
					Exit For Loop If    ${isFound}
					Sleep    5s
			END
					Status_Check_2   ${ROW}
					Close Browser

    END