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

#### Data Entry Maker AuthLevel30

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
        ...    AND    Wait Until Element Is Visible    (//span[@class='title slds-truncate' and text()='${Ref no_manaul} | Loan Application'])[1]    
        ...    AND    Click Element    (//span[@class='title slds-truncate' and text()='${Ref no_manaul} | Loan Application'])[1]    
        ...    AND    Sleep    4s

        # Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
		
        # Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
        # Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Maker AuthLevel30"]
        # Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Data Entry Maker AuthLevel30"]
        # Wait Until Element Is Visible    locator=//*[@value="change owner"]
        # Click Element    locator=//*[@value="change owner"]
		
		
        # Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
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
        
        
        #Click Element    locator=//*[text()="Use address as specified in National ID Card"]
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
