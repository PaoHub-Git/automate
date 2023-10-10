*** Settings ***

Resource    ..//1.Setting/Setting.robot




*** Tasks ***


Open and login SF

    #Open and login    Username=${Username_uat}   Password=${Password_uat}
    # Open and login    ${Username_uat}   ${Password_uat}
    #         Wait Until Element Is Visible    //*[@aria-label="Search"]
    #         Sleep    6s
    #         Click Element    //*[@aria-label="Search"]
    #         Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
    #         Input Text    //*[@type="search" and @placeholder="Search..."]   ${Ref no_manaul}
    #         Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_manaul}')]
    #         Click Element    //span/mark[contains(text(), '${Ref no_manaul}')]
    #         Sleep    4s

	# 		FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
	# 					Click Element    //button[@title='Actions for ${Ref no_manaul} | Loan Application']
	# 				Wait Until Element Is Visible    ${REFRESH_XPATH}
	# 				Click Element    ${REFRESH_XPATH}
	# 				${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-IncomeChecker}
	# 				Exit For Loop If    ${isFound}
	# 				Sleep    5s
	# 		END


    #     Execute Javascript  document.evaluate("${NEXT_BUTTON}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
        
    #     Select Frame     css=iframe.insext-popup
    #     Wait Until Element Is Visible    //li[@data-aspect='users']
    #     Click Element    //li[@data-aspect='users']
    #     Click Element    //*[@class="all-data-input"]
    #     Input Text       //*[@class="all-data-input"]    Income Checker AuthLevel30
    #     Wait Until Element Is Visible    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
    #     Click Element    locator=//mark[contains(text(), 'Income Checker AuthLevel30')]
    #     Wait Until Element Is Visible   locator=//*[@class="button button-secondary" and text()="Try login as"]
    #     Click Element   locator=//*[@class="button button-secondary" and text()="Try login as"]

    #     #Wait Until Element Is Visible    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
	# 	#
    #     #Click Element    locator=//*[@class="slds-button__icon slds-button__icon_hint"]
    #     #Wait Until Element Is Visible    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
    #     #Click Element    locator=//*[@class="primaryLabel slds-truncate slds-lookup__result-text" and text()="Income Checker AuthLevel30"]
    #     #Wait Until Element Is Visible    locator=//*[@value="change owner"]
    #     #Click Element    locator=//*[@value="change owner"]
	# 	#
	# 	#
    #     #Wait Until Element Is Not Visible    locator=//*[@value="change owner"]
    #     Sleep    7s


    #     Scroll Element With Offset Until Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]    0   500    5
    #     Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
    #     Click Element   locator=//*[@class="slds-button slds-button_brand" and text()="Save"]

    #     ###Debt Info
    #          Sleep    10s
    #     Click Element    //*[@id="Debt Info__item" and text()="Debt Info"]
    #     Wait Until Element Is Visible    //*[@id="Debt Info__item" and text()="Debt Info"]
    #          Sleep    4s
    #     Scroll Element With Offset Until Visible   //*[@class="slds-button slds-button_brand" and text()="Save"]    0   700    5
    #     #Wait Until Element Is Visible    //*[@class="slds-button slds-button_brand" and text()="Save"]
        
    #     Wait Until Element Is Visible   (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
    #     Click Element    (//*[@class="slds-button slds-button_brand" and text()="Save"])[2]
    #     Sleep    3s
    #     Execute Javascript    window.scrollTo(0, 0);

    #     ####Financial Info

    #     Click Element    //*[@class="slds-tabs_default__link" and text()="Financial Info"]
    #     Wait Until Element Is Visible    //*[@name="SALARY" and text()="เงินเดือน"]


    #     Scroll Element With Offset Until Visible    //*[@class="slds-form-element__label" and text()="Match "]    0   1000    5
    #     Wait Until Element Is Visible    //*[@value="Save" and text()="Save"]
    #     Click Element    //*[@value="Save" and text()="Save"]
    #     Sleep    6s
    #     Click Element    //*[@value="Submit" and text()="Submit"]

    #     Sleep    10s

	# 		FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
	# 					Click Element    //button[@title='Actions for ${Ref no_manaul} | Loan Application']
	# 				Wait Until Element Is Visible    ${REFRESH_XPATH}
	# 				Click Element    ${REFRESH_XPATH}
	# 				${isFound}=    Run Keyword And Return Status    Element Should Be Visible    ${Check status Pending-WebVerrification}
	# 				Exit For Loop If    ${isFound}
	# 				Sleep    5s
	# 		END

    #     Close Browser

### Income Checker AuthLevel30

        Open and login    Username=${Username_uat}   Password=${Password_uat}
        Wait Until Element Is Visible    //*[@aria-label="Search"]
        Sleep    6s
        Click Element    //*[@aria-label="Search"]
        Wait Until Element Is Visible    //*[@type="search" and @placeholder="Search..."]
        Input Text    //*[@type="search" and @placeholder="Search..."]   ${Ref no_manaul}
        Wait Until Element Is Visible    //span/mark[contains(text(), '${Ref no_manaul}')]
        Click Element    //span/mark[contains(text(), '${Ref no_manaul}')]
        Sleep    5s

		FOR    ${i}    IN RANGE    20    # 5 วินาที x 20 = 100 วินาที หรือ 1 นาที 40 วินาที
			Click Element    //button[@title='Actions for ${Ref no_manaul} | Loan Application']
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