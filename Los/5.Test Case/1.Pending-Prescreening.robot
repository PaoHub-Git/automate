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
            ${status_text}=    Get Text      ${STATUS_Prescreening}
            Run Keyword If    '${status_text}' != 'Pending-Prescreening'    Exit For Loop
            
            Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        Sleep    5s

        Select Frame     css=iframe.insext-popup
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Operations AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Operations AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Operations AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

        ####  ตรวจสอบภาษา ###
		${element}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="Show Navigation Menu"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		Should Not Be Equal    ${element}    None    msg=Element not found.
		${EN}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="Show Navigation Menu"]    5s
		# ${element2}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="แสดงเมนูการนำทาง"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		# Should Not Be Equal    ${element2}    None    msg=Element not found.
		${TH}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="แสดงเมนูการนำทาง"]    5s
		Wait Until Keyword Succeeds    3x    10s    Log    Waiting for elements...    # รอจนกว่าหนึ่งในสอง text จะปรากฎ ด้วยการลอง 3 ครั้ง แต่ละครั้งระยะห่าง 10 วินาที
	    
		Run Keyword If    ${TH}    
        ...    Run Keywords
        ...    Check For Elements language    
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Ref no} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Ref no} | Loan Application'])[1]    
        ...    AND    Sleep    4s


        Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Scroll Element With Offset Until Visible    //*[@class="slds-button__icon slds-button__icon_hint"]    0    100    5
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Operations AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Operations AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
        Sleep    5s
        Execute JavaScript    window.scrollTo(window.innerWidth / 2, 1.3 * window.innerHeight);
        
        Sleep    time_=6s

        Wait Until Element Is Not Visible    //*[@class="slds-button slds-button_brand" and text()="Change Owner"]
        Click Element    (//*[@class="slds-tree__item-label slds-truncate"])[4]

        Sleep    time_=3s

        ${window_handles}=    Get Window Handles
		${main_window_handle}=    Set Variable    ${window_handles}[0]
		Switch Window    NEW
		Close Window
		Switch Window    ${main_window_handle}
        Sleep   time_=5s
        
        Execute JavaScript    window.scrollTo(window.innerWidth / 2, 0.3 * window.innerHeight);

        # Scroll Element Into View     locator=(//*[@class="slds-form-element__control"])[1]
        Wait Until Element Is Visible    //span[@part='label' and text()='Match']
        Click Element    //span[@part='label' and text()='Match']
        Sleep    5s
        Click Element    locator=//*[@class="slds-button slds-button_brand" and text()="Save"]
        Sleep    6s
        Click Element    locator=(//*[@type="button" and text()="Submit"])[1]
        Wait Until Element Is Visible    //*[@class="slds-tabs_default__link" and text()="Details"]


            Sleep    5s

            FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
                Click Element    //button[@title='Actions for ${Ref no_Excel} | Loan Application']
                Wait Until Element Is Visible    ${REFRESH_XPATH}
                Click Element    ${REFRESH_XPATH}
                ${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${PENDING_XPATH_Pending-IncomeMaker}
                Exit For Loop If    ${isFound}    
                Sleep    5s
            END
    END        
            #Close Browser