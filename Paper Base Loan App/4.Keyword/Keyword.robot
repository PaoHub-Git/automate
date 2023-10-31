*** Settings ***

Resource    ..//1.Setting/Setting.robot



*** Variables ***
${Product}      //*[text()="CardX XTRA PLATINUM "]                         ### VISA CARD ###
#${Product}      //*[text()="CardX XTRA PLATINUM"]                          ### MASTER CARD ###
#${Product}      //*[text()="CardX SPEEDY CASH"]                            ### CardX SPEEDY CASH ###
#${Product}       //*[text()="CardX SPEEDY LOAN"]                            ### CardX SPEEDY LOAN ###



#### Select bank account SPL ###
${Saving Account}    (//div[div[text()="Saving Account"])[1]
#${Saving Account}   (//div[div[text()="Saving Account"])[2]
#${Saving Account}   (//div[div[text()="Saving Account"])[3]

### Account number SPL ###
${account number}    1113909131

*** Keywords ***

 Open and login
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

# get_chrome_options
#     [Arguments]    ${profile_path}    ${profile_directory}
#     ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#     Call Method    ${chrome_options}    add_argument    user-data-dir=${profile_path}
#     ${profile_arg}=    Set Variable    profile-directory=${profile_directory}
#     Call Method    ${chrome_options}    add_argument    ${profile_arg}
#     [Return]    ${chrome_options}


Credit Card
    Wait Until Element Is Not Visible   locator=//*[text()="Please wait"]
    Wait Until Element Is Visible    //iframe[@title='accessibility title']
    Select Frame    //iframe[@title='accessibility title']
    Wait Until Element Is Visible    //div[text()="Credit Card"]
    Click Element    //div[text()="Credit Card"]
    Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
    Wait Until Element Is Visible    ${Product}
    Click Element    ${Product}
    


Speedy Cash
    Wait Until Element Is Not Visible   locator=//*[text()="Please wait"]
    Wait Until Element Is Visible    //iframe[@title='accessibility title']
    Select Frame    //iframe[@title='accessibility title']
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //div[text()="Speedy Cash"]
    Click Element    //div[text()="Speedy Cash"]
    Wait Until Element Is Visible    ${Product}
    Click Element    ${Product}
    

Speedy Loan
    Wait Until Element Is Not Visible   locator=//*[text()="Please wait"]
    Wait Until Element Is Visible    //iframe[@title='accessibility title']
    Select Frame    //iframe[@title='accessibility title']
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //div[text()="Speedy Loan"]
    Click Element    //div[text()="Speedy Loan"]
    Wait Until Element Is Visible    ${Product}
    Click Element    ${Product}


Input Names To PPB TH
    [Arguments]    ${thaiFirstName}    ${thaiLastName}
    Input Text    //*[@placeholder="Input first name"]     ${thaiFirstName}
    Input Text    //*[@placeholder="Input last name"]     ${thaiLastName}


Input name manaul
    [Arguments]   ${thaiFirstName_Excel}    ${thaiLastName_Excel}   ${englishFirstName_Excel}    ${englishLastName_Excel}
    Input Text    //*[@placeholder="thaiFirstName"]       ${thaiFirstName_Excel}
    Input Text    //*[@placeholder="thaiLastName"]        ${thaiLastName_Excel}
    Input Text    //*[@placeholder="englishFirstName"]    ${englishFirstName_Excel} 
    Input Text    //*[@placeholder="englishLastName"]     ${englishLastName_Excel}





####GET NAME TH-EN #####
   
Open Headless Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    options=${chrome_options}


Get Names From Website
    Open Headless Browser
    Go To    https://kidhaina.com/thainamegenerator.html
    Wait Until Page Contains Element    //*[@class="first-name-th"]
    ${thaiFirstName}=      Get Text     //*[@class="first-name-th"]
    ${thaiLastName}=       Get Text     //*[@class="last-name-th"]
    ${englishFirstName}=   Get Text     //*[@class="first-name-en"]
    ${englishLastName}=    Get Text     (//*[@class="last-name-th"])[2]
    Close Browser
    [Return]    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName} 






Random Title and Gender
		${Title} =    Evaluate    random.choice(['MR.', 'MISS'])    modules=random
		Click Element    locator=//*[@placeholder="Select title"]
		Run Keyword If    '${Title}' == 'MR.'    
		...    Click Element    locator=//*[text()="MR."]
		...    ELSE    
		...    Click Element    locator=//*[text()="MISS"]
		
		Log    Selected title is: ${Title}
	
		Click Element    locator=//*[@placeholder="Select gender"]
		${Gender} =    Set Variable If    '${Title}' == 'MR.'    Male    Female
		Click Element    locator=//*[text()="${Gender}"]
		
		Log    Selected gender is: ${Gender}



Manaul Title and Gender
        Click Element    locator=//*[@placeholder="Select title"]
            #Click Element    locator=//*[text()="MR."]
            #Click Element    locator=//*[text()="MISS"]


        Click Element    locator=//*[@placeholder="Select gender"]
            #Click Element    locator=//*[text()="Male"]      
            #Click Element    locator=//*[text()="Female"]



#สุ่มบ้านเลขที่
Generate Random House Number
    ${random1}=    Evaluate    random.randint(0, 9)    random
    ${random2}=    Evaluate    random.randint(0, 9)    random
    ${random3}=    Evaluate    random.randint(0, 9)    random
    ${random_House_number}=    Catenate    SEPARATOR=    ${random1}    ${random2}    ${random3}
    [Return]    ${random_House_number}


Generate Random House Number 2
    ${random1}=    Evaluate    random.randint(0, 9)    random
    ${random2}=    Evaluate    random.randint(0, 9)    random
    ${random3}=    Evaluate    random.randint(0, 9)    random
    ${random_House_number2}=    Catenate    SEPARATOR=    ${random1}    ${random2}    ${random3}
    [Return]    ${random_House_number2}



Random Building Name
    ${random_building} =   Evaluate   random.choice($BUILDING_NAMES)   modules=random
    [Return]   ${random_building}


Click Plus Button 4 Times
    [Arguments]    ${locator}
    FOR    ${i}    IN RANGE    1
        Click Element    ${locator}
    END


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



IncomeCC
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    locator=//*[@id="outlined-type-of-income-dropdown"]
        Click Element    locator=//*[@id="outlined-type-of-income-dropdown"]

#       ###เลือกประเภท Income###
        
        Click Element    locator=//*[text()="Monthly Income"]
        #Click Element    locator=//*[text()="Fixed Deposit"]
        #Click Element    locator=//*[text()="Saving Deposit, Fixed Deposit and Fund Debenture"]


Add detail spc
        #Click Element        //*[text()="Continue"]

        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Wait Until Element Is Visible    //*[text()="Don't have"]
        Click Element    //*[text()="Don't have"]
        Click Element        //*[text()="Continue"]



        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Wait Until Element Is Visible   //*[text()="Not receive"]
        Click Element    //*[text()="Not receive"]
        Click Element        //*[text()="Continue"]

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]

Add detail spl
        #Click Element        //*[text()="Continue"]

        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Wait Until Element Is Visible    //*[text()="Don't have"]
        Click Element    //*[text()="Don't have"]
        Click Element        //*[text()="Continue"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]


Select add account number or not

		${element_exist}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div[div[text()="Saving Account"]]    timeout=5s
		Run Keyword If    ${element_exist}    Disbursement for SPL
		...    ELSE    Add account number for SPL


Disbursement for SPL
        
        Wait Until Element Is Visible    ${Saving Account}
        Click Element    ${Saving Account}
        Sleep    2s

        Click Element    //*[text()="Next"]

Add account number for SPL

        Wait Until Element Is Visible    //*[@placeholder="Input account number"]
        Input Text    //*[@placeholder="Input account number"]    ${account number}
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Click Element    //*[text()="Next"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Click Element    //*[text()="Next"]

        

Account Transfer Details
        ${elementXpath}=    Set Variable    //*[@class="slds-form-element__label" and text()="ตรวจสอบหมายเลขบัญชีแล้วถูกต้อง"]
        Wait Until Element Is Visible    ${elementXpath}
        Execute Javascript    document.evaluate('//*[@class="slds-form-element__label" and text()="ตรวจสอบหมายเลขบัญชีแล้วถูกต้อง"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.focus()

        Click Element    ${elementXpath}
        Wait Until Element Is Visible    xpath://*[@class="slds-form-element__label" and text()="ตรวจสอบหมายเลขบัญชีแล้วถูกต้อง"]
        Click Element    xpath://*[@class="slds-form-element__label" and text()="ตรวจสอบหมายเลขบัญชีแล้วถูกต้อง"]


Debt Info and Financial Info for CC,SPC         
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
        Sleep    6s
        Execute Javascript    window.scrollTo(0, 0);

        ####Financial Info
        Wait Until Element Is Visible    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
        sleep    4s
        Click Element    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
        Wait Until Element Is Visible    //*[@name="SALARY" and text()="เงินเดือน"]
        Scroll Element With Offset Until Visible    (//*[@class="slds-input"])[27]    0   300    5
        Input Text    (//*[@class="slds-input"])[27]    ${income}
        Input Text    (//*[@class="slds-input"])[29]    1
        Input Text    (//*[@class="slds-input"])[31]    ${income}
        Input Text    (//*[@class="slds-input"])[33]    ${income}
        Input Text    (//*[@class="slds-input"])[35]    ${income}
        Input Text    (//*[@class="slds-input"])[37]    ${income}
        Input Text    (//*[@class="slds-input"])[39]    ${income}
        Input Text    (//*[@class="slds-input"])[41]    ${income}

        Scroll Element With Offset Until Visible    //*[@class="slds-form-element__label" and text()="Match "]    0   500    5
        Click Element    //*[@class="slds-form-element__label" and text()="Match "] 
        Wait Until Element Is Visible    //*[@value="Save" and text()="Save"]
        Click Element    //*[@value="Save" and text()="Save"]
        Sleep    6s
        Click Element    //*[@value="Submit" and text()="Submit"]

        Sleep    10s

        Close Browser


Debt Info and Financial Info for SPL

        ###Debt Info
        Sleep    10s
        Click Element    //*[@id="Debt Info__item" and text()="Debt Info"]
        Wait Until Element Is Visible    //*[@id="Debt Info__item" and text()="Debt Info"]
             Sleep    4s
        Scroll Element With Offset Until Visible   (//*[@class="slds-input"])[22]   0   300    5
        Wait Until Element Is Visible    (//*[@class="slds-input"])[22]
        Input Text    (//*[@class="slds-input"])[22]    0
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
        Scroll Element With Offset Until Visible    (//*[@class="slds-input"])[30]    0   300    5
        Input Text    (//*[@class="slds-input"])[30]    ${income}
        Input Text    (//*[@class="slds-input"])[32]    1
        Input Text    (//*[@class="slds-input"])[34]    ${income}
        Input Text    (//*[@class="slds-input"])[36]    ${income}
        Input Text    (//*[@class="slds-input"])[38]    ${income}
        Input Text    (//*[@class="slds-input"])[40]    ${income}
        Input Text    (//*[@class="slds-input"])[42]    ${income}
        Input Text    (//*[@class="slds-input"])[44]    ${income}

        Scroll Element With Offset Until Visible    //*[@class="slds-form-element__label" and text()="Match "]    0   500    5
        Click Element    //*[@class="slds-form-element__label" and text()="Match "] 
        Wait Until Element Is Visible    //*[@value="Save" and text()="Save"]
        Click Element    //*[@value="Save" and text()="Save"]
        Sleep    6s
        Click Element    //*[@value="Submit" and text()="Submit"]

        Sleep    10s



        Close Browser


Call ver CC,SPC

        Wait Until Element Is Visible    //*[@class="slds-box"]/div[text()="Customer Details"]
        Wait Until Element Is Enabled    //*[@class="slds-box"]/div[text()="Customer Details"]
        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[1]    0    300    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[1]
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[2]



        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[3]    0    500    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[3]
        Click Element    //*[@title="สิทธิประกันสังคม"]
        Execute Javascript    document.evaluate('//*[text()="Move selection to Selected Values"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()

        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[4]    0    200    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[4]

        Click Element    //*[@name="taxLastDeclaredYear"]
        Click Element    //*[text()="2565"]

        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0    700    5
        Click Element    //*[@class="slds-button slds-button_brand" and text()="Save"]
        Sleep    5s
        Click Element    //*[@class="slds-button slds-button_brand" and text()="Submit"]

        
        Wait Until Element Is Visible    //*[text()="Customer Details"]
        Sleep    10s

        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0    700    5
        #Click Element    //*[@class="slds-button slds-button_brand" and text()="Save"]
        Sleep    5s
        #Click Element    //*[@class="slds-button slds-button_brand" and text()="Submit"]


        Sleep    10s    


        

Call ver SPL

        Wait Until Element Is Visible    //*[@class="slds-box"]/div[text()="Customer Details"]
        Wait Until Element Is Enabled    //*[@class="slds-box"]/div[text()="Customer Details"]
        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[1]    0    300    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[1]
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[2]



        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[3]    0    500    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[3]
        Click Element    //*[@title="สิทธิประกันสังคม"]
        Execute Javascript    document.evaluate('//*[text()="Move selection to Selected Values"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()


        Scroll Element With Offset Until Visible    (//*[@class="slds-form-element__label" and text()="พบ"])[4]    0    200    5
        Click Element    (//*[@class="slds-form-element__label" and text()="พบ"])[4]

        Click Element    //*[@name="taxLastDeclaredYear"]
        Click Element    //*[text()="2565"]

        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0    700    5
        Click Element    //*[@class="slds-button slds-button_brand" and text()="Save"]
        Sleep    5s
        Click Element    //*[@class="slds-button slds-button_brand" and text()="Submit"]

        Wait Until Element Is Visible    //*[text()="Customer Details"]
        Sleep    10s

        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0    700    5
        #Click Element    //*[@class="slds-button slds-button_brand" and text()="Save"]
        Sleep    5s
        #Click Element    //*[@class="slds-button slds-button_brand" and text()="Submit"]

    

        Sleep    10s    




### Income Checker AuthLevel30
Income Checker AuthLevel30
        Sleep    3s
        Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        
        Select Frame     css=iframe.insext-popup
        Wait Until Element Is Visible    //li[@data-aspect='users']
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Income Checker AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]
        ####  ตรวจสอบภาษา ###
		${EN}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="Show Navigation Menu"]    5s
		${TH}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="แสดงเมนูการนำทาง"]    5s
		Wait Until Keyword Succeeds    3x    10s    Log    Waiting for elements...    # รอจนกว่าหนึ่งในสอง text จะปรากฎ ด้วยการลอง 3 ครั้ง แต่ละครั้งระยะห่าง 10 วินาที
	
		Run Keyword If    ${TH}    Check For Elements language

        Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
		
		
        Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        Sleep    7s


        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0   300    5
        Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
        Click Element   locator=//*[@class="slds-button slds-button_brand" and text()="Save"]

        ###Debt Info
             Sleep    10s
        Click Element    //*[@id="Debt Info__item" and text()="Debt Info"]
        Wait Until Element Is Visible    //*[@id="Debt Info__item" and text()="Debt Info"]
             Sleep    4s
        Scroll Element With Offset Until Visible   //*[@class="slds-button slds-button_brand" and text()="Save"]    0   700    5
        #Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
        
        Wait Until Element Is Visible   (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
        Click Element    (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
        Sleep    3s
        Execute Javascript    window.scrollTo(0, 0);

        ####Financial Info
        Wait Until Element Is Visible    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
        Click Element    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
        Wait Until Element Is Visible    //*[@name="SALARY" and text()="เงินเดือน"]


        Scroll Element With Offset Until Visible    //*[@class="slds-form-element__label" and text()="Match "]    0   1000    5
        Wait Until Element Is Visible    //*[@value="Save" and text()="Save"]
        Click Element    //*[@value="Save" and text()="Save"]
        Sleep    6s
        Click Element    //*[@value="Submit" and text()="Submit"]
        Sleep    6s
        Close Browser


Reload app no.
        Wait Until Element Is Visible    //*[@class="slds-combobox__input slds-input slds-combobox__input-value"]
		Click Element    //*[@class="slds-combobox__input slds-input slds-combobox__input-value"]  # คลิกที่ dropdown
        Wait Until Element Is Visible    //lightning-base-combobox-item[@data-value='FILTER:LOS_Loan_Application__c:Loan Applications']
		Scroll Element Into View    //lightning-base-combobox-item[@data-value='FILTER:LOS_Loan_Application__c:Loan Applications']
        Click Element    //lightning-base-combobox-item[@data-value='FILTER:LOS_Loan_Application__c:Loan Applications']



Open and login2
    [Arguments]    ${Username}    ${Password}
    ${edge_options}=    get_edge_options    ${PROFILE_PATH}    Profile 1
    Open Browser    ${URL}    ${BROWSER2}    executable_path=${EDGEDRIVER_PATH}    options=${edge_options}
    Maximize Browser Window
    Wait Until Element Is Enabled    //*[@id="Login"]
    Input Text    id=username    ${Username}
    Input Text    id=password    ${Password}
    Click Element    id=Login
    Pause Execution    Please enter "Salesforce Authenticator"




    