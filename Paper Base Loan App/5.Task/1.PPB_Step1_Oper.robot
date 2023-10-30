*** Settings ***

Resource    ..//1.Setting/Setting.robot


*** Variables ***
#######################################################
${CARD_TYPE_CC}     CC
${CARD_TYPE_SPC}    SPC
${SELECTED_CARD}    CC  #เลือกประเภทบัตร
#######################################################


${National ID Card Number}    3109446600778
${First Name (TH)}
${Last Name (TH)}
${First Name (EN)}
${Last Name (EN)}
${Date of Birth}    01-01-1983
${Laser ID}    ME46395867

${income}    100000
${Credit limit}    250000
${Sales Referral Code 1}    N32099


*** Tasks ***

Open and login SF
#     ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName}=    Get Names From Website        ###สุ่มชื่อ TH EN
#     Open and login    Username=${Username_uat}   Password=${Password_uat}
#         Wait Until Element Is Visible    locator=//button[@type="button" and text()="Search"]
#         Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
#         Sleep    5s
        
#         Select Frame     css=iframe.insext-popup
#         Click Element    //li[@data-aspect='users']
#         Click Element    //*[@class="all-data-input"]
#         Input Text       //*[@class="all-data-input"]    Operations AuthLevel30
#         Wait Until Element Is Visible    locator=//mark[contains(text(), 'Operations AuthLevel30')]
#         Click Element    locator=//mark[contains(text(), 'Operations AuthLevel30')]
#         Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
#         Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]
        
#         Wait Until Element Is Visible    locator=//*[@type="button" and @title="Show Navigation Menu" ]
#         Click Element   locator=//*[@type="button" and @title="Show Navigation Menu" ]
#         Wait Until Element Is Visible    locator=//*[text()="Submit Paper Base Loan App"]
#         Click Element   locator=//*[text()="Submit Paper Base Loan App"]

#         Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_CC}'     Credit Card
#         Run Keyword If    '${SELECTED_CARD}' == '${CARD_TYPE_SPC}'    Speedy Cash
        
#         Wait Until Element Is Not Visible   locator=//*[text()="Please wait"]
#         Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
#         Click Element   locator=//*[text()="Apply"]
#         Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
#         Wait Until Element Is Visible    locator=//*[@class="jss223" and text()="Thai"]
#         Click Element    locator=//*[@class="jss223" and text()="Thai"]

# #       #### ใส่ข้อมูลต่างๆ ###

#         Input Text    locator=//*[@name="IdcardNumber"]    text=${National ID Card Number}        ### ใส่เลขบัตร ###
#         Input Names To PPB TH    ${thaiFirstName}    ${thaiLastName}    ### ชื่อ TH ###
#         Input Text    //*[@name="LaserID"]    ${Laser ID}             ### Laser ID ###
    
#         ### Date of Birth ###

#         Click Element    locator=(//*[@src="assets/images/vector/calendar.png"])[1]
#         Click Element    locator=//*[@class="MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1"]
#         Click Element    locator=//*[@role="button" and text()="1983"]
#         Click Element    locator=//*[text()="5"]
#         Click Element    locator=//*[text()="OK"]

#         Scroll Element Into View    locator=//*[text()="Next"]
        
#         ### Issue Date ###
#         Click Element    locator=(//*[@src="assets/images/vector/calendar.png"])[2]
#         Click Element    locator=//*[@class="MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1"]
#         Click Element    locator=//*[@role="button" and text()="2020"]
#         Click Element    locator=//*[text()="25"]
#         Click Element    locator=//*[text()="OK"]
        

#         ### Expiry Date ###
#         Click Element    locator=(//*[@src="assets/images/vector/calendar.png"])[3]
#         Click Element    locator=//*[@class="MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1"]
#         Click Element    locator=//*[@role="button" and text()="2040"]
#         Click Element    locator=//*[text()="5"]
#         Click Element    locator=//*[text()="OK"]
#         Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
#         Click Element    locator=//*[text()="Next"]
#         Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
#         Wait Until Element Is Visible    locator=//*[text()="Confirm"]
#         Click Element    locator=//*[text()="Confirm"]
#         Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
#         Wait Until Element Is Visible    locator=//*[@id="outlined-type-of-income-dropdown"]
#         Click Element    locator=//*[@id="outlined-type-of-income-dropdown"]

# #       ###เลือกประเภท Income###
#         Click Element    locator=//*[text()="Monthly Income"]
#         #Click Element    locator=//*[text()="Fixed Deposit"]
#         #Click Element    locator=//*[text()="Saving Deposit, Fixed Deposit and Fund Debenture"]

#         Input Text    locator=//*[@id="income"]    text=${income}
#         Click Element    locator=//*[text()="Calculate"]
#         Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
#         Execute Javascript    window.scrollTo(0, document.body.scrollHeight);

# #       ###กำหนด Credit line ###
#         #Input Text    locator=//*[@placeholder="Input Credit Limit"]    text=${income}

#         Click Element    locator=//*[text()="Next"]
#         Click Element    locator=//*[text()="Confirm"]

#         Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]
#         Wait Until Element Is Visible    locator=//*[@name="passportNumber"]
#         Input Text    locator=//*[@name="passportNumber"]    text=${National ID Card Number}        ### ใส่เลขบัตร ###
#         Input Text    locator=//*[@name="ReferralCode1"]    text=${Sales Referral Code 1}
#         Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
#         Click Element    locator=//*[text()="Next"]
#         Click Element    locator=//*[text()="Next"]

#         Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]    timeout=60s
#         Sleep    2s
#         Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
#         Wait Until Element Is Visible    locator=//*[text()="Back to home page"]

#         Wait Until Element Is Visible   locator=//span[contains(text(), 'DP')]
#            ${Get_Ref} =   Get Text   locator=//span[contains(text(), 'DP')]
#             Log    ${Get_Ref}
#             Log To Console   ${Get_Ref}
#         Close Browser
        
        ### Document Upload ###
        Open and login    Username=${Username_uat}   Password=${Password_uat}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
            Input Text    //*[@type="search" and @placeholder="Search..."]   ${Ref no_manaul}

            ${status}=    Run Keyword And Return Status    Wait Until Keyword Succeeds    3s    1s    Element Should Be Visible    //span[contains(text(), 'Show more results for')]
            Run Keyword If    ${status}    Reload app no.

            Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_manaul}')]
            Click Element    //span/mark[contains(text(), '${Ref no_manaul}')]
            Sleep    4s



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

            Choose File    id=selectImage    file_path=D:\\test.jpg

            Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
            Wait Until Element Is Visible    locator=//*[text()="Done"]
            Click Element    locator=//*[text()="Done"]

            Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
            Wait Until Element Is Visible    locator=//*[text()="Submit document"]
            Click Element    locator=//*[text()="Submit document"]
            Wait Until Element Is Visible    locator=//*[text()="Confirm"]
            Click Element    locator=//*[text()="Confirm"]
            Wait Until Element Is Not Visible    locator=//*[text()="Please wait"]

            Switch Window    MAIN

				FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
                        Click Element    //button[@title='Actions for ${Ref no_manaul} | Loan Application']
						Wait Until Element Is Visible    ${REFRESH_XPATH}
						Click Element    ${REFRESH_XPATH}
						${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-DataMaker}
						Exit For Loop If    ${isFound}
						Sleep    5s
				END

            Close Browser
            

            






        #Wait Until Element Is Visible    locator=//*[text()="Back to home pang"]

        
