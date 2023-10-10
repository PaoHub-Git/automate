*** Settings ***
Resource    .././1.Setting/Setting.robot


*** Variables ***

${EDGEDRIVER_PATH}     C:\\Chromedriver\\msedgedriver.exe
${BROWSER2}    Edge
${PROFILE_PATH}    C:\\Users\\Alonggorn Panthong\\AppData\\Local\\Microsoft\\Edge\\User Data

*** Keywords ***

Open and login2
    [Arguments]    ${Username}    ${Password}
    ${edge_options}=    get_edge_options    ${PROFILE_PATH}    Profile 1
    Open Browser    ${URL}    ${BROWSER2}    executable_path=${EDGEDRIVER_PATH}    options=${edge_options}
    Maximize Browser Window
    Wait Until Element Is Enabled    //*[@id="Login"]
    Input Text    id=username    ${Username}
    Input Text    id=password    ${Password}
    Click Element    id=Login
    Pause Execution    Please enter "Salesforce Authenticator"


*** Tasks ***

opentest
    Open and login2    Username=${Username_uat}    Password=${Password_uat}