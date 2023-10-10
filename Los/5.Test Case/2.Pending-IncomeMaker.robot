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
            Input Text    //*[@placeholder="Search..."]    ${Ref no_Excel}
            
            Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_Excel}')]
            Click Element    //span/mark[contains(text(), '${Ref no_Excel}')]
            

            Wait Until Element Is Visible    ${STATUS_Income Maker}
            ${status_text}=    Get Text      ${STATUS_Income Maker}
            Run Keyword If    '${status_text}' != 'Pending-IncomeMaker'    Exit For Loop

            Sleep    5s

			Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
			Sleep    5s
			Select Frame     css=iframe.insext-popup
			Click Element    //li[@data-aspect='users']
			Click Element    //*[@class="all-data-input"]
			Input Text       //*[@class="all-data-input"]    Income Maker AuthLevel30
			Wait Until Element Is Visible    locator=//mark[contains(text(), 'Income Maker AuthLevel30')]
			Click Element    locator=//mark[contains(text(), 'Income Maker AuthLevel30')]
			Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
			Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]
			Sleep    time_=15s
            
        ####  ตรวจสอบภาษา ###
			${element1}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="Show Navigation Menu"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
			Should Not Be Equal    ${element1}    None    msg=Element not found.
			${EN}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="Show Navigation Menu"]    5s
			${element2}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="แสดงเมนูการนำทาง"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
			${TH}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="แสดงเมนูการนำทาง"]    5s
			Wait Until Keyword Succeeds    3x    10s    Log    Waiting for elements...    # รอจนกว่าหนึ่งในสอง text จะปรากฎ ด้วยการลอง 3 ครั้ง แต่ละครั้งระยะห่าง 10 วินาที
			
			Run Keyword If    ${TH}    
			...    Run Keywords
			...    Check For Elements language    
			...    AND    ${element2}=    Execute JavaScript    return document.evaluate('(//span[@class='title slds-truncate' and text()='${Ref no_Excel} | Loan Application'])[1]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
			...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Ref no_Excel} | Loan Application'])[1]    
			...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Ref no_Excel} | Loan Application'])[1]    
			...    AND    Sleep    4s


            Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
            Scroll Element With Offset Until Visible    //*[@class="slds-button__icon slds-button__icon_hint"]    0    100    5
            Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
			Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Maker AuthLevel30"]
			Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Maker AuthLevel30"]
			Wait Until Element Is Visible    locator=//*[@value="change owner"]
			Click Element    locator=//*[@value="change owner"]
	        Sleep    5s
			Wait Until Element Is Not Visible    //*[@class="slds-button slds-button_brand" and text()="Change Owner"]
			Scroll Element With Offset Until Visible    (//*[@class="slds-text-body_regular1 slds-text-align_left"])[3]    0   300    5
				Sleep    time_=10s
			${elementXpath}=    Set Variable    (//*[@type="button"])[24]
			Wait Until Element Is Visible    ${elementXpath}
			Execute Javascript    document.evaluate("(//*[@type='button'])[24]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.focus()
			Click Element    ${elementXpath}
			Wait Until Element Is Visible    xpath://span[@title='รองผู้จัดการใหญ่']
			Click Element    xpath://span[@title='รองผู้จัดการใหญ่']
			Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0   300    5
	
			Click Element   locator=//*[@class="slds-button slds-button_brand" and text()="Save"]
	
			###Debt Info
				Sleep    10s
			Click Element    //*[@id="Debt Info__item" and text()="Debt Info"]
			Wait Until Element Is Visible    //*[@id="Debt Info__item" and text()="Debt Info"]
				Sleep    4s
			Scroll Element With Offset Until Visible   (//*[@class="slds-input"])[19]   0   300    5
			Wait Until Element Is Visible    (//*[@class="slds-input"])[19]
			Input Text    (//*[@class="slds-input"])[19]    0
			Sleep    2s
			Click Element    //button[@title="Add Row" and text()="Add"]
			Scroll Element With Offset Until Visible   //*[@class="slds-button slds-button_brand" and text()="Save"]    0   700    5
			#Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
			
			Wait Until Element Is Visible   (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
			Click Element    (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
			Sleep    3s
			Execute Javascript    window.scrollTo(0, 0);
	
			####Financial Info
	
			Click Element    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
			Wait Until Element Is Visible    //*[@name="SALARY" and text()="เงินเดือน"]
			Scroll Element With Offset Until Visible    (//*[@class="slds-input"])[27]    0   300    5
			Input Text    (//*[@class="slds-input"])[27]    ${Saraly}
			Input Text    (//*[@class="slds-input"])[29]    1
			Input Text    (//*[@class="slds-input"])[31]    ${Saraly}
			Input Text    (//*[@class="slds-input"])[33]    ${Saraly}
			Input Text    (//*[@class="slds-input"])[35]    ${Saraly}
			Input Text    (//*[@class="slds-input"])[37]    ${Saraly}
			Input Text    (//*[@class="slds-input"])[39]    ${Saraly}
			Input Text    (//*[@class="slds-input"])[41]    ${Saraly}
	
			Scroll Element With Offset Until Visible    //*[@class="slds-form-element__label" and text()="Match "]    0   500    5
			Click Element    //*[@class="slds-form-element__label" and text()="Match "] 
			Wait Until Element Is Visible    //*[@value="Save" and text()="Save"]
			Click Element    //*[@value="Save" and text()="Save"]
			Sleep    6s
			Click Element    //*[@value="Submit" and text()="Submit"]
	
			Sleep    10s



    END

        Close Window