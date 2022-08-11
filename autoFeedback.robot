*** Variables ***
${username}    12345...
${password}    ********
*** Settings ***
Library             SeleniumLibrary
Library             String
Library             Collections
Library    OperatingSystem
Task Setup    Setup chromedriver
Task Teardown       Close Browser


*** Tasks ***
Auto Feedback
    Login    ${username}    ${password}
    Evaluate Subjects
*** Keywords ***
Setup chromedriver
    ${system}=    Evaluate    platform.system()    platform
    Append To Environment Variable    PATH    ${EXECDIR}
    IF    '${system}' == 'Linux'
        Set Environment Variable    webdriver.chrome.driver  ${EXECDIR}/chromedriver
    ELSE
        Set Environment Variable    webdriver.chrome.driver  ${EXECDIR}/chromedriver.exe
    END
    Open Browser    http://fb.dut.udn.vn/PageDangNhap.aspx    chrome
    Set Browser Implicit Wait    200s
Login
    [Arguments]    ${username}    ${password}
    Input Text    id:DN_txtAcc    ${username}
    Input Password    id:DN_txtPass    ${password}
    Click Button    id:QLTH_btnLogin
    Go To    http://fb.dut.udn.vn/PageLopHP.aspx
Evaluate Subjects
    ${subjects}=    Get WebElements    css:.GridCell.Evaluation
    @{ids}=    Create List
    FOR    ${element}    IN    @{subjects}
        ${onclick}=    Set Variable    ${element.get_attribute('onclick')}
        ${id}=    Get Substring    ${onclick}    22    -8
        Append To List    ${ids}    ${id}
    END
    FOR    ${index}    ${id}    IN ENUMERATE    @{ids}
        Log To Console    ${index}
        Log To Console    ${id}
        Go To Evaluate Page    ${id}
        Sleep    2s
    END
Go To Evaluate Page
    [Arguments]    ${id}
    Go To    http://fb.dut.udn.vn/PageDanhGiaCA.aspx?Loai=CK&LopHP=${id}
    ${list_second_answer}=    Get WebElements    xpath://table[@class="quesRadioList"]//tr[2]//input
    FOR    ${answer}    IN    @{list_second_answer}
        Click Element    ${answer}
    END
    Execute JavaScript    window.scrollTo(0, -300)
    ${text_areas}    Get WebElements    xpath://textarea
    FOR    ${area}    IN    @{text_areas}
        Clear Element Text    ${area}
        Press Keys    ${area}    Phù hợp
    END
    Click Button    id:DG_btnXacNhan
    Click Button    //button[contains(@class,'ui-button-text-only')][1]