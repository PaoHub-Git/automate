*** Settings ***

Resource    ..//1.Setting/Setting.robot




*** Tasks ***


Open and login SF

    #Open and login    Username=${Username_uat}   Password=${Password_uat}
    Open and login    Username=${Username_uat}   Password=${Password_uat}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
            Input Text    //*[@type="search" and @placeholder="Search..."]   ${Ref no_manaul}
            Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_manaul}')]
            Click Element    //span/mark[contains(text(), '${Ref no_manaul}')]
            Sleep    4s
        Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        
        Select Frame     css=iframe.insext-popup
        Wait Until Element Is Visible    //li[@data-aspect='users']
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Data Entry Checker AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Data Entry Checker AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Data Entry Checker AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

        ####  ตรวจสอบภาษา ###
		${element1}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="Show Navigation Menu"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		Should Not Be Equal    ${element1}    None    msg=Element not found.
		${EN}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="Show Navigation Menu"]    5s
		# ${element2}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="แสดงเมนูการนำทาง"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		# Should Not Be Equal    ${element2}    None    msg=Element not found.
		${TH}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="แสดงเมนูการนำทาง"]    5s
		Wait Until Keyword Succeeds    3x    10s    Log    Waiting for elements...    # รอจนกว่าหนึ่งในสอง text จะปรากฎ ด้วยการลอง 3 ครั้ง แต่ละครั้งระยะห่าง 10 วินาที
	    
		Run Keyword If    ${TH}    
        ...    Run Keywords
        ...    Check For Elements language    
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Ref no_manaul} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Ref no_manaul} | Loan Application'])[1]    
        ...    AND    Sleep    4s

        # ${element1}=    Execute JavaScript    return document.evaluate('//*[@class="slds-button__icon slds-button__icon_hint"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        # Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        # Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        # Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Checker AuthLevel30"]
        # Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Checker AuthLevel30"]
        # Wait Until Element Is Visible    locator=//*[@value="change owner"]
        # Click Element    locator=//*[@value="change owner"]
		
		
        # Wait Until Element Is Not Visible    locator=//*[@value="change owner"]

######

        Wait Until Element Is Visible    locator=//*[@title="Verify Application"]
        Sleep    7s
        Execute Javascript    document.evaluate('//*[@title="Verify Application"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
        Sleep    5s

        Switch Window    NEW
        

		FOR    ${index}    IN RANGE    2
            Wait Until Element Is Visible    //*[text()="Please wait"]
			Wait Until Element Is Not Visible    //*[text()="Please wait"]
		END


        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Wait Until Element Is Visible    //span[@class="MuiButton-label"]/div[text()="Confirm application"]
        Click Element    locator=//span[@class="MuiButton-label"]/div[text()="Confirm application"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    4s
        
        Wait Until Page Contains    Successfully submitted

        Switch Window    MAIN

		FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
                      Click Element    //button[@title='Actions for ${Ref no_manaul} | Loan Application']
				Wait Until Element Is Visible    ${REFRESH_XPATH}
				Click Element    ${REFRESH_XPATH}
				${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-IncomeMaker}
				Exit For Loop If    ${isFound}
				Sleep    5s
		END

        Close Browser


        