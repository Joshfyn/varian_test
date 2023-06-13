*** Settings ***
Documentation   Common keywords collection for all test cases
Library         Browser
Library         String
Variables       locators.yaml
Variables       ../../test_data/data.yaml


*** Keywords ***
Prepare browser
    New Browser     browser=chromium    headless=True

Go to varian login page
    New Page     ${ENV_URL}

Verify URL page appears correctly
    [Arguments]     ${placeholder}      ${expected_text}=None
    Set Test Variable   ${title}        ${placeholder}
    IF      $expected_text is not None
            ${title}     Format String   ${placeholder}     ${expected_text}
    END
    Wait For Elements State      ${title}           state=visible

click login and provide credentials
    [Arguments]     ${credential}
    click           ${home_login_btn}
    Wait For Elements State       ${login_btn}      state=visible
    Fill text       ${username_input}       ${credential.email}
    Fill text       ${pwd_input}            ${credential.password}
    click           ${login_btn}
    Wait For Elements State       ${login_btn}      state=visible
