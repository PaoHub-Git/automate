*** Settings ***

Resource    ..//1.Setting/Setting.robot

*** Keywords ***

Open web onbording

    Open Browser    browser=gc    alias=BrowserA
    Go To    ${URL}
    Maximize Browser Window

login
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    xpath=//*[@id="Login"]
    Input Text        id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    xpath=//*[@id="Login"]
    


Select card Credit Card
    Wait Until Element Is Not Visible    text()="Please wait"]
    Wait Until Element Is Visible    //*[text()="Credit Card"]
    Click Element    //*[text()="Credit Card"]
    Wait Until Element Is Not Visible    text()="Please wait"]
    Wait Until Element Is Visible       ${Product}
    Wait Until Element Is Enabled       ${Product}
    Click Element    ${Product}  
    #Execute Javascript    var elems = document.querySelectorAll('.jss79'); for (var i = 0; i < elems.length; i++) { if (elems[i].textContent.includes('Credit Card')) { elems[i].click(); break; } }



Select card Speedy Cash

    Wait Until Element Is Not Visible   locator=//*[text()="Please wait"]
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //*[text()="Speedy Cash"]
    Click Element    //*[text()="Speedy Cash"]
    Wait Until Element Is Visible    ${Product}
    Click Element    ${Product}

Select card Speedy Loan

    Wait Until Element Is Not Visible   locator=//*[text()="Please wait"]
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    //*[text()="Speedy Loan"]
    Click Element    //*[text()="Speedy Loan"]
    Wait Until Element Is Visible    ${Product}
    Click Element    ${Product}
    

Nationality
    Wait Until Element Is Visible     //*[text()="Thai"]
	Wait Until Element Is Enabled     //*[text()="Thai"]
	Click Element                     //*[text()="Thai"]
	
	#Sleep    5s
	Wait Until Element Is Visible    locator=//*[text()="Next"]
	Click Element    //*[text()="Next"]
    


Select income

    Wait Until Element Is Visible    (//*[@class="MuiSvgIcon-root"])[2]
    Click Element    (//*[@class="MuiSvgIcon-root"])[2]   # คลิกเพื่อแสดงรายการ dropdown
    Wait Until Element Is Visible    //*[contains(text(),'Monthly Income')]
    Click Element    //*[contains(text(),'Monthly Income')]


Add detail spc

        Click Element        //*[text()="Next"]

        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Click Element    //*[text()="Don't have"]
        Click Element        //*[text()="Next"]



        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Click Element    //*[text()="Not receive"]
        Click Element        //*[text()="Next"]

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]



Input data
    Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
    Sleep    5s
    Wait Until Element Is Visible   //*[text()='mockup data']
    # Execute JavaScript    window.scrollBy(0, 300)
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Click Element                  //*[text()='mockup data']
    Click Element        //*[text()="2021061790700"]


Next

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
    Sleep    1s
    Click Element               //*[text()="Continue"]
    Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
    Wait Until Element Is Visible    //*[text()="Continue"]
    
    Click Element               //*[text()="Continue"]


Open Headless Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    options=${chrome_options}


Get Names From Website A
    Open Headless Browser
    
    Go To    ${URL_A}
    Wait Until Page Contains Element    //*[@class="first-name-th"]
    ${thaiFirstName}=      Get Text     //*[@class="first-name-th"]
    ${thaiLastName}=       Get Text     //*[@class="last-name-th"]
    ${englishFirstName}=   Get Text     //*[@class="first-name-en"]
    ${englishLastName}=    Get Text     (//*[@class="last-name-th"])[2]
    Close Browser
    Switch Browser    index_or_alias=BrowserA
    [Return]    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName} 


Input Names To Website B

    [Arguments]    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName}
    Press Keys    //*[@placeholder="thaiFirstName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="thaiFirstName"]       ${thaiFirstName}
    Press Keys    //*[@placeholder="thaiLastName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="thaiLastName"]        ${thaiLastName}
    Press Keys    //*[@placeholder="englishFirstName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="englishFirstName"]    ${englishFirstName}
    Press Keys    //*[@placeholder="englishLastName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="englishLastName"]     ${englishLastName}

Input name manaul

    [Arguments]   ${thaiFirstName_Excel}    ${thaiLastName_Excel}   ${englishFirstName_Excel}    ${englishLastName_Excel}
    Press Keys    //*[@placeholder="thaiFirstName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="thaiFirstName"]       ${thaiFirstName_Excel}
    Press Keys    //*[@placeholder="thaiLastName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="thaiLastName"]        ${thaiLastName_Excel}
    Press Keys    //*[@placeholder="englishFirstName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="englishFirstName"]    ${englishFirstName_Excel} 
    Press Keys    //*[@placeholder="englishLastName"]    CTRL+a+DELETE
    Input Text    //*[@placeholder="englishLastName"]     ${englishLastName_Excel}

Get cid from web
    Open Headless Browser
    Go To    ${URL_B}
    Wait Until Page Contains Element    //*[text()="สุ่มเลขใหม่"]
    Click Element    //*[text()="สุ่มเลขใหม่"]
    ${Get ID}=      Get Text     id=rslt
    Close Browser
    [Return]    ${Get ID}  



Input cid from url_c
    [Arguments]    ${Get ID}
    Input Text    //*[@placeholder="nIDNumber 13digit"]    ${Get ID}
    


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

clil svae mockup data
    Wait Until Element Is Visible       //*[@class="MuiButton-label" and text()="save"]
    ${button_locator}    Set Variable    //*[@class="MuiButton-label" and text()="save"]
    Execute Javascript    document.evaluate('${button_locator}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();



Click Plus Button 4 Times
    [Arguments]    ${locator}
    FOR    ${i}    IN RANGE    4
        Click Element    ${locator}
    END


###Excel import###
    
Read Excel Data
    [Arguments]    ${row}
    Open Workbook    ${FILE_PATH}
    
    ${value1} =    Get Cell Value    ${row}    1
    ${value2} =    Get Cell Value    ${row}    2
    ${value3} =    Get Cell Value    ${row}    3
    ${value4} =    Get Cell Value    ${row}    4
    ${value5} =    Get Cell Value    ${row}    5
    ${value6} =    Get Cell Value    ${row}    6
    ${value7} =    Get Cell Value    ${row}    7
    ${value8} =    Get Cell Value    ${row}    8
    ${value9} =    Get Cell Value    ${row}    9
    Close Workbook
    [Return]    ${value1}    ${value2}    ${value3}    ${value4}    ${value5}    ${value6}    ${value7}    ${value8}    ${value9}

Input Ref no
    [Arguments]    ${row}
    Wait Until Element Is Visible   locator=//span[contains(text(), 'BT')]
    ${Get_Ref} =   Get Text   locator=//span[contains(text(), 'BT')]
    Log    ${Get_Ref}
    Open Workbook    ${FILE_PATH}
    Set Cell Value   ${row}   10    ${Get_Ref}
    Save Workbook
    Close Workbook


Get Date Without Time
    [Arguments]    ${date_with_time}
    ${date}=    Set Variable    ${date_with_time.split(' ')[0]}
    [Return]    ${date}



Format Date From Excel
    [Arguments]    ${date_with_time}
    ${date}=    Get Date Without Time    ${date_with_time}
    ${formatted_date} =    String.Replace String    ${date}    -    -
    [Return]    ${formatted_date}



Open Headless Firefox Browser
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${firefox_options}    add_argument    --headless
    Create Webdriver    Firefox    options=${firefox_options}

Get Names From Website A With Firefox
    Open Headless Firefox Browser
    Go To    ${URL_A}
    Wait Until Page Contains Element    //*[@class="first-name-th"]
    ${thaiFirstName}=      Get Text     //*[@class="first-name-th"]
    ${thaiLastName}=       Get Text     //*[@class="last-name-th"]
    ${englishFirstName}=   Get Text     //*[@class="first-name-en"]
    ${englishLastName}=    Get Text     (//*[@class="last-name-th"])[2] 
    Close Browser
    Switch Browser    index_or_alias=BrowserA
    [Return]    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName} 


Click Element If Visible
    [Arguments]    ${locator}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
    #Run Keyword If    ${status}    Click Element    ${locator}
    Run Keyword If    ${status}    Wait And Click Element    ${locator}

Wait And Click Element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${locator}


Select Credit limit CC,SPC

    Sleep    6s  
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight/2)
    #Drag And Drop By Offset    //span[@class="MuiSlider-root jss677 MuiSlider-colorPrimary"]    0    0


Add detail spl
        Click Element        //*[text()="Next"]
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Wait Until Element Is Visible    //*[text()="Don't have"]
        Click Element    //*[text()="Don't have"]
        Click Element        //*[text()="Next"]
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
        Input Text    //*[@placeholder="Input account number"]    ${account number scb}
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Click Element    //*[text()="Next"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Click Element    //*[text()="Next"]



Reference Loan SPL

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    2s
        Wait Until Element Is Visible    //*[@placeholder="Select loan issuer"]
        Click Element    //*[@placeholder="Select loan issuer"]
        Wait Until Element Is Visible    (//*[@placeholder="Select loan issuer"])[2]
        Input Text    (//*[@placeholder="Select loan issuer"])[2]    ${Loan Issuer}
        Wait Until Element Is Visible    //*[text()="${Loan Issuer}"]
        Click Element    //*[text()="${Loan Issuer}"]

        Wait Until Element Is Visible    //*[@placeholder="Select type of loan"]
        Click Element    //*[@placeholder="Select type of loan"]
        Click Element    ${Type of Loan}

        ${random_num} =    Generate Random String    9    1234567890          #สุ่มเลขบัตร#
        Log    ${random_num}


        ${value}=    Get Element Attribute    //input[@id="outlined-select-product"]    attribute=value
        Log    ${value}

		Run Keyword If    '${value}' == 'Revolving Cash Card' or '${value}' == 'Credit Card'
		...    Run Keywords
		...    Wait Until Element Is Visible    //*[@id="formatted-text-mask-input0"]
		...    AND    Input Text    //*[@id="formatted-text-mask-input0"]    3${random_num}
		
		Run Keyword If    '${value}' == 'Personal Loan'
		...    Run Keywords
		...    Wait Until Element Is Visible    //*[@placeholder="Input account/credit card number"]
		...    AND    Input Text    //*[@placeholder="Input account/credit card number"]    3${random_num}

        Wait Until Element Is Visible    //*[@name="billDatetext"]
        Input Text    //*[@name="billDatetext"]    ${Bill Date}
        Wait Until Element Is Visible    //*[@name="originalAmounttext"]
        Input Text    name=originalAmounttext    ${Original Credit Limit/Loan Amount}
        Wait Until Element Is Visible    id=formatted-payoff-amount-text-input
        Input Text    id=formatted-payoff-amount-text-input    ${Payoff Amount}

        Run Keyword If    '${Account Order}' == '1'
        ...    Run Keywords
        ...    Sleep    3s
        ...    AND    Click Element        //*[text()="Payoff Amount"]
        ...    AND    Wait Until Element Is Visible    css:.MuiDialog-paper
        ...    AND    Execute JavaScript    document.querySelector('.MuiDialog-paper').scrollTop = 500
        ...    AND    Click Element        (//*[text()="Next"])[2]

        Run Keyword If    '${Account Order}' == '2'
        ...    Run Keywords
        ...    Sleep    3s
        ...    AND    Click Element        //*[text()="Payoff Amount"]
        ...    AND    Wait Until Element Is Visible    css:.MuiDialog-paper
        ...    AND    Execute JavaScript    document.querySelector('.MuiDialog-paper').scrollTop = 500
        ...    AND    sleep    5s
        ...    AND    Wait Until Element Is Visible    //*[text()="Add Reference Loan Account"]
        ...    AND    Click Element    //*[text()="Add Reference Loan Account"]
        ...    AND    Reference Loan SPL_2

        Run Keyword If    '${Account Order}' == '3'
        ...    Run Keywords
        ...    Sleep    3s
        ...    AND    Click Element        //*[text()="Payoff Amount"]
        ...    AND    Wait Until Element Is Visible    css:.MuiDialog-paper
        ...    AND    Execute JavaScript    document.querySelector('.MuiDialog-paper').scrollTop = 500
        ...    AND    sleep    5s
        ...    AND    Wait Until Element Is Visible    //*[text()="Add Reference Loan Account"]
        ...    AND    Click Element    //*[text()="Add Reference Loan Account"]
        ...    AND    Reference Loan SPL_2


Reference Loan SPL_2

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    2s
        Wait Until Element Is Visible    (//*[@placeholder="Select loan issuer"])[2]
        Click Element    (//*[@placeholder="Select loan issuer"])[2]
        Wait Until Element Is Visible    (//*[@placeholder="Select loan issuer"])[3]
        Input Text    (//*[@placeholder="Select loan issuer"])[3]    ${Loan Issuer2}
        Wait Until Element Is Visible    //*[text()="${Loan Issuer2}"]
        Click Element    //*[text()="${Loan Issuer2}"]

        Wait Until Element Is Visible    (//*[@placeholder="Select type of loan"])[2]
        Click Element    (//*[@placeholder="Select type of loan"])[2]
        Click Element    ${Type of Loan}

        ${random_num} =    Generate Random String    9    1234567890          #สุ่มเลขบัตร#
        Log    ${random_num}


        ${value}=    Get Element Attribute    (//input[@id="outlined-select-product"])[2]    attribute=value
        Log    ${value}

		Run Keyword If    '${value}' == 'Revolving Cash Card' or '${value}' == 'Credit Card'
		...    Run Keywords
		...    Wait Until Element Is Visible    //*[@id="formatted-text-mask-input1"]
		...    AND    Input Text    //*[@id="formatted-text-mask-input1"]    3${random_num}
		
		Run Keyword If    '${value}' == 'Personal Loan'
		...    Run Keywords
		...    Wait Until Element Is Visible    (//*[@placeholder="Input account/credit card number"])[2]
		...    AND    Input Text    (//*[@placeholder="Input account/credit card number"])[2]    3${random_num}

        Wait Until Element Is Visible    (//*[@name="billDatetext"])[2]
        Input Text    (//*[@name="billDatetext"])[2]    ${Bill Date}
        Wait Until Element Is Visible    (//*[@name="originalAmounttext"])[2]
        Input Text    (//input[@name='originalAmounttext'])[2]    ${Original Credit Limit/Loan Amount}
        Wait Until Element Is Visible    (//*[@id='formatted-payoff-amount-text-input'])[2]
        Input Text    (//*[@id='formatted-payoff-amount-text-input'])[2]    ${Payoff Amount}

        Run Keyword If    '${Account Order}' == '2'
        ...    Run Keywords
		...    Wait Until Element Is Visible    css:.MuiDialog-paper
		...    AND    Execute JavaScript    document.querySelector('.MuiDialog-paper').scrollTop = 500
        ...    AND    Sleep    4s
		...    AND    Double Click Element       (//*[text()="Next"])[2]

        Run Keyword If    '${Account Order}' == '3'
        ...    Run Keywords
		...    Wait Until Element Is Visible    css:.MuiDialog-paper
		...    AND    Execute JavaScript    document.querySelector('.MuiDialog-paper').scrollTop = 500
        ...    AND    sleep    5s
        ...    AND    Wait Until Element Is Visible    //*[text()="Add Reference Loan Account"]
        ...    AND    Double Click Element    //*[text()="Add Reference Loan Account"]
        ...    AND    Reference Loan SPL_3

Reference Loan SPL_3

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    2s
        Wait Until Element Is Visible    (//*[@placeholder="Select loan issuer"])[3]
        Click Element    (//*[@placeholder="Select loan issuer"])[3]
        Wait Until Element Is Visible    (//*[@placeholder="Select loan issuer"])[4]
        Input Text    (//*[@placeholder="Select loan issuer"])[4]    ${Loan Issuer3}
        Wait Until Element Is Visible    //*[text()="${Loan Issuer3}"]
        Click Element    //*[text()="${Loan Issuer3}"]

        Wait Until Element Is Visible    (//*[@placeholder="Select type of loan"])[3]
        Click Element    (//*[@placeholder="Select type of loan"])[3]
        Click Element    ${Type of Loan}

        ${random_num} =    Generate Random String    9    1234567890          #สุ่มเลขบัตร#
        Log    ${random_num}


        ${value}=    Get Element Attribute    (//input[@id="outlined-select-product"])[3]    attribute=value
        Log    ${value}

		Run Keyword If    '${value}' == 'Revolving Cash Card' or '${value}' == 'Credit Card'
		...    Run Keywords
		...    Wait Until Element Is Visible    //*[@id="formatted-text-mask-input2"]
		...    AND    Input Text    //*[@id="formatted-text-mask-input2"]    3${random_num}
		
		Run Keyword If    '${value}' == 'Personal Loan'
		...    Run Keywords
		...    Wait Until Element Is Visible    (//*[@placeholder="Input account/credit card number"])[3]
		...    AND    Input Text    (//*[@placeholder="Input account/credit card number"])[3]    3${random_num}

        Wait Until Element Is Visible    (//*[@name="billDatetext"])[3]
        Input Text    (//*[@name="billDatetext"])[3]    ${Bill Date}
        Wait Until Element Is Visible    (//*[@name="originalAmounttext"])[3]
        Input Text    (//input[@name='originalAmounttext'])[3]    ${Original Credit Limit/Loan Amount}
        Wait Until Element Is Visible    (//*[@id='formatted-payoff-amount-text-input'])[3]
        Input Text    (//*[@id='formatted-payoff-amount-text-input'])[3]    ${Payoff Amount}

		Wait Until Element Is Visible    css:.MuiDialog-paper
		Execute JavaScript    document.querySelector('.MuiDialog-paper').scrollTop = 900
		Double Click Element        (//*[text()="Next"])[2]


Add Reference Loan Account

		Wait Until Element Is Visible    css:.MuiDialog-paper
		Execute JavaScript    document.querySelector('.MuiDialog-paper').scrollTop = 500
        Wait Until Element Is Visible    //*[text()="Add Reference Loan Account"]
        Sleep    1s
		Execute Javascript    document.querySelector('//*[text()="Add Reference Loan Account"]').click()


        #Upload
Upload picture


        #Sleep    10s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        
        #Wait Until Element Is Visible    //*[@class="jss1199" and text()="Add photo"]
        #Click Element    locator=//*[@class="jss1199" and text()="Add photo"]
        Wait Until Element Is Visible    //*[text()="Add photo"]
        Sleep    5s

		Click Element    //*[text()="Add photo"]
        Sleep    3s
        Choose File   xpath=//*[@id="selectImage"]    D:\\automate\\Setup\\test.jpg
        Sleep    3s
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    1s
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Sleep    5s
        Wait Until Element Is Visible    locator=//*[text()="Done"]
        Sleep    3s
        Click Element    //*[text()="Done"]
        #Sleep    10s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    4s
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Sleep    5s



