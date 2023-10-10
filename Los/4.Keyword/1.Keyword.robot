*** Settings ***

Resource    ..//1.Setting/Setting.robot


*** Variables ***
${REF_MANUAL}    BT2023100900092


*** Keywords ***


Open Google with Profile 1
    [Arguments]    ${Username}    ${Password}
    ${chrome_options}=    get_chrome_options    ${PROFILE_PATH}    Profile 1
    Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}    options=${chrome_options}
    Call Method  ${chrome_options}  add_argument  --disable-gpu
    Call Method  ${chrome_options}  add_argument  --no-sandbox
    Maximize Browser Window
    Wait Until Element Is Enabled    //*[@id="Login"]
    Input Text    id=username    ${Username}
    Input Text    id=password    ${Password}
    Click Element    id=Login
    Pause Execution    Please enter "Salesforce Authenticator"
        



Open sf and login
    [Arguments]    ${Username}    ${Password}
    #Open Browser    https://cardxscb--sit2.sandbox.my.salesforce.com/      Firefox    ff_profile_dir=C:\\Users\\alonggorn.p\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\w7l8scqv.default-release-1691911279948
    Open Browser     https://cardxscb--uat.sandbox.my.salesforce.com/   browser=ff    ff_profile_dir=C:\\Users\\alonggorn.p\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles\\w7l8scqv.default-release-1691911279948
    #Open Browser     https://cardxscb--uat.sandbox.my.salesforce.com/   browser=gc    executable_path=C:\\Users\\alonggorn.p\\AppData\\Local\\Google\\Chrome\\User Data\\Default
    Wait Until Element Is Visible    id=username
    Input Text    id=username    ${Username}
    Input Text    id=password    ${Password}
    Click Element    id=Login



Click Next Button and swict to Operations AuthLevel30
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
	    
        ${element}=    Execute JavaScript    return document.evaluate('//*[@class="slds-button__icon slds-button__icon_hint"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
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
        



        

Click Next Button and swict to Income Maker AuthLevel30
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
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Maker AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Maker AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
            Sleep  time_=10s

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
        




Scroll Element Into View
        [Arguments]    ${locator}
        #Execute JavaScript    document.evaluate('${locator}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
        Execute JavaScript    document.evaluate('${locator}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(false);



Scroll Element With Offset Until Visible
		[Arguments]    ${locator}    ${offsetX}=0    ${offsetY}=0    ${attempts}=0
		FOR    ${i}    IN RANGE    1    ${attempts}
				Scroll Element With Offset    ${locator}    ${offsetX}    ${offsetY}
				${is_visible}=    Is Element In Viewport    ${locator}
				Exit For Loop If    '${is_visible}'=='True'
		END
		[Return]    ${is_visible}


Scroll Element With Offset
    [Arguments]    ${locator}    ${offsetX}=0    ${offsetY}=0
    ${js_code}=    Catenate    SEPARATOR=\n
    ...    var elem = document.evaluate('${locator}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    var rect = elem.getBoundingClientRect();
    ...    window.scrollBy(0, ${offsetY});
    Execute JavaScript    ${js_code}


Is Element In Viewport
    [Arguments]    ${locator}
    ${js_code}=    Catenate    SEPARATOR=\n
    ...    var elem = document.evaluate('${locator}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    var rect = elem.getBoundingClientRect();
    ...    return (rect.top >= 0 && rect.left >= 0 && rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && rect.right <= (window.innerWidth || document.documentElement.clientWidth));
    ${is_visible}=    Execute JavaScript    ${js_code}
    [Return]    ${is_visible}



Click Next Button and swict to Income Checker AuthLevel30
    Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        Sleep    5s
        Select Frame     css=iframe.insext-popup
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Income Checker AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Sleep    time_=15s

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
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
            Sleep  time_=10s

        Wait Until Element Is Not Visible    //*[@class="slds-button slds-button_brand" and text()="Change Owner"]
        
        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0   300    5

        Click Element   locator=//*[@class="slds-button slds-button_brand" and text()="Save"]

        ###Debt Info
             Sleep    10s
        Click Element    //*[@id="Debt Info__item" and text()="Debt Info"]
        Wait Until Element Is Visible    //*[@id="Debt Info__item" and text()="Debt Info"]
             Sleep    4s
        
        Scroll Element With Offset Until Visible   //*[@class="slds-button slds-button_brand" and text()="Save"]    0   500    5
        #Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
        
        Wait Until Element Is Visible   (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
        Click Element    (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
        Sleep    3s
        Execute Javascript    window.scrollTo(0, 0);

        ####Financial Info

        Click Element    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
        Wait Until Element Is Visible    //*[@name="SALARY" and text()="เงินเดือน"]
        

        Scroll Element With Offset Until Visible    //*[@class="slds-form-element__label" and text()="Match "]    0   800    5
        Click Element    //*[@class="slds-form-element__label" and text()="Match "] 
        Wait Until Element Is Visible    //*[@value="Save" and text()="Save"]
        Click Element    //*[@value="Save" and text()="Save"]
        Sleep    6s
        Click Element    //*[@value="Submit" and text()="Submit"]

        Sleep    10s








Click Next Button and swict to Call Ver AuthLevel30
    Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        Sleep    5s

        Select Frame     css=iframe.insext-popup
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Call Ver AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Call Ver AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Call Ver AuthLevel30')]
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
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
        Sleep    5s

        Wait Until Element Is Not Visible    //*[@class="slds-button slds-button_brand" and text()="Change Owner"]
        Sleep    7s
        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[3]    0    700    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[3]
        Click Element    //*[@title="สิทธิประกันสังคม"]
        Click Element    (//*[@class="slds-button__icon"])[10]

        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[4]    0    200    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[4]

        Click Element    //*[@name="taxLastDeclaredYear"]
        Click Element    //*[text()="2565"]

        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0    500    5
        Click Element    //*[@class="slds-button slds-button_brand" and text()="Save"]
        Sleep    5s
        Click Element    //*[@class="slds-button slds-button_brand" and text()="Submit"]

        Sleep    10s


        


Click Next Button and swict to Manual UW AuthLevel30
    Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        Sleep    5s

        Select Frame     css=iframe.insext-popup
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Manual UW AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Manual UW AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Manual UW AuthLevel30')]
        Wait Until Element Is Visible    locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Manual UW AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Manual UW AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
        Sleep    5s


        Wait Until Element Is Not Visible    //*[@value="change owner"]
        Scroll Element With Offset Until Visible    //*[@type="button" and text()="Refresh"]        0    100    5
        Click Element       //*[@part="label" and text()="No"]
        Click Element       //*[@class="slds-button slds-button_brand" and text()="Submit"]

        Sleep    10s



Check For Elements language
    Sleep    6s
    Execute Javascript    document.querySelector('.icon.noicon').click()

    Wait Until Element Is Visible    //*[@class="profile-link-label" and text()="การตั้งค่า"]
    Click Element    //*[@class="profile-link-label" and text()="การตั้งค่า"]
    Wait Until Element Is Visible    //*[@title="ภาษาและเขตเวลา"]
    Click Element    //*[@title="ภาษาและเขตเวลา"]
    Sleep    2s
    Wait Until Element Is Visible    //iframe[@title="ภาษาและเขตเวลา ~ Salesforce - Unlimited Edition"]
    Select Frame    //iframe[@title="ภาษาและเขตเวลา ~ Salesforce - Unlimited Edition"]
    Wait Until Element Is Visible    //*[@id="LanguageAndTimeZoneSetup:editPage:editPageBlock:languageLocaleKey"]
    Select From List By Label    id=LanguageAndTimeZoneSetup:editPage:editPageBlock:languageLocaleKey    English
    Click Element    //*[@title="บันทึก"]