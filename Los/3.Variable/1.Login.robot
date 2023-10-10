*** Settings ***
Resource    ..//1.Setting/Setting.robot

*** Variables ***


${CHROMEDRIVER_PATH}    C:\\Chromedriver\\chromedriver.exe
${BROWSER}    Chrome
${PROFILE_PATH}    C:\\Users\\Alonggorn Panthong\\AppData\\Local\\Google\\Chrome\\User Data
${URL}    https://cardxscb--uat.sandbox.my.salesforce.com/ 
#${URL}    https://cardxscb--sit2.sandbox.lightning.force.com/


#User&Pass login   SIT
#${Username}    narintara.pakaew@cardx.sit2
#${Password}    Scb@112233!!!!
${Ref no}      BT2023100900092


${Saraly}    50000

### UAT
${Username}    Alonggorn.p@cardx.uat 
${Password}    Paohub1993#


*** Variables ***

${STATUS_Prescreening}    //*[text()="Pending-Prescreening"]
${STATUS_Income Maker}    //*[text()="Pending-IncomeMaker"]
${STATUS_Income Checker}    //*[text()="Pending-IncomeChecker"]
${STATUS_WebVerification}    //*[text()="Pending-WebVerification"]

${NEXT_BUTTON}       //div[@class='insext-btn' and @title='Show Salesforce details (Alt+I / Shift+Alt+I)']


#${Click Ref no}    //span/mark[contains(text(), '${Ref no_Excel}')]



###
#${CHEVRON_XPATH}    //button[@title='Actions for ${Ref no_Excel} | Loan Application']
${REFRESH_XPATH}    //ul[@role='menu']//li[@title='Refresh Tab']/a/span[text()='Refresh Tab']



${PENDING_XPATH_Pending-IncomeMaker}    //*[text()='Pending-IncomeMaker']
${PENDING_XPATH_Pending-IncomeChecker}    //*[text()='Pending-IncomeChecker']
${PENDING_XPATH_Pending-WebVerification}    //*[text()='Pending-WebVerification']
${PENDING_XPATH_Resolved-Completed}    //*[text()='Resolved-Completed']
${PENDING_XPATH_Pending-PotentialMatch}    //*[text()="Pending-PotentialMatch"]




