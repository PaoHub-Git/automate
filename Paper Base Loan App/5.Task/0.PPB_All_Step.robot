*** Settings ***

Resource    ..//1.Setting/Setting.robot


*** Variables ***
#######################################################
${CARD_TYPE_CC}     CC
${CARD_TYPE_SPC}    SPC
${CARD_TYPE_SPL}    SPL
${SELECTED_CARD}    CC  #เลือกประเภทบัตร
#######################################################

${NTU}    NTU
${ETB}    ETB
${SELECTED_TYPE}    NTU

#######################################################

${National ID Card Number}    3102268973232
${mobileNo}    900015699
${First Name (TH)}
${Last Name (TH)}
${First Name (EN)}    along
${Last Name (EN)}    kon
#${Date of Birth}    01-01-1983
${Laser ID}    ME46395867


${Sales Referral Code 1}    N32099
${installment period}    72

*** Tasks ***

Open and login SF
    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName}=    Get Names From Website        ###สุ่มชื่อ TH EN
    Open and login   Username=${Username_uat}   Password=${Password_uat}
        Wait Until Element Is Visible    locator=//*[@aria-label="Search"]
        Sleep    6s
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
		${element1}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="Show Navigation Menu"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		${EN}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="Show Navigation Menu"]    5s
		${element2}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="แสดงเมนูการนำทาง"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		${TH}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="แสดงเมนูการนำทาง"]    5s
		Wait Until Keyword Succeeds    3x    10s    Log    Waiting for elements...    # รอจนกว่าหนึ่งในสอง text จะปรากฎ ด้วยการลอง 3 ครั้ง แต่ละครั้งระยะห่าง 10 วินาที
	
		Run Keyword If    ${TH}    Check For Elements language_1


		${element3}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="Show Navigation Menu" ]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;

        Wait Until Element Is Visible    locator=//*[@type="button" and @title="Show Navigation Menu" ]
        Click Element   locator=//*[@type="button" and @title="Show Navigation Menu" ]
        Sleep    5s
        Wait Until Element Is Visible    locator=//*[text()="Submit Paper Base Loan App"]
        Click Element   locator=//*[text()="Submit Paper Base Loan App"]

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Credit Card
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Speedy Cash
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Speedy Loan
        
        Wait Until Element Is Not Visible   locator=//*[text()="Please wait"]
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Click Element   locator=//*[text()="Apply"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    locator=//*[text()="Thai"]
        Click Element    locator=//*[text()="Thai"]

#       #### ใส่ข้อมูลต่างๆ ###

        Input Text    locator=//*[@name="IdcardNumber"]    text=${National ID Card Number}        ### ใส่เลขบัตร ###
        Input Names To PPB TH    ${thaiFirstName}    ${thaiLastName}    ### ชื่อ TH ###
        Input Text    //*[@name="LaserID"]    ${Laser ID}             ### Laser ID ###
    
        ### Date of Birth ###

        Click Element    locator=(//*[@src="assets/images/vector/calendar.png"])[1]
        Click Element    locator=//*[@class="MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1"]
        Click Element    locator=//*[@role="button" and text()="1983"]
        Click Element    locator=//*[text()="5"]
        Click Element    locator=//*[text()="OK"]

        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        #Scroll Element Into View    locator=//*[text()="Next"]
        
        ### Issue Date ###
        Click Element    locator=(//*[@src="assets/images/vector/calendar.png"])[2]
        Click Element    locator=//*[@class="MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1"]
        Click Element    locator=//*[@role="button" and text()="2020"]
        Click Element    locator=//*[text()="25"]
        Click Element    locator=//*[text()="OK"]
        

        ### Expiry Date ###
        Click Element    locator=(//*[@src="assets/images/vector/calendar.png"])[3]
        Click Element    locator=//*[@class="MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1"]
        Click Element    locator=//*[@role="button" and text()="2040"]
        Click Element    locator=//*[text()="5"]
        Click Element    locator=//*[text()="OK"]
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Click Element    locator=//*[text()="Next"]

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    3s
        #Wait Until Element Is Visible    //*[@name="mobileNo"]
        #Input Text    //*[@name="mobileNo"]    ${mobileNo}
        #Wait Until Element Is Visible    locator=//*[text()="Confirm"]
        #Click Element    locator=//*[text()="Confirm"]
		Run Keyword If    '${SELECTED_TYPE}' == '${ETB}'    
		...    Run Keywords
        ...    Wait Until Element Is Visible    //*[@name="mobileNo"]
		...    AND    Input Text    //*[@name="mobileNo"]    ${mobileNo}
		...    AND    Wait Until Element Is Visible    locator=//*[text()="Confirm"]
        ...    AND    Click Element    locator=//*[text()="Confirm"]

        Run Keyword If    '${SELECTED_TYPE}' == '${NTU}'    
        ...    Run Keywords
        ...    Wait Until Element Is Visible    locator=//*[text()="Confirm"]
        ...    AND    Click Element    locator=//*[text()="Confirm"]
        

        #Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        #Wait Until Element Is Visible    //*[text()="Accept"]
        #Wait Until Element Is Enabled    //*[text()="Accept"]
        #Sleep    2s
        #Click Element    //*[text()="Accept"]

        #Run Keyword If    '${SELECTED_TYPE}' == '${ETB}'
        #...    Run Keywords
        #...    Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        #...    AND    Wait Until Element Is Visible    //*[text()="Accept"]
        #...    AND    Wait Until Element Is Enabled    //*[text()="Accept"]
        #...    AND    Sleep    2s
        #...    AND    Click Element    //*[text()="Accept"]



        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'    IncomeCC


        Wait Until Element Is Visible    locator=//*[@id="income"]
        Input Text    locator=//*[@id="income"]    text=${income}
        Click Element    locator=//*[text()="Calculate"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);

#       ###กำหนด Credit line ###
        #Input Text    locator=//*[@placeholder="Input Credit Limit"]    text=${income}


        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Drag And Drop By Offset    //*[@class="MuiSlider-root jss434 MuiSlider-colorPrimary"]    50    0
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    4s
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Click Element    //*[text()="${installment period}"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    2s


        Click Element    locator=//*[text()="Next"]
        Click Element    locator=//*[text()="Confirm"]

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    locator=//*[@name="passportNumber"]
        Input Text    locator=//*[@name="passportNumber"]    text=${National ID Card Number}        ### ใส่เลขบัตร ###
        Input Text    locator=//*[@name="ReferralCode1"]    text=${Sales Referral Code 1}
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Click Element    locator=//*[text()="Next"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    1s
        Click Element    locator=//*[text()="Next"]

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]    timeout=60s
        Sleep    2s
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Wait Until Element Is Visible    locator=//*[text()="Back to home page"]

        Wait Until Element Is Visible   locator=//span[contains(text(), 'DP')]
           ${Get_Ref} =   Get Text   locator=//span[contains(text(), 'DP')]
            Log    ${Get_Ref}
            Log To Console   ${Get_Ref}
        Close Browser
        

        ### Document Upload ###
        Open and login    Username=${Username_uat}   Password=${Password_uat}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
            Input Text    //*[@type="search" and @placeholder="Search..."]   ${Get_Ref} 

            ${status}=    Run Keyword And Return Status    Wait Until Keyword Succeeds    3s    1s    Element Should Be Visible    //span[contains(text(), 'Show more results for')]
            Run Keyword If    ${status}    Reload app no.            

            Wait Until Element Is Visible    //mark[@class="data-match" and text()="${Get_Ref}"]
            Click Element    //mark[@class="data-match" and text()="${Get_Ref}"]

            Sleep    7s
            Execute Javascript    document.evaluate('//*[@title="Document Upload"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
            Sleep    5s
                Switch Window    NEW

            Wait Until Element Is Not Visible    //*[text()="Please wait"]
            Wait Until Element Is Visible    locator=(//*[@class="MuiSvgIcon-root"])[1]
            Click Element    locator=(//*[@class="MuiSvgIcon-root"])[1]
            Wait Until Element Is Visible    locator=(//*[text()="Upload"])[1]
            Click Element    locator=(//*[text()="Upload"])[1]
            Wait Until Element Is Visible    locator=//*[text()="Add photo"]

            Choose File    id=selectImage    file_path=D:\\automate\\Setup\\test.jpg

            Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
            Wait Until Element Is Visible    locator=//*[text()="Done"]
            Click Element    locator=//*[text()="Done"]

            Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
            Wait Until Element Is Visible    locator=//*[text()="Submit document"]
            Click Element    locator=//*[text()="Submit document"]
            Sleep    3s
            Wait Until Element Is Visible    locator=//*[text()="Confirm"]
            Sleep    3s
            Click Element    locator=//*[text()="Confirm"]
            Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]

            Switch Window    MAIN

				FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
                        Click Element    //button[@title='Actions for ${Get_Ref} | Loan Application']
						Wait Until Element Is Visible    ${REFRESH_XPATH}
						Click Element    ${REFRESH_XPATH}
						${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-DataMaker}
						Exit For Loop If    ${isFound}
						Sleep    5s
				END

            Close Browser


#### Data Entry Maker AuthLevel30

            Open and login    Username=${Username_uat}   Password=${Password_uat}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
            Input Text    //*[@type="search" and @placeholder="Search..."]   ${Get_Ref}
            Wait Until Element Is Visible    //mark[@class="data-match" and text()="${Get_Ref}"]
            Click Element    //mark[@class="data-match" and text()="${Get_Ref}"]
            Sleep    4s
        Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        
        Select Frame     css=iframe.insext-popup
        Wait Until Element Is Visible    //li[@data-aspect='users']
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Data Entry Maker AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Data Entry Maker AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Data Entry Maker AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

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
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Sleep    4s

        Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Maker AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Maker AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
		
		
        Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        Wait Until Element Is Visible    locator=//*[@title="Fill in application"]
        Sleep    7s
        Execute Javascript    document.evaluate('//*[@title="Fill in application"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
        Sleep    5s

        ##### Personal information #####
        Switch Window    NEW
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    locator=//*[@placeholder="Select title"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
            Random Title and Gender
            #Manaul Title and Gender
        
        Execute Javascript    window.scrollBy(0, window.innerHeight * 0.5);

        Press Keys    //*[@name="firstNameEn"]   CTRL+a+DELETE
        Input Text    //*[@name="firstNameEn"]    alonggorn
        Press Keys    //*[@name="lastNameEn"]    CTRL+a+DELETE
        Input Text    //*[@name="lastNameEn"]     deejung

        ### Education Level ###
        Click Element    locator=//*[@placeholder="Select education level"]
            Input Text    locator=(//*[@placeholder="Select education level"])[2]    text=BACHELOR'S DEGREE
            Click Element    locator=//*[text()="BACHELOR'S DEGREE"]
        
        ### Marital status ###

        Click Element    locator=//*[@placeholder="Select marital status"]
            Input Text    locator=(//*[@placeholder="Select marital status"])[2]    text=SINGLE
            Click Element    locator=//*[text()="SINGLE"]
 
        Run Keyword If    '${SELECTED_TYPE}' == '${NTU}'    Input Text    //*[@placeholder="Input mobile number"]    ${mobileNo}
        #Input Text    locator=//*[@placeholder="Input mobile number"]    text=900014537
        Press Keys    //input[@name="emailAddressForStatement"]    CTRL+a+DELETE
        Input Text    locator=//*[@inputmode="email"]    text=Testdata01_spc0363@gmail.com


        ### Address in the national ID card ###

        Click Element    locator=//*[@placeholder="Input address"]
            Wait Until Element Is Visible    locator=//*[text()="Building address"]
            Click Element    locator=//*[text()="Building address"]

            ${random_number}=    Generate Random House Number
            ${random_number2}=   Generate Random House Number 2
            Input Text    //*[@id="addressNumber"]    ${random_number}/${random_number2}
            
            ${building} =   Random Building Name      #สุ่มชื่ออาคาร#
            Log   ${building}
            Input Text    locator=//*[@id="building"]    text=${building}

            ${random_moo} =    Generate Random String    1    123456789          #สุ่มเลชหมู่บ้าน#
            Log    ${random_moo}
            Input Text    locator=//*[@id="moo"]    text=${random_moo}

            Click Element    locator=//*[@placeholder="Input sub-district, district, province, postal code"]
            Wait Until Element Is Visible    locator=//*[text()="BANGKOK"]
            Click Element    locator=//*[text()="BANGKOK"]
            Input Text       locator=//*[@placeholder="Search"]    text=DUSIT
            Wait Until Element Is Visible    locator=//*[text()="DUSIT"]
            Click Element    locator=//*[text()="DUSIT"]
            Wait Until Element Is Visible    locator=//*[text()="DUSIT"]
            Click Element    locator=//*[text()="DUSIT"]
            Wait Until Element Is Visible    locator=//*[text()="10300"]
            Click Element    locator=//*[text()="10300"]
            Click Element    locator=(//*[@class="MuiButton-label"])[2]            #กด Save #

        #Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Execute Javascript    window.scrollBy(0, window.innerHeight * 0.8);
        
        
        Click Element    locator=//*[text()="Use address as specified in National ID Card"]
        Click Element    locator=//*[text()="National ID Card"]      ##เลือก Use address in the national ID card
        Sleep    3s
        
        #Click Element    (//*[@class="MuiIconButton-label"])[7]
        Click Element    locator=//*[text()="Next"]               ##คลิก Next to "Occupational Information"
    

        #### Occupational Information ####

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    locator=//*[text()="Salaried employee"]
        Wait Until Element Is Enabled    locator=//*[text()="Salaried employee"]
        Sleep    4s
        Click Element    locator=//*[text()="Salaried employee"]

        Execute Javascript    window.scrollBy(0, window.innerHeight * 0.5);
        Click Element    locator=//*[@placeholder="Select occupation"]
        Input Text    locator=//*[@placeholder="Search"]    text=Doctor
        Wait Until Element Is Visible    locator=//*[text()="Doctor"]
        Click Element    locator=//*[text()="Doctor"]
        
        Press Keys    //*[@placeholder="Input company name"]    CTRL+a+DELETE
        Input Text    locator=//*[@placeholder="Input company name"]    text=TEST01

        Click Element    locator=//*[@placeholder="Select year(s) and month(s)"]
        Click Plus Button 4 Times    locator=//*[@data-testid="plus_year"]
        Sleep    3s
        Click Element    locator=//*[text()="OK"]

        ${random_mobileno} =    Generate Random String    7    1234567890
        Press Keys    //*[@name="mobileNo"]    CTRL+a+DELETE
        Input Text    locator=//*[@name="mobileNo"]    text=2${random_mobileno}


        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);

        ###  Work Address ###

        Click Element    locator=//*[@placeholder="Input work address"]
        Click Element    locator=//*[text()="Building address"]

        ${random_1}=    Generate Random House Number
        ${random_2}=   Generate Random House Number 2        
        Input Text    //*[@name="addressNumber"]    ${random_1}/${random_2}

        ${building_a} =   Random Building Name      #สุ่มชื่ออาคาร#
        Log   ${building_a}
        Input Text    locator=//*[@placeholder="Input building"]    text=${building_a}

        ${random_moo_2} =    Generate Random String    1    123456789          #สุ่มเลชหมู่บ้าน#
        Log    ${random_moo_2}
        Input Text    locator=//*[@name="moo"]    text=${random_moo_2}

        Click Element    locator=//*[@placeholder="Input sub-district, district, province, postal code"]
        Wait Until Element Is Visible    locator=//*[text()="BANGKOK"]
        Click Element    locator=//*[text()="BANGKOK"]
        Input Text       locator=//*[@placeholder="Search"]    text=DUSIT
        Wait Until Element Is Visible    locator=//*[text()="DUSIT"]
        Click Element    locator=//*[text()="DUSIT"]
        Wait Until Element Is Visible    locator=//*[text()="SI YAEK MAHANAK"]
        Click Element    locator=//*[text()="SI YAEK MAHANAK"]
        Wait Until Element Is Visible    locator=//*[text()="10300"]
        Click Element    locator=//*[text()="10300"]
        Scroll Element Into View    (//*[@class="MuiButton-label"])[3]
        Click Element    locator=(//*[@class="MuiButton-label"])[3]       #กด Save #      
        Wait Until Element Is Visible    locator=//*[text()='Next']
        Click Element    locator=//*[text()='Next']
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    3s


        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Add detail spc
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Add detail spl

        ###Repayment option ###

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Wait Until Element Is Visible    locator=//*[text()="Cash"]
        Click Element    locator=//*[text()="Cash"]
        Click Element    locator=//span[@class='MuiButton-label']/div[text()='Continue']

        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    2s

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'
        ...    Run Keywords
        ...    Wait Until Element Is Visible    //*[text()="SCB Account"]
        ...    AND    Click Element    //*[text()="SCB Account"]

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Select add account number or not

        ###Apply Credit card ###
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    2s
        Scroll Element Into View    locator=//*[text()="Accept all"]
        Click Element    locator=//*[text()="Accept all"]

        Scroll Element Into View    locator=//span[@class="MuiButton-label"]/div[text()='Next']
        Click Element    locator=//span[@class="MuiButton-label"]/div[text()='Next']

        ### Referral code ###
        
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    3s
        Wait Until Element Is Visible    locator=//span[@class='MuiButton-label']/div[text()='Continue']
        Click Element    locator=//span[@class='MuiButton-label']/div[text()='Continue']
        
        
       ### Review Information ###

       Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
       Sleep    3s
       Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
       Wait Until Element Is Visible    locator=//span[@class="MuiButton-label"]/div[text()="Confirm application"]
       Click Element    locator=//span[@class="MuiButton-label"]/div[text()="Confirm application"]
       Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
       Sleep    2s

       Switch Window    MAIN
       Sleep    2s
       Close Browser

#### Data Entry Checker AuthLevel30

        Open and login    Username=${Username_uat}   Password=${Password_uat}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
            Input Text    //*[@type="search" and @placeholder="Search..."]   ${Get_Ref}
            Wait Until Element Is Visible    //mark[@class="data-match" and text()="${Get_Ref}"]
            Click Element    //mark[@class="data-match" and text()="${Get_Ref}"]
            Sleep    4s
        Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        
        Select Frame     css=iframe.insext-popup
        Wait Until Element Is Visible    //li[@data-aspect='users']
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Data Entry Checker AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Data Entry Checker AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Data Entry Checker AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

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
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Sleep    4s

        ${element}=    Execute JavaScript    return document.evaluate('//*[@class="slds-button__icon slds-button__icon_hint"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Checker AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Checker AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
		
		
        Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        Wait Until Element Is Visible    locator=//*[@title="Verify Application"]
        Sleep    7s
        Execute Javascript    document.evaluate('//*[@title="Verify Application"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
        Sleep    5s

        Switch Window    NEW
        

		FOR    ${index}    IN RANGE    2
            Wait Until Element Is Visible    //*[text()="Please wait"]
			Wait Until Element Is Not Visible    //*[text()="Please wait"]
		END
        Sleep    5s


        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Wait Until Element Is Visible    //span[@class="MuiButton-label"]/div[text()="Confirm application"]
        Click Element    locator=//span[@class="MuiButton-label"]/div[text()="Confirm application"]
        Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
        Sleep    4s
        
        Wait Until Page Contains    Successfully submitted


        Switch Window    MAIN

		FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
                      Click Element    //button[@title='Actions for ${Get_Ref} | Loan Application']
				Wait Until Element Is Visible    ${REFRESH_XPATH}
				Click Element    ${REFRESH_XPATH}
				${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-IncomeMaker}
				Exit For Loop If    ${isFound}
				Sleep    5s
		END

        Close Browser



#### Income Maker AuthLevel30

        Open and login    Username=${Username_uat}   Password=${Password_uat}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
            Input Text    //*[@type="search" and @placeholder="Search..."]   ${Get_Ref}
            Wait Until Element Is Visible    //mark[@class="data-match" and text()="${Get_Ref}"]
            Click Element    //mark[@class="data-match" and text()="${Get_Ref}"]
            Sleep    4s
        Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        
        Select Frame     css=iframe.insext-popup
        Wait Until Element Is Visible    //li[@data-aspect='users']
        Click Element    //li[@data-aspect='users']
        Click Element    //*[@class="all-data-input"]
        Input Text       //*[@class="all-data-input"]    Income Maker AuthLevel30
        Wait Until Element Is Visible    locator=//mark[contains(text(), 'Income Maker AuthLevel30')]
        Click Element    locator=//mark[contains(text(), 'Income Maker AuthLevel30')]
        Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

        ####  ตรวจสอบภาษา ###
        ${element1}=    Execute JavaScript    return document.evaluate('//*[@type="button" and @title="Show Navigation Menu"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		Should Not Be Equal    ${element1}    None    msg=Element not found.
		${EN}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="Show Navigation Menu"]    5s
		${TH}=    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@type="button" and @title="แสดงเมนูการนำทาง"]    5s
        Log    ${EN}
        Log    ${TH}
		Wait Until Keyword Succeeds    3x    10s    Log    Waiting for elements...    # รอจนกว่าหนึ่งในสอง text จะปรากฎ ด้วยการลอง 3 ครั้ง แต่ละครั้งระยะห่าง 10 วินาที
	    
		Run Keyword If    ${TH}    
        ...    Run Keywords
        ...    Check For Elements language    
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Sleep    4s

        Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Maker AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Maker AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
        Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        Sleep    7s


        Wait Until Element Is Visible    //*[text()="Customer Details"]
        Scroll Element With Offset Until Visible    (//*[@class="slds-text-body_regular1 slds-text-align_left"])[3]    0   500    5
        Sleep    6s
        ${elementXpath}=    Set Variable    (//button[@role='combobox'][@aria-label=' '])[2]
        Wait Until Element Is Visible    ${elementXpath}
        Execute Javascript    document.evaluate('(//button[@role='combobox'][@aria-label=' '])[2]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.focus()
        Click Element    ${elementXpath}
        Wait Until Element Is Visible    xpath://span[@title='รองผู้จัดการใหญ่']
        Click Element    xpath://span[@title='รองผู้จัดการใหญ่']
        
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Account Transfer Details
        Sleep    2s
        Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0   600    5

        Click Element   locator=//*[@class="slds-button slds-button_brand" and text()="Save"]

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Debt Info and Financial Info for CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'     Debt Info and Financial Info for CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'    Debt Info and Financial Info for SPL 



### Income Checker AuthLevel30

        Open and login    Username=${Username_uat}   Password=${Password_uat}
        Wait Until Element Is Visible    //*[@aria-label="Search"]
        Sleep    6s
        Click Element    //*[@aria-label="Search"]
        Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
        Input Text    //*[@type="search" and @placeholder="Search..."]   ${Get_Ref}
        Wait Until Element Is Visible    //mark[@class="data-match" and text()="${Get_Ref}"]
        Click Element    //mark[@class="data-match" and text()="${Get_Ref}"]
        Sleep    5s

		FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
			Click Element    //button[@title='Actions for ${Get_Ref} | Loan Application']
			Wait Until Element Is Visible    ${REFRESH_XPATH}
			Click Element    ${REFRESH_XPATH}
		
			${isWebVerificationPending}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-WebVerrification}
			${isIncomeCheckerPending}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-IncomeChecker}
		
			# หากพบสถานะ Pending-WebVerrification ลูปจะหยุดทันทีและดำเนินการต่อ
			Exit For Loop If    ${isWebVerificationPending}
			# หากพบสถานะ Pending-IncomeChecker ลูปจะหยุดและรัน keyword สำหรับการตรวจสอบรายได้
			Run Keyword If    ${isIncomeCheckerPending}    Income Checker AuthLevel30
			Exit For Loop If    ${isIncomeCheckerPending}
		
			Sleep    5s
		END
            
        Close Browser


        # Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        
        # Select Frame     css=iframe.insext-popup
        # Wait Until Element Is Visible    //li[@data-aspect='users']
        # Click Element    //li[@data-aspect='users']
        # Click Element    //*[@class="all-data-input"]
        # Input Text       //*[@class="all-data-input"]    Income Checker AuthLevel30
        # Wait Until Element Is Visible    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
        # Click Element    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
        # Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
        # Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

        # Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        # Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        # Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
        # Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
        # Wait Until Element Is Visible    locator=//*[@value="change owner"]
        # Click Element    locator=//*[@value="change owner"]
		
		
        # Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        # Sleep    7s


        # Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0   300    5
        # Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
        # Click Element   locator=//*[@class="slds-button slds-button_brand" and text()="Save"]

        # ###Debt Info
        #      Sleep    10s
        # Click Element    //*[@id="Debt Info__item" and text()="Debt Info"]
        # Wait Until Element Is Visible    //*[@id="Debt Info__item" and text()="Debt Info"]
        #      Sleep    4s
        # Scroll Element With Offset Until Visible   //*[@class="slds-button slds-button_brand" and text()="Save"]    0   700    5
        # #Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
        
        # Wait Until Element Is Visible   (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
        # Click Element    (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
        # Sleep    3s
        # Execute Javascript    window.scrollTo(0, 0);

        # ####Financial Info
        # Wait Until Element Is Visible    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
        # Click Element    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
        # Wait Until Element Is Visible    //*[@name="SALARY" and text()="เงินเดือน"]


        # Scroll Element With Offset Until Visible    //*[@class="slds-form-element__label" and text()="Match "]    0   1000    5
        # Wait Until Element Is Visible    //*[@value="Save" and text()="Save"]
        # Click Element    //*[@value="Save" and text()="Save"]
        # Sleep    6s
        # Click Element    //*[@value="Submit" and text()="Submit"]
        # Wait Until Element Is Visible    //button[@title='Actions for ${Get_Ref} | Loan Application']
        # Wait Until Element Is Visible    //a[@class="slds-tabs_default__link" and text()="Details"]
        # Sleep    10s

		# FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
		# 		Click Element    //button[@title='Actions for ${Get_Ref} | Loan Application']
		# 		Wait Until Element Is Visible    ${REFRESH_XPATH}
		# 		Click Element    ${REFRESH_XPATH}
		# 		${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-WebVerrification}
		# 		Exit For Loop If    ${isFound}
		# 		Sleep    5s
		# END

        # Close Browser


#### Call Ver AuthLevel30
        Open and login    Username=${Username_uat}   Password=${Password_uat}
        Wait Until Element Is Visible    //*[@aria-label="Search"]
        Sleep    6s
        Click Element    //*[@aria-label="Search"]
        Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
        Input Text    //*[@type="search" and @placeholder="Search..."]   ${Get_Ref}
        Wait Until Element Is Visible    //mark[@class="data-match" and text()="${Get_Ref}"]
        Click Element    //mark[@class="data-match" and text()="${Get_Ref}"]
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
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Sleep    4s
	    
		Run Keyword If    ${TH}    
        ...    Run Keywords
        ...    Check For Elements language    
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Get_Ref} | Loan Application'])[1]    
        ...    AND    Sleep    4s
		
        Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Call Ver AuthLevel30"]
        Wait Until Element Is Visible    locator=//*[@value="change owner"]
        Click Element    locator=//*[@value="change owner"]
		
		
        Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
        Sleep    10s

        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'    Call ver CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Call ver CC,SPC
        Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPL}'   Call ver SPL 


        Wait Until Element Is Visible    //button[@title='Actions for ${Get_Ref} | Loan Application']
        
			FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
						Click Element    //button[@title='Actions for ${Get_Ref} | Loan Application']
					Wait Until Element Is Visible    ${REFRESH_XPATH}
					Click Element    ${REFRESH_XPATH}
					${isFound}=    Run Keyword And Return Status    Element Should Be Visible    Resolved-Completed
					Exit For Loop If    ${isFound}
					Sleep    5s
			END       

            Run Keyword If    NOT ${isFound}    Fail    The word Resolved-Completed is not displayed.