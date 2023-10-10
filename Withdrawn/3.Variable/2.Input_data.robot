*** Settings ***

Resource    ..//1.Setting/Setting.robot



*** Variables ***

${FILE_PATH}    D:\\Onbording\\Data_los.xlsx
${MAX_ROW}    10
${CONTINUE_LOOP}  CONTINUE
#${EMPTY}    ""


*** Keywords ***


Read Excel Data
    [Arguments]    ${row}
    Open Workbook    ${FILE_PATH}
    
    ${Ref no_Excel} =    Get Cell Value    ${row}    1

    Close Workbook
    [Return]    ${Ref no_Excel}
    Log    ${Ref no_Excel}

Status_Check
    [Arguments]    ${row}
    Wait Until Element Is Visible   (//lightning-formatted-text[@data-output-element-id="output-field" and @slot="outputField"])[53]
    ${Get_Status} =   Get Text   (//lightning-formatted-text[@data-output-element-id="output-field" and @slot="outputField"])[53]
    Log    ${Get_Status}
    Open Workbook    ${FILE_PATH}
    Set Cell Value   ${row}   2    ${Get_Status}
    Save Workbook
    Close Workbook




Status_Check_2
    [Arguments]    ${row}
    Wait Until Element Is Visible   (//lightning-formatted-text[@data-output-element-id="output-field" and @slot="outputField"])[2]
    ${Get_Status} =   Get Text   (//lightning-formatted-text[@data-output-element-id="output-field" and @slot="outputField"])[2]
    Log    ${Get_Status}
    Open Workbook    ${FILE_PATH}
    Set Cell Value   ${row}   2    ${Get_Status}
    Save Workbook
    Close Workbook