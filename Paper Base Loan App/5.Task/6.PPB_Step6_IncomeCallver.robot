*** Settings ***

Resource    ..//1.Setting/Setting.robot



*** Variables ***
#######################################################
${CARD_TYPE_CC}     CC
${CARD_TYPE_SPC}    SPC
${CARD_TYPE_SPL}    SPL
${SELECTED_CARD}    SPL  #เลือกประเภทบัตร
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

        #Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		#
        #Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        #Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        #Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        #Wait Until Element Is Visible    locator=//*[@value="change owner"]
        #Click Element    locator=//*[@value="change owner"]
		#
		#
        #Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        Sleep    10s

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'    Call ver CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Call ver CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'   Call ver SPL 






