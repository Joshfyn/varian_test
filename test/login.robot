*** Settings ***
Documentation   Test collection for login test suite
Resource        ../Resources/common/common.resource
Suite Setup     Prepare browser
Suite Teardown  Close Browser


*** Test Cases ***
Verify that the page title correctly displays when the user navigates to the login URL
    [Documentation]     Verifies that the page title is correctly displayed
    [Tags]              positive
    Go to varian login page
    Verify URL page appears correctly       ${PAGE_TITLE}
    ...                                     expected_text=Connect to your clinic using Noona

Verify that the language list is visible to user
    [Documentation]     Verifies that the list for language option is visiblt to the user
    [Tags]              positive
    Go to varian login page
    Verify URL page appears correctly       ${LANGUAGE_SELECTION}

Verify that the registration link correctly displays when the user navigates to the login URL
    [Documentation]     Verifies that the 'Don't have an account 'is visible to the user to click on
    [Tags]              positive
    Go to varian login page
    Verify URL page appears correctly       ${REGISTRATION_LINK}
    ...                                     expected_text=have an account?

Verify that user cannot login with invalid email address
    [Documentation]     Verifies that the user cannot login by providing invalid email address.
    ...                 NB: It is expected that invalid format return a specific message for invalid email format
    [Tags]              negative        expected_failure
    Go to varian login page
    click login and provide credentials     ${INVALID_EMAIL}
    Verify URL page appears correctly       ${ERROR_MESSAGE_INVALID_CREDENTIAL}
    ...                                     expected_text=email address notvalid

Verify that user cannot login with invalid email address
    [Documentation]     Verifies that the user cannot login by providing non registered user
    [Tags]              negative
    Go to varian login page
    click login and provide credentials     ${NON_EXISTING_USER}
    Verify URL page appears correctly       ${ERROR_MESSAGE_INVALID_CREDENTIAL}
    ...                                     expected_text=Incorrect username or password
