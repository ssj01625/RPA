*** Settings ***
Library      SeleniumLibrary
Library      OperatingSystem
Library      DateTime

*** Test Cases ***
TC1
        Append To Environment Variable    Path      ${EXECDIR}${/}driver
        Open Browser     browser=gc
        Maximize Browser Window
        Go To    https://www.db4free.net/
        ${parenturl}          Get Location
        Log To Console    ${parenturl}
        ${title}         Get Title
        Log To Console    ${title}
        Click Element    link=phpMyAdmin »
        #Switch Window    locator=NEW
        Switch Window     phpMyAdmin
        ${title1}         Get Title
        Log To Console    ${title1}
        Select From List By Label    id=sel-lang        English (United Kingdom)
        Input Text      id=input_username    db123
        Input Text      id=input_password    test123
        ${url}          Get Location
        Log To Console    ${url}
        Click Element    id=input_go
        #${message}      Get Text    xpath=//div[@id='js-https-mismatch']/following-sibling::div[@class='alert alert-danger']
        ${message}      Get Text    xpath=(//div[@role='alert'])[2]
        Log To Console    ${message}
        Switch Window       MAIN
        ${Text}         Get Text    class=col-sm-9
        Log To Console    ${Text}
        Close Window
