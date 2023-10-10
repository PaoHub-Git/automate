*** Settings ***
Library    SeleniumLibrary    80s    screenshot_root_directory=results/
Library    DateTime
Library    String
Library    Dialogs
Library    FakerLibrary
Library    RPA.Tables
Library    RPA.Excel.Files


*** Variables ***



${URL_A}    https://kidhaina.com/thainamegenerator.html
#${URL}    https://cardxscb--sit2.sandbox.my.salesforce.com/?ec=302&startURL=%2Fvisualforce%2Fsession%3Furl%3Dhttps%253A%252F%252Fcardxscb--sit2.sandbox.lightning.force.com%252Fvisualforce%252Fsession%253Furl%253Dhttps%25253A%25252F%25252Fcardxscb--sit2--c.sandbox.vf.force.com%25252Fapex%25252FSLS_AssistedSalesApp
${URL}    https://test.salesforce.com/?ec=302&startURL=%2Fvisualforce%2Fsession%3Furl%3Dhttps%253A%252F%252Fcardxscb--uat--c.sandbox.vf.force.com%252Fapex%252FSLS_AssistedSalesApp
${URL_C}    https://kidhaina.com/citizenid.html




${random_House_number}=    Generate Random Number    100    999

${100,000}    -48


##ค่าที่สามารถแกไข
${nIDNumber}            3105281666359                           
${PhoneNumber}          (090)123-7355
${Birth Day}            1983-01-01
${income}               50000


${username_sit}    narintara.pakaew@cardx.sit2
${password_sit}    Scb@112233!!!!

${username_UAT}             Alonggorn.p@cardx.uat 
${password_UAT}             Paohub1993#
${Email}                Rukpiece41rr@gmail.com
${Company name}         Nospital
${Sales code 1}         e20566
${Sales code 1_uat}     VB001

###


#หน้าเลือก Produck
#&{Produck}    
#...        Produck=xpath=//*[@class="jss79" and text()='Credit Card']
#...        Master card=xpath=//*[@src='https://cdx-sit2-ssc-frontend.np.cardx.co.th/sqaurecardimage_dev2_f072886255.jpg']
#...        Visa Card=xpath=//*[@src="https://cdx-sit2-ssc-frontend.np.cardx.co.th/992x992_px_06_d6fab2d1bf.png"]
#
#...        Master card_uat=xpath=//*[@src="https://cdx-uat2-ssc-frontend.np.cardx.co.th/xtra_platinum_mastercard_card_square_Image_6b7742c126.jpg"]
#...        Visa Card_uat=xpath=//*[@src="https://cdx-uat2-ssc-frontend.np.cardx.co.th/xtra_platinum_visa_square_Card_Image_95e757bd4d.png"]


*** Variables ***
${FILE_PATH}    C:\\Users\\Alonggorn Panthong\\Documents\\DATA_ONBORAD (1).xlsx
${MAX_ROW}    7
${CONTINUE_LOOP}  CONTINUE
${EMPTY}    ""




#######################################################
${CARD_TYPE_CC}     CC
${CARD_TYPE_SPC}    SPC
${CARD_TYPE_SPL}    SPL
${SELECTED_CARD}    SPC  #เลือกประเภทบัตร

#${Product}    //*[@src="https://cdx-sit2-ssc-frontend.np.cardx.co.th/992x992_px_06_d6fab2d1bf.png"]                                       ### VISA CARD ###
#${Product}    //*[@src='https://cdx-sit2-ssc-frontend.np.cardx.co.th/sqaurecardimage_dev2_f072886255.jpg']                                ### MASTER CARD ###
#${Product}    //*[@src="https://cdx-uat2-ssc-frontend.np.cardx.co.th/992x992_px_01_252d6298ed.png"]                                       ### CardX SPEEDY CASH ###

#${Product}    //*[text()="CardX XTRA PLATINUM"]                  ### Master card_uat ###
#${Product}    //*[text()="CardX XTRA PLATINUM "]                  ### Visa Card_uat ###
${Product}    //*[text()="CardX SPEEDY CASH"]                    ### CardX SPEEDY CASH UAT ###
#${Product}    //*[text()="CardX SPEEDY LOAN"]                    ### CardX SPEEDY LOAN UAT ###

########################################################
###CardX SPEEDY LOAN###

# ${Select installment period (month)}    12
# ${Select installment period (month)}    18
# ${Select installment period (month)}    24
# ${Select installment period (month)}    36
# ${Select installment period (month)}    48
# ${Select installment period (month)}    60
${Select installment period (month)}    72

#### Select bank account SPL ###
${Saving Account}    (//div[div[text()="Saving Account"])[1]
#${Saving Account}   (//div[div[text()="Saving Account"])[2]
#${Saving Account}   (//div[div[text()="Saving Account"])[3]

### Account number SPL ###
${account number scb}    1113909131

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

*** Tasks ***

Onboarding And Get Names


        #${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName}=    Get Names From Website A
        #${GET ID}=    Get cid from web
        Open web onbording
        
        login    ${username_UAT}    ${password_UAT}
        Pause Execution    Please enter "Salesforce Authenticator"


    FOR    ${ROW}    IN RANGE    2    ${MAX_ROW}
        ${CID_Excel}    ${Phone number_Excel}    ${Date of birth_Excel}    ${thaiFirstName_Excel}    ${thaiLastName_Excel}    ${englishFirstName_Excel}    ${englishLastName_Excel}    ${Income_Excel}    ${Email_Excel} =    Read Excel Data    ${ROW}
        ${CID_Excel} =                Convert To String    ${CID_Excel}
        ${Phone number_Excel} =       Convert To String    ${Phone number_Excel}
        ${Date of birth_Excel} =      Convert To String    ${Date of birth_Excel}
        ${thaiFirstName_Excel} =      Convert To String    ${thaiFirstName_Excel}
        ${thaiLastName_Excel} =       Convert To String    ${thaiLastName_Excel}
        ${englishFirstName_Excel} =   Convert To String    ${englishFirstName_Excel}
        ${englishLastName_Excel} =    Convert To String    ${englishLastName_Excel}
        ${Income_Excel} =             Convert To String    ${Income_Excel}
        ${Email_Excel} =              Convert To String    ${Email_Excel}

        # ถ้า CID และ Phone number ว่างทั้งคู่, หยุดลูป
        ${isCIDEmpty} =    Run Keyword And Return Status    Should Be Empty    ${CID_Excel}
        ${isPhoneEmpty} =    Run Keyword And Return Status    Should Be Empty    ${Phone number_Excel}
        
        ${shouldExit} =    Evaluate    ${isCIDEmpty} and ${isPhoneEmpty}
        Exit For Loop If    ${shouldExit}
        
        ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName}=    Get Names From Website A

        
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Select card Credit Card
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Select card Speedy Cash
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Select card Speedy Loan


		Wait Until Element Is Visible  //*[text()='Apply']
		Execute JavaScript    window.scrollBy(0, 300)   # เลื่อนลง 300px
		#Sleep    5s
		Wait Until Element Is Visible    locator=//*[text()='Apply']
		Click Element                  //*[text()='Apply']
	    Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    2s
        Wait Until Element Is Visible    //*[text()="Data privacy notice"]
        Sleep    3s

        Execute Javascript    document.getElementById('consent-content').scrollTop = document.getElementById('consent-content').scrollHeight;


        Sleep    3s
		Click Element    //*[text()='Continue']

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Nationality

        Input data
        ${random_number}=    Generate Random House Number
        ${random_number2}=   Generate Random House Number 2
        Press Keys    //*[@placeholder="House number"]    CTRL+a+DELETE
        Input Text    //*[@placeholder="House number"]     ${random_number}/${random_number2}

        Input Names To Website B    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName}
        #Input name manaul    ${thaiFirstName_Excel}    ${thaiLastName_Excel}    ${englishFirstName_Excel}    ${englishLastName_Excel}
        Sleep    2s
        Click Element    //*[@name="nIDNumber"]
        Press Keys    //*[@name="nIDNumber"]    CTRL+a+DELETE
        Input Text       //*[@name="nIDNumber"]    ${CID_Excel}
        #Input cid from url_c    ${GET ID}
        
        
        ${Date of birth_Excel} =    Set Variable    1983-01-01 00:00:00
        ${formatted_date} =    Format Date From Excel    ${Date of birth_Excel}
        Log    ${formatted_date}
        
        Press Keys    //*[@name="birthDate"]    CTRL+a+DELETE
        Input Text    name=birthDate    ${formatted_date}
        clil svae mockup data

        Click Element    //*[text()="Dip Chip"]      # คลิกDip Chip
        #Sleep    15s
    
        Wait Until Element Is Visible    //*[text()="Next"] 
        Click Element    //*[text()="Next"] 
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    //*[text()="Customer Photo"]
        Sleep    2s
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        #Execute JavaScript    window.scrollBy(0, 300)
        Choose File    id=file1    D:\\test.jpg
        Click Element    //*[text()="Confirm"]
        Click Element    //*[text()="Yes"]
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    4s
        Execute JavaScript    window.scrollBy(0, 300) 
        Set Focus To Element    //*[@class="MuiInputBase-input MuiOutlinedInput-input"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    1s
        Wait Until Element Is Visible    //*[@class="MuiInputBase-input MuiOutlinedInput-input"] 
        Input Text           //*[@class="MuiInputBase-input MuiOutlinedInput-input"]    ${Phone number_Excel}
        Execute JavaScript    window.scrollBy(0, 300) 
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Wait Until Element Is Visible    //*[text()="Next"] 
        Click Element        //*[text()="Next"] 
        #Sleep    8s
        Wait Until Element Is Visible    //*[text()="skipOTP"] 
        Click Element        //*[text()="skipOTP"] 
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        #Wait Until Element Is Visible    //*[text()="Accept"]
        #Wait Until Element Is Enabled    //*[text()="Accept"]
        #Sleep    5s
        #Click Element    //*[text()="Accept"]
        #Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]


        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Select income

        Wait Until Element Is Visible    //*[@id="income"]
        Input Text          id=income    ${Income_Excel}
        Click Element       //*[text()="Calculate"] 
        Click Element If Visible  //*[text()="No thanks, next"]

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Select Credit limit CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Select Credit limit CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'
        ...    Run Keywords
        ...    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight / 2);
        ...    AND    Sleep    5s
        ...    AND    Drag And Drop By Offset    //span[@class="MuiSlider-root jss631 MuiSlider-colorPrimary"]    50    0
        ...    AND    Click Element    //*[text()="${Select installment period (month)}"]
        ...    AND    Sleep    3s
        ...    AND    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)



        Wait Until Element Is Visible    locator=//*[text()="Next"]  
        Click Element        //*[text()="Next"] 
        Click Element        //*[text()="Confirm"] 
        Wait Until Element Is Visible    //*[text()="Current address"] 
        Scroll Element Into View    //*[text()="Current address"]    
        Wait Until Element Is Visible    //*[@placeholder="Select education level"]
        Wait Until Element Is Visible    //*[@placeholder="Select education level"]
        Click Element        //*[@placeholder="Select education level"]
        Wait Until Element Is Visible    (//*[@placeholder="Select education level"])[2]
        Input Text           (//*[@placeholder="Select education level"])[2]        BACHELOR'S DEGREE
        Click Element        //*[text()="BACHELOR'S DEGREE"]

        Click Element        //*[@placeholder="Select marital status"]
        Input Text           (//*[@placeholder="Select marital status"])[2]       SINGLE
        Click Element        //*[text()="SINGLE"]
        Press Keys    //*[@name="emailAddressForStatement"]    CTRL+a+DELETE
        Input Text           //*[@name="emailAddressForStatement"]    ${Email_Excel}
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Click Element        //*[text()="Use address in National ID card"]
        Click Element        //*[text()="Use address in the national ID card"]
        Click Element        //*[text()="Next"] 
        #Sleep    8s
        Wait Until Element Is Visible    locator=//*[text()="skipOTP"]
        Click Element        //*[text()="skipOTP"]
        #Sleep    20s
    
        Wait Until Element Is Not Visible  locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    locator=(//*[@class="MuiIconButton-label"])[3]
        Click Element        (//*[@class="MuiIconButton-label"])[3]
        Click Element        //*[@placeholder="Select occupation"]
        Input Text           //*[@placeholder="Search"]     Doctor
        #Sleep    3s
        Wait Until Element Is Visible    locator=//*[text()="Doctor"]
        Click Element        //*[text()="Doctor"]
        Input Text    name=companyName    ${Company name}

        Click Element        //*[@placeholder="Select year(s) and month(s)"]
        Click Plus Button 4 Times            //*[name()='path' and @d='M14 8H8V14H6V8H0V6H6V0H8V6H14V8Z']
        Wait Until Element Is Visible    //*[text()="OK"] 
        Sleep    3s
        Click Element        //*[text()="OK"] 
        #Sleep    6s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Input Text    //*[@name="mobileNo"]    ${PhoneNumber}
    
        Click Element        //*[@placeholder="Input work address"]
        Wait Until Element Is Visible    //*[text()="Use the address in the National ID card"]
        Sleep    3s
        Click Element        //*[text()="Use the address in the National ID card"]

        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Click Element        //*[text()="Save"]


        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Add detail spc
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Add detail spl


        #Sleep    10s
        Wait Until Element Is Visible    //*[text()="Continue"] 
        Click Element        //*[text()="Continue"] 
        #Sleep    20s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]


        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'    Click Element        //*[text()="Continue"] 
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'
        ...    Run Keywords
        ...    Wait Until Element Is Visible    //*[text()="SCB Account"]
        ...    AND    Click Element    //*[text()="SCB Account"]

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Select add account number or not


        Wait Until Element Is Visible    locator=//*[@alt="arrowdown"]
        Click Element    //*[@alt="arrowdown"]
        Sleep    2s
        
        Click Element    //*[text()="Accept"]
        Click Element    //*[text()="skipOTP"]
        #Sleep    30s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Click Element    (//*[@class="MuiButton-label"])[2]
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        #Sleep    5s
        Scroll Element Into View    //*[text()="Accept all"]
        Click Element    //*[text()="Accept all"]
        #Execute Javascript    document.evaluate("//*[text()='Accept all']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();
        #Click Element    (//*[@class="MuiIconButton-label"])[5]
        Click Element    //*[text()="I have read and agreed to the"]
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

        #Click Element    (//*[@class="MuiIconButton-label"])[13]
        Click Element     //*[text()="Next"] 
        #Sleep    15s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Wait Until Element Is Visible   locator=//*[@name="ReferralCode1"] 
        Input Text    //*[@name="ReferralCode1"]    ${Sales code 1_uat}
        Sleep    4s

        Next

        #Sleep    20s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Click Element     //*[text()="Confirm application"]
        # Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Wait Until Element Is Visible    //*[text()="skipOTP"]
        Click Element    //*[text()="skipOTP"]
        Wait Until Element Is Not Visible    //*[text()="Application is being processed,please wait a few minutes"]    200s
        Wait Until Element Is Visible    //*[text()="Submit document via Sale Tablet"]
        Click Element    //*[text()="Submit document via Sale Tablet"]
    

        #Upload

        Wait Until Element Is Visible    //*[text()="Upload"]
        Sleep    3s
        Click Element    //*[text()="Upload"]  
        #Sleep    10s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        
        #Wait Until Element Is Visible    //*[@class="jss1199" and text()="Add photo"]
        #Click Element    locator=//*[@class="jss1199" and text()="Add photo"]
        Wait Until Element Is Visible    //*[text()="Add photo"]
        Sleep    5s

		Click Element    //*[text()="Add photo"]
        Sleep    3s
        Choose File   xpath=//*[@id="selectImage"]    D:\\test.jpg
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
        Wait Until Element Is Visible    //*[text()="Submit document"]
        Click Element    //*[text()="Submit document"]
        Click Element    //*[text()="Confirm"]
        Wait Until Element Is Visible    xpath=//*[text()="Back to home page"]
        Input Ref no    ${ROW}
        Scroll Element Into View    xpath=//*[text()="Back to home page"]
        Click Element    xpath=//*[text()="Back to home page"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]

    END
    
    