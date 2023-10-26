*** Settings ***
Resource    ..//1.Setting/Setting.robot




*** Keywords ***

Check For Elements language
    Sleep    6s
    Execute Javascript    document.querySelector('.icon.noicon').click()

    Wait Until Element Is Visible    //*[@class="profile-link-label" and text()="การตั้งค่า"]
    Click Element    //*[@class="profile-link-label" and text()="การตั้งค่า"]
    Wait Until Element Is Visible    //*[@title="ภาษาและเขตเวลา"]
    Click Element    //*[@title="ภาษาและเขตเวลา"]
    Sleep    2s
    Wait Until Element Is Visible    //iframe[@title="ภาษาและเขตเวลา ~ Salesforce - Unlimited Edition"]
    Select Frame    //iframe[@title="ภาษาและเขตเวลา ~ Salesforce - Unlimited Edition"]
    Wait Until Element Is Visible    //*[@id="LanguageAndTimeZoneSetup:editPage:editPageBlock:languageLocaleKey"]
    Select From List By Label    id=LanguageAndTimeZoneSetup:editPage:editPageBlock:languageLocaleKey    English
    Click Element    //*[@title="บันทึก"]
    Sleep    7s
    
	${element1} =    Execute Javascript    return document.evaluate("(//span[@class='title slds-truncate' and text()='${Ref no_manaul} | Loan Application'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;

Check For Elements language_1
    Sleep    6s
    Execute Javascript    document.querySelector('.icon.noicon').click()

    Wait Until Element Is Visible    //*[@class="profile-link-label" and text()="การตั้งค่า"]
    Click Element    //*[@class="profile-link-label" and text()="การตั้งค่า"]
    Wait Until Element Is Visible    //*[@title="ภาษาและเขตเวลา"]
    Click Element    //*[@title="ภาษาและเขตเวลา"]
    Sleep    2s
    Wait Until Element Is Visible    //iframe[@title="ภาษาและเขตเวลา ~ Salesforce - Unlimited Edition"]
    Select Frame    //iframe[@title="ภาษาและเขตเวลา ~ Salesforce - Unlimited Edition"]
    Wait Until Element Is Visible    //*[@id="LanguageAndTimeZoneSetup:editPage:editPageBlock:languageLocaleKey"]
    Select From List By Label    id=LanguageAndTimeZoneSetup:editPage:editPageBlock:languageLocaleKey    English
    Click Element    //*[@title="บันทึก"]
    Sleep    7s