*** Settings ***

Resource    ..//1.Setting/Setting.robot



*** Variables ***

${NEXT_BUTTON}       //div[@class='insext-btn' and @title='Show Salesforce details (Alt+I / Shift+Alt+I)']
${CHROMEDRIVER_PATH}    C:\\CHROMEDRIVER\\chromedriver.exe
${BROWSER}    gc
${PROFILE_PATH}    C:\\Users\\Work\\AppData\\Local\\Google\\Chrome\\User Data

${URL}    https://cardxscb--uat.sandbox.my.salesforce.com/ 
#${URL}    https://cardxscb--sit2.sandbox.lightning.force.com/
${Check status Pending-DataMaker}    //*[text()="Pending-DataMaker"]
${Check status Pending-DataChecker}    //*[text()="Pending-DataChecker"]
${Check status Pending-IncomeMaker}    //*[text()="Pending-IncomeMaker"]
${Check status Pending-IncomeChecker}    //*[text()="Pending-IncomeChecker"]
${Check status Pending-WebVerrification}    //*[text()="Pending-WebVerification"]
${REFRESH_XPATH}    //ul[@role='menu']//li[@title='Refresh Tab']/a/span[text()='Refresh Tab']
@{BUILDING_NAMES}   อาคาร A   อาคาร B   อาคาร C   อาคาร D   อาคาร E
${income}    100000
${Credit limit}    250000

#User&Pass login

${Username_sit}    narintara.pakaew@cardx.sit2
${Password_sit}    Scb@112233!!!!

${Username_uat}    patchaya.in@cardx.uat
${Password_uat}    @Test2542

#${Username_uat}    mongkhon.k.admin@cardx.uat
#${Password_uat}    PECKKUNG@2542

# ${Username_uat}    Alonggorn.p@cardx.uat 
# ${Password_uat}    Paohub1993#

${Ref no_manaul}    DP2023102500030













*** Variables ***

${EDGEDRIVER_PATH}     C:\\Chromedriver\\msedgedriver.exe
${BROWSER2}    Edge
${PROFILE_PATH}    C:\\Users\\Alonggorn Panthong\\AppData\\Local\\Microsoft\\Edge\\User Data