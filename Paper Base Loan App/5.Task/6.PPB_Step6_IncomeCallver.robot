*** Settings ***

Resource    ..//1.Setting/Setting.robot



*** Variables ***
#######################################################
${CARD_TYPE_CC}     CC
${CARD_TYPE_SPC}    SPC
${CARD_TYPE_SPL}    SPL
${SELECTED_CARD}    CC  #เลือกประเภทบัตร
#######################################################

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
        Input Text       //*[@class="all-data-input"]    Call Ver AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Call Ver AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Call Ver AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

       ####  ตรวจสอบภาษา ###
        ${element1}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="Show Navigation Menu"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		${EN}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="Show Navigation Menu"]    5s
		${TH}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="แสดงเมนูการนำทาง"]    5s
        Log    ${EN}
        Log    ${TH}
		Wait Until Keyword Succeeds    3x    10s    Log    Waiting for elements...    # รอจนกว่าหนึ่งในสอง text จะปรากฎ ด้วยการลอง 3 ครั้ง แต่ละครั้งระยะห่าง 10 วินาที
	    
		Run Keyword If    ${TH}    
        ...    Run Keywords
        ...    Check For Elements language    
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Ref no_manaul} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Ref no_manaul} | Loan Application'])[1]    
        ...    AND    Sleep    4s

        Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
		
		
        Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        Sleep    7s

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'    Call ver CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Call ver CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'   Call ver SPL 






