*** Settings ***
Library  DateTime
Library  SeleniumLibrary
Library  OperatingSystem

*** Test Cases ***
TC1 Get Datetime
     ${Date1}     Get Current Date
     Log To Console    ${Date1}

TC2 Print Name
     ${name}     Set Variable    sonali
     Log To Console    ${name}
     Set Local Variable    ${name1}     sonali1
     Log To Console    ${name1}

TC3 Launch Browser
     Append To Environment Variable    Path    ${EXECDIR}${/}driver
     Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default     browser=gc
     Maximize Browser Window
     Set Selenium Implicit Wait    30s
     Input Text    id=authUser    admin
     Input Password    id=clearPass    pass
     Select From List By Label    name=languageChoice    English (Indian)
     Click Element    xpath=//button[@type='submit']
     Wait Until Page Contains   text= Flow Board
     ${actualTitle}     Get Title
     Log     ${actualTitle} 
     Log To Console     ${actualTitle}
     Log To Console    Get Title
     Title Should Be    OpenEMR
     Close Browser


TC4
     Log To Console    ${TEST_NAME}
     Log To Console    ${EXECDIR}
     Log To Console    ${CURDIR}
     Log To Console    ${TEMPDIR}
     Log To Console    ${EXECDIR}\\driver
     Log To Console    ${EXECDIR}${/}driver

TC5
     Append To Environment Variable    Path    ${EXECDIR}${/}driver
     Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default     browser=gc
     Maximize Browser Window
     Set Selenium Implicit Wait    30s
     Input Text    id=authUser    admin
     Input Password    id=clearPass    pass
     Select From List By Label    name=languageChoice    English (Indian)
     Click Element    xpath=//button[@type='submit']
     Wait Until Page Contains   text= Flow Board
     ${actualTitle}     Get Title
     IF    '${actualTitle}' == 'OpenEMR'
         Log To Console    pass
     ELSE
         Log To Console    fail
     END
     ${location}     Get Location
     Mouse Over    xpath=//div[text()='Patient/Client']
     Click Element    xpath=//div[text()='Patients']
     Select Frame    name=fin
     Click Element    id=create_patient_btn1
     Unselect Frame
     Select Frame    name=pat
     Input Text    id=form_fname    sonali
     Input Text    id=form_lname    das
     Input Text    id=form_DOB    2021-07-07
     Select From List By Label    id=form_sex    Female
     Click Element    id=create
     Unselect Frame
     Select Frame    xpath=//iframe[@id='modalframe']
     Click Element    xpath=//input[@value='Confirm Create New Patient']
     Unselect Frame
     #${alertext}     Handle Alert    action=LEAVE    timeout=50s
     ${alertext}     Handle Alert       timeout=50s
     Log To Console    ${alertext}
     Click Element    class=closeDlgIframe
     Select Frame    xpath=//iframe[@name='pat']
     ${getText}     Get Text    //h2[contains(text(),'Record')]
     Log    ${getText}
     Log To Console    ${getText}
     Element Text Should Be    //h2[contains(text(),'Record')]    Medical Record Dashboard - Sonali Das
     Element Should Contain    //h2[contains(text(),'Record')]    Sonali
     Unselect Frame
     Capture Page Screenshot        ${TEST_NAME}_{index}.png
     [Teardown]     Close Browser

TC6
     Append To Environment Variable    Path    ${EXECDIR}${/}driver
     Open Browser    url=https://magento.com/     browser=gc
     Click Element    xpath=//span[contains(text(),'Sign in')]
     Input Text    id=email    balaji0017@gmail.com
     Input Text    id=pass    balaji@12345
     Click Element    id=send2
     ${getTitle}     Get Title
     Log To Console     ${getTitle}
     Click Element    xpath=//a[contains(text(),'Log Out')]
     [Teardown]       Close Browser

TC7
     Append To Environment Variable    Path    ${EXECDIR}${/}driver
     Open Browser    url=https://www.redbus.in/    browser=gc
     Maximize Browser Window
     Click Element    id=signin-block
     Click Element    id=signInLink
     Select Frame    xpath=//iframe[@class='modalIframe']
     Input Text       id=mobileNoInp    787878
     Unselect Frame
     [Teardown]     Close Browser

TC8
        Append To Environment Variable    Path      ${EXECDIR}${/}driver
        Open Browser    url=https://www.pepperfry.com/      browser=gc
        Maximize Browser Window
        Input Text    id=search    bedsheet
        Click Element    id=searchButton
        Set Selenium Implicit Wait    100s
        Click Element    xpath=//div[@id='regPopUp']/a[@class='popup-close']
        Click Element    xpath=//a[@class='clip__filter-search-icon']
        Input Text    name=Brand search    Sleep Dove
        Click Element   xpath=//label[@for='brandsnameSleep_Dove']
        Set Selenium Implicit Wait    30s
        Scroll Element Into View    xpath=//a[contains(text(),'100% Cotton 300TC')]
        Set Selenium Implicit Wait    100s
        Click Element    xpath=//span[contains(text(),'845')]
        Set Selenium Implicit Wait    30s
        Click Element    xpath=(//a[contains(@href,'100-cotton-king-size-bedsheet-set-of-3')]/following::a[contains(text(),'Add To Cart')])[1]
        Scroll Element Into View    xpath=//a[@class='cart_bar']
        Click Element    xpath=//a[@class='cart_bar']
        Click Element    id=webklipper-publisher-widget-container-notification-close-div
        Scroll Element Into View    link=Proceed to pay securely
        Click Element    link=Proceed to pay securely
        Scroll Element Into View    link=PLACE ORDER
        Click Element    link=PLACE ORDER
        Input Text    id=name    sonali
        Scroll Element Into View    xpath=(//input[@id='mobile']/following::div[@class='error'])[1]
        ${text}     Get Text    xpath=(//input[@id='mobile']/following::div[@class='error'])[1]
        Log To Console    ${text}




















