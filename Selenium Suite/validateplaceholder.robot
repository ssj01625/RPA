*** Settings ***
Library      SeleniumLibrary
Library      OperatingSystem
Library      DateTime
Library    String

*** Keywords ***
#Get Name From All Rows
# ${rowcount}         Get Element Count    xpath=//table[@id='example']/tbody/tr
 #       Log To Console    ${rowcount}
 #       FOR    ${counter}    IN RANGE    1    ${rowcount}+1
  #           ${name}        Get Text    xpath=//table[@id='example']/tbody/tr[${counter}]/td[2]
   #           Log To Console    ${name}

      #  END

*** Test Cases ***
TC1
        Append To Environment Variable    Path      ${EXECDIR}${/}driver
        Open Browser     browser=gc
        Maximize Browser Window
        Go To    http://demo.openemr.io/b/openemr/interface/login/login.php?site=default
        ${getuser}      Get Element Attribute    id=authUser    placeholder
        Log To Console    ${getuser}
        Element Attribute Value Should Be    id=authUser   placeholder    Username:
        ${link}      Get Element Attribute    partial link=Acknowledgments      href
        Click Element    partial link=Acknowledgments, Licensing and Certification

TC2
        Append To Environment Variable    Path      ${EXECDIR}${/}driver
        Open Browser     browser=gc
        Maximize Browser Window
        Go To    https://datatables.net/extensions/select/examples/initialisation/checkbox.html
        Set Selenium Implicit Wait    30s
        Select From List By Label    name=example_length        25
        Set Local Variable    ${currename}      ${EMPTY}
        ${rowcount}         Get Element Count    xpath=//table[@id='example']/tbody/tr
        #Evaluate    ${rowcount}+1
        FOR    ${counter}    IN RANGE    1    ${rowcount}+1
        ${name1}        Get Text    xpath=//table[@id='example']/tbody/tr[${counter}]/td[2]
        Log To Console    ${name1}

        ${age}        Get Text    xpath=//table[@id='example']/tbody/tr[${counter}]/td[5]
        Log To Console    ${age}

        IF    '${name1}' == 'Brenden Wagner'
            Click Element    xpath=xpath=//table[@id='example']/tbody/tr[${counter}]/td[1]
        END
        Run Keyword If    '${name1}' == 'Brenden Wagner'
       ...    Click Element    xpath=xpath=//table[@id='example']/tbody/tr[${counter}]/td[1]Keyword
       Exit For Loop If    '${name1}' == 'Brenden Wagner'

       Run Keyword If    '${name1}' == 'Brenden Wagner'
       ...      Set Local Variable  ${currename}  ${name1}
       
       Log To Console    ${currename}
        END


TC3
        Append To Environment Variable    Path      ${EXECDIR}${/}driver
        Open Browser     browser=gc
        Maximize Browser Window
        Go To    https://datatables.net/extensions/select/examples/initialisation/checkbox.html
        Set Selenium Implicit Wait    30s
        Sleep    5s
        FOR    ${counter1}    IN RANGE    1    7
           ${rowcount}         Get Element Count    xpath=//table[@id='example']/tbody/tr
        Log To Console    ${rowcount}
        FOR    ${counter}    IN RANGE    1    ${rowcount}+1
             ${name}        Get Text    xpath=//table[@id='example']/tbody/tr[${counter}]/td[2]
              Log To Console    ${name}

        END
        Click Element    link=Next
        END

TC4
        Append To Environment Variable    Path      ${EXECDIR}${/}driver
        Open Browser     browser=gc
        Maximize Browser Window
        Go To    https://datatables.net/extensions/select/examples/initialisation/checkbox.html
        Set Selenium Implicit Wait    30s
        Sleep    5s
        ${text}        Get Text    id=example_info
        Log To Console    ${text}
        ${text}    Fetch From Right    ${text}     of
        Log To Console    ${text}
        ${text}     Remove String    ${text}     entries
        ${text}      Strip String    ${text}
        Log To Console    ${text}
        ${text}       Convert To Integer    ${text}
        ${text}     Evaluate    math.ceil(${text}/10)
        Log To Console    ${text}

        FOR    ${counter}    IN RANGE    1    ${text}+1
            Log To Console    message{counter}
             
        END


