*** Settings ***

Resource    ..//1.Setting/Setting.robot


*** Variables ***

${URL_A}    https://kidhaina.com/thainamegenerator.html
${URL_B}    https://kidhaina.com/citizenid.html
${URL}    https://cardxscb--uat.sandbox.my.salesforce.com/?ec=302&startURL=%2Fvisualforce%2Fsession%3Furl%3Dhttps%253A%252F%252Fcardxscb--uat.sandbox.lightning.force.com%252Fvisualforce%252Fsession%253Furl%253Dhttps%25253A%25252F%25252Fcardxscb--uat--c.sandbox.vf.force.com%25252Fapex%25252FSLS_AssistedSalesApp
#${URL}    https://cardxscb--sit2.sandbox.my.salesforce.com/?ec=302&startURL=%2Fvisualforce%2Fsession%3Furl%3Dhttps%253A%252F%252Fcardxscb--sit2.sandbox.lightning.force.com%252Fvisualforce%252Fsession%253Furl%253Dhttps%25253A%25252F%25252Fcardxscb--sit2--c.sandbox.vf.force.com%25252Fapex%25252FSLS_AssistedSalesApp
#${URL}    https://test.salesforce.com/?ec=302&startURL=%2Fvisualforce%2Fsession%3Furl%3Dhttps%253A%252F%252Fcardxscb--uat--c.sandbox.vf.force.com%252Fapex%252FSLS_AssistedSalesApp
${random_House_number}=    Generate Random Number    100    999



##ค่าที่สามารถแกไข
${nIDNumber}            3105281666359                           
${PhoneNumber}          (090)123-7355
${Birth Day}            1983-01-01
${income}               50000


##User login##
${username_sit}    narintara.pakaew@cardx.sit2
${password_sit}    Scb@112233!!!!

${username_UAT}    Alonggorn.p@cardx.uat 
${password_UAT}    Paohub1993#

${Email}                Rukpiece41rr@gmail.com
${Company name}         Nospital
${Sales code 1}         e20566
${Sales code 1_uat}     VB001



${FILE_PATH}    D:\\automate\\Setup\\DATA_ONBORAD (1).xlsx   ##กำหนด PATH ไฟลที่จะดึงข้อมูลมาใช้งาน
${MAX_ROW}    14           ##กำหนดให้ค่ามากกว่าข้อมูลในไฟล์ EXCEL มากกว่า 1 เสมอ เช่น ในข้อมูลมี 5 แถว ให้กำหนดเปน 6
${CONTINUE_LOOP}  CONTINUE
${EMPTY}    ""


#######################################################
${CARD_TYPE_CC}     CC
${CARD_TYPE_SPC}    SPC
${CARD_TYPE_SPL}    SPL

${SELECTED_CARD}    CC  #เลือกประเภทบัตร

#${Product}    //*[@src="https://cdx-sit2-ssc-frontend.np.cardx.co.th/992x992_px_06_d6fab2d1bf.png"]                                       ### VISA CARD ###
#${Product}    //*[@src='https://cdx-sit2-ssc-frontend.np.cardx.co.th/sqaurecardimage_dev2_f072886255.jpg']                                ### MASTER CARD ###
#${Product}    //*[@src="https://cdx-uat2-ssc-frontend.np.cardx.co.th/992x992_px_01_252d6298ed.png"]                                       ### CardX SPEEDY CASH ###

${Product}    //*[text()="CardX XTRA PLATINUM"]                  ### Master card_uat ###
#${Product}    //*[text()="CardX XTRA PLATINUM "]                   ### Visa Card_uat ###
#${Product}    //*[text()="CardX SPEEDY CASH"]                      ### CardX SPEEDY CASH UAT ###
#${Product}    //*[text()="CardX SPEEDY LOAN"]                      ### CardX SPEEDY LOAN UAT ###
#${Product}      //*[text()="CardX SPEEDY LOAN BALANCE TRANSFER"]      ### CardX SPEEDY LOAN BALANCE TRANSFER ###

########################################################
###CardX SPEEDY LOAN###

# ${Select installment period (month)}    12
# ${Select installment period (month)}    18
# ${Select installment period (month)}    24
# ${Select installment period (month)}    36
# ${Select installment period (month)}    48
${Select installment period (month)}    60
#${Select installment period (month)}    72

#### Select bank account SPL ###
${Saving Account}    (//div[div[text()="Saving Account"])[1]
#${Saving Account}   (//div[div[text()="Saving Account"])[2]
#${Saving Account}   (//div[div[text()="Saving Account"])[3]

### Account number SPL ###
${account number scb}    1113909131

### Reference Loan Account ###

##Loan Issuer
# ${Loan Issuer}    CITI CONSUMER PRODUCTS (THAILAND) COMPANY LIMITED
# ${Loan Issuer}    American Express
# ${Loan Issuer}    AEON Thana Sinsap (Thailand) Public Company Limited
# ${Loan Issuer}    General Card Services Company Limited
# ${Loan Issuer}    Ayudhya Capital Services Co.,Ltd.
# ${Loan Issuer}    Tesco Lotus Money Services Limited
# ${Loan Issuer}    Promise (Thailand) Co., Ltd.
# ${Loan Issuer}    CITICORP LEASING (THAILAND) COMPANY LIMITED.
# ${Loan Issuer}    Summit Capital Leasing Company Limited
# ${Loan Issuer}    BANGKOK BANK PUBLIC COMPANY LIMITED
${Loan Issuer}    KASIKORNBANK PUBLIC. COMPANY LIMITED
${Loan Issuer3}    Krung Thai Bank Public Company Limited
# ${Loan Issuer}    TMBThanachart Bank Public Company Limited
${Loan Issuer2}    CITI BANK N.A.
# ${Loan Issuer}    STANDARD CHARTERED BANK
# ${Loan Issuer}    CIMB Thai Bank Public Company Limited
# ${Loan Issuer}    United Overseas Bank (Thai) Public Company Limited
# ${Loan Issuer}    Bank of Ayudhya Public Company Limited
# ${Loan Issuer}    The Government Savings Bank
# ${Loan Issuer}    Bank of China
# ${Loan Issuer}    ISLAMIC BANK
# ${Loan Issuer}    KIATNAKIN BANK
# ${Loan Issuer}    Industrial and Commercial Bank of China Limited
# ${Loan Issuer}    THAI CREDIT RETAIL BANK
# ${Loan Issuer}    JFintech CO.,LTD.


##Type of Loan

#${Type of Loan}    //*[text()="Revolving Cash Card"]
${Type of Loan}    //*[text()="Credit Card"]
#${Type of Loan}     //*[text()="Personal Loan"]

##Bill Date

${Bill Date}    01/11/2023
${Original Credit Limit/Loan Amount}    50000
${Payoff Amount}    20000

## Account Order
${Account Order}    3
#${Loop Order}    1



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
		#Execute JavaScript    window.scrollBy(0, 300)   # เลื่อนลง 300px
        Scroll Element Into View    //*[text()='Apply']
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

        Wait Until Element Is Visible    //*[text()="Next"] 
        Click Element    //*[text()="Next"] 
        # Click Element    //*[text()="Dip Chip"]      # คลิกDip Chip
        #Sleep    15s
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    7s
        
        Wait Until Element Is Visible    (//*[text()='Next'])[2]
        Click Element    (//*[text()='Next'])[2]
        # Execute Javascript    document.evaluate("//*[text()='Next']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    //*[text()="Customer Photo"]
        Sleep    2s
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        #Execute JavaScript    window.scrollBy(0, 300)
        Choose File    id=file1    D:\\automate\\Setup\\test.jpg
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
        Press Keys    //*[@id="income"]    CTRL+a+DELETE
        Input Text          id=income    ${Income_Excel}
        Click Element       //*[text()="Calculate"]
        #Click Element    //*[text()="Confirm previous income"] 
        Click Element If Visible  //*[text()="No thanks, next"]

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Select Credit limit CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Select Credit limit CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'
        ...    Run Keywords
        ...    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight / 2);
        ...    AND    Sleep    5s
        ...    AND    Drag And Drop By Offset    //span[contains(@class, 'MuiSlider-colorPrimary')]   50    0
        ...    AND    Click Element    //*[text()="${Select installment period (month)}"]
        ...    AND    Sleep    3s
        ...    AND    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

        Wait Until Element Is Visible    locator=//*[text()="Next"] 
        Sleep    1s 
        Click Element        //*[text()="Next"] 
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]

		${status}=    Run Keyword And Return Status    Page Should Contain    Reference Loan Account
		Run Keyword If    ${status}    Reference Loan SPL


        
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
        Click Element        //*[text()="Use address as specified in National ID Card"]
        Click Element        //*[text()="National ID Card"]
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
        Wait Until Element Is Visible    //*[text()="Use address as specified in National ID Card"]
        Sleep    3s
        Click Element        //*[text()="Use address as specified in National ID Card"]

        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Click Element        //*[text()="Save"]
        
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Click Element        //*[text()="Next"]
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Add detail spc
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Add detail spl


        #Sleep    10s
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    1s
        Wait Until Element Is Visible    //*[text()="Continue"] 
        Click Element        //*[text()="Continue"] 
        #Sleep    20s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]


        #Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'    Click Element        //*[text()="Continue"] 
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
        Sleep    2s
        Choose File   xpath=//*[@id="selectImage"]    D:\\automate\\Setup\\test.jpg
        Sleep    3s
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    1s
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Sleep    5s
        Wait Until Element Is Visible    locator=//*[text()="Done"]
        Sleep    3s
        Click Element    //*[text()="Done"]
        Sleep    10s
        Wait Until Element Is Not Visible    //*[text()="Please wait"]
        Sleep    4s
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

        Sleep    5s
        ${status1}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@id="5"]//div[text()="Upload"]    1s
        Run Keyword If    ${status1}
        ...    Run Keywords
        ...    Wait Until Element Is Visible    //*[@id="5"]//div[text()="Upload"]
        ...    AND    Click Element    //*[@id="5"]//div[text()="Upload"]
        ...    AND    Upload picture


        ${status2}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@id="6"]//div[text()="Upload"]    1s
        Run Keyword If    ${status2}
        ...    Run Keywords
        ...    Wait Until Element Is Visible    //*[@id="6"]//div[text()="Upload"]    5s
        ...    AND    Click Element    //*[@id="6"]//div[text()="Upload"]
        ...    AND    Upload picture


        ${status3}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@id="7"]//div[text()="Upload"]    1s
        Run Keyword If    ${status3}
        ...    Run Keywords
        ...    Wait Until Element Is Visible    //*[@id="7"]//div[text()="Upload"]
        ...    AND    Click Element    //*[@id="7"]//div[text()="Upload"]
        ...    AND    Upload picture

        Wait Until Element Is Visible    //*[text()="Submit document"]
        Click Element    //*[text()="Submit document"]
        Click Element    //*[text()="Confirm"]
        Wait Until Element Is Visible    xpath=//*[text()="Back to home page"]
        Input Ref no    ${ROW}
        Scroll Element Into View    xpath=//*[text()="Back to home page"]
        Click Element    xpath=//*[text()="Back to home page"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]

    END





