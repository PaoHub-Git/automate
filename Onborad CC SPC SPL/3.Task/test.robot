*** Settings ***

Resource    ..//1.Setting/Setting.robot

*** Variables ***
${BROWSER}    Chrome
${URL}    file:///D:/automate/Setup/test.html

*** Test Cases ***
Open Local HTML File
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    css=div > div > img[alt="cardXicon.png"]
    Execute JavaScript    document.querySelector('div > div > img[alt="cardXicon.png"]').nextElementSibling.textContent = '';
    Execute JavaScript    document.getElementById('selectImage').removeAttribute('hidden');
    Choose File    id=selectImage    D:\\test.jpg