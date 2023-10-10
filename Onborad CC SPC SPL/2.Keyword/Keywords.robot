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
        Click Element        //*[text()="Continue"]



        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Click Element    //*[text()="Don't have"]
        Click Element        //*[text()="Continue"]



        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    3s
        Click Element    //*[text()="Not receive"]
        Click Element        //*[text()="Continue"]

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]



Input data
    Wait Until Element Is Visible   //*[text()='mockup data']
    Execute JavaScript    window.scrollBy(0, 300)
    Click Element                  //*[text()='mockup data']
    Click Element        //*[text()="2021061790700"]


Next

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Go To    ${URL_C}
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
    Run Keyword If    ${status}    Click Element    ${locator}


Select Credit limit CC,SPC

    Sleep    6s  
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight/2)
    #Drag And Drop By Offset    //span[@class="MuiSlider-root jss677 MuiSlider-colorPrimary"]    0    0


Add detail spl
        Click Element        //*[text()="Continue"]
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
        Input Text    //*[@placeholder="Input account number"]    ${account number scb}
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Click Element    //*[text()="Next"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Click Element    //*[text()="Next"]