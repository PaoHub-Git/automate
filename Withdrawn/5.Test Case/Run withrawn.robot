*** Settings ***
Resource    ..//1.Setting/Setting.robot

*** Variables ***

${Sub_State__c}    FinalUpdate(BRE005):WAIVED,GenerateRequiredDoc:WAIVED,Withdrawn:COMPLETED
${ State__c}       Withdrawn
${Reject_Reason__c}    S01
${Next_Workstation__c}    Dummy System Workstation
${Previous_WorkStation__c}    Dummy System Workstation
${Loan_Application_Status__c}    Resolved-Withdrawn

${Ref no}    	DP2023102700003





*** Tasks ***


Rnu Withdrawn

            Open Google with Profile 1   ${Username_uat}    ${Password_uat}
            Wait Until Element Is Visible    //*[@aria-label="Search"]
            Sleep    6s
            Click Element    //*[@aria-label="Search"]
            Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
            Input Text    //*[@type="search" and @placeholder="Search..."]   ${Ref no}
            Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no}')]
            Click Element    //span/mark[contains(text(), '${Ref no}')]
            Sleep    4s
            Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
            Wait Until Element Is Visible    css=iframe.insext-popup
            Select Frame     css=iframe.insext-popup
            Wait Until Element Is Visible    //*[@class="button"]/span  #รอจนกว่าปุ่ม Show all data ปรากฎ
            Click Element    //*[@class="button"]/span         #คลิกปุ่ม Show all data
            
            Sub_State__c

            Reject_Reason__c

            Next_Workstation__c

            Previous_WorkStation__c

            Loan_Application_Status__c


            Close Browser


*** Keywords ***

Sub_State__c



            ${element}=    Execute JavaScript    return document.querySelector('input.filter-input');
            # Should Not Be Equal    ${element}    None    msg=Element not found.
            
            #Wait Until Element Is Visible    locator=//*[@placeholder="Filter"]
            Input Text    //*[@placeholder="Filter"]    text=Sub_State__c
            Wait Until Element Is Visible    (//*[contains(@title, "Sub_State__c")]//td[@class="field-column"])[2]
            Double Click Element    (//*[contains(@title, "Sub_State__c")]//td[@class="field-column"])[2]
            Input Text    //td[@class="field-column"]/textarea    ${Sub_State__c}
            Click Element    locator=//*[@class="button button-brand"]
            Capture Page Screenshot

            Click Element    locator=//*[@class="filter-clear-icon"]                  #ลบข้อความ Sub_State__c ใน Filter



Reject_Reason__c
            Wait Until Element Is Visible    //*[@placeholder="Filter"]
            Input Text    //*[@placeholder="Filter"]    text=Reject_Reason__c
            Wait Until Element Is Visible    (//*[contains(@title, "Reject_Reason__c")]//td[@class="field-column"])[2] 
            Sleep    2s
            Double Click Element    (//*[contains(@title, "Reject_Reason__c")]//td[@class="field-column"])[2]
            #Double Click Element    (//*[contains(@title, "Reject_Reason__c")]//td[@class="field-column"])[2]
            Input Text    //td[@class="field-column"]/textarea    ${Reject_Reason__c}
            Click Element    locator=//*[@class="button button-brand"]


            Click Element    locator=//*[@class="filter-clear-icon"]                  #ลบข้อความ Sub_State__c ใน Filter    




Next_Workstation__c
            Wait Until Element Is Visible    //*[@placeholder="Filter"]
            Input Text    //*[@placeholder="Filter"]    text=Next_Workstation__c
            Wait Until Element Is Visible    (//*[contains(@title, "Next_Workstation__c")]//td[@class="field-column"])[2]
            Sleep    3s
            Double Click Element    (//*[contains(@title, "Next_Workstation__c")]//td[@class="field-column"])[2]
            Wait Until Element Is Visible    //td[@class="field-column"]/textarea
            Input Text    //td[@class="field-column"]/textarea    ${Next_Workstation__c}
            Click Element    locator=//*[@class="button button-brand"]

            Click Element    locator=//*[@class="filter-clear-icon"]                  #ลบข้อความ Sub_State__c ใน Filter 


Previous_WorkStation__c
            Wait Until Element Is Visible    //*[@placeholder="Filter"]
            Input Text    //*[@placeholder="Filter"]    text=Previous_WorkStation__c
            Wait Until Element Is Visible    //*[contains(@title, "Previous_WorkStation__c")]//td[@class="field-column"]
            Sleep    2s
            Double Click Element    //*[contains(@title, "Previous_WorkStation__c")]//td[@class="field-column"]
            #Double Click Element    (//*[contains(@title, "Reject_Reason__c")]//td[@class="field-column"])[2]
            Input Text    //td[@class="field-column"]/textarea    ${Previous_WorkStation__c}
            Click Element    locator=//*[@class="button button-brand"]


            Click Element    locator=//*[@class="filter-clear-icon"]                  #ลบข้อความ Sub_State__c ใน Filter    

            
Loan_Application_Status__c
            Wait Until Element Is Visible    //*[@placeholder="Filter"]
            Input Text    //*[@placeholder="Filter"]    text=Loan_Application_Status__c
            Wait Until Element Is Visible    (//*[contains(@title, "Loan_Application_Status__c")]//td[@class="field-column"])[2]
            Sleep    3s
            Double Click Element    (//*[contains(@title, "Loan_Application_Status__c")]//td[@class="field-column"])[2]
            Input Text    //td[@class="field-column"]/textarea    ${Loan_Application_Status__c}
            Click Element    locator=//*[@class="button button-brand"]


            Click Element   locator=//*[@class="sf-link" and text()=" Salesforce Home"]
            Wait Until Element Is Visible    //*[text()="Resolved-Withdrawn"]