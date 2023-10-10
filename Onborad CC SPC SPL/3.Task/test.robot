*** Settings ***
Library    SeleniumLibrary




*** Keywords ***
Open Headless Firefox Browser
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${firefox_options}    add_argument    --headless
    Create Webdriver    Firefox    options=${firefox_options}

Get Names From Website A With Firefox
    Open Headless Firefox Browser
    Go To    https://kidhaina.com/thainamegenerator.html
    Wait Until Page Contains Element    //*[@class="first-name-th"]
    ${thaiFirstName}=      Get Text     //*[@class="first-name-th"]
    ${thaiLastName}=       Get Text     //*[@class="last-name-th"]
    ${englishFirstName}=   Get Text     //*[@class="first-name-en"]
    ${englishLastName}=    Get Text     (//*[@class="last-name-th"])[2]
    Close Browser  
    [Return]    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName} 

*** Tasks ***

test
    ${thaiFirstName}    ${thaiLastName}    ${englishFirstName}    ${englishLastName}=     Get Names From Website A With Firefox