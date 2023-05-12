*** Settings ***
Library    AppiumLibrary        run_on_failure=No Operation
# Library    SeleniumLibrary      run_on_failure=AppiumLibrary.CapturePageScreenshot

*** Variables ***
${SERVER_URL}     http://localhost:4723/wd/hub
${WAIT_TIMEOUT}   15s
${USER_CPF}    82611104000
${USER_NAME}    "Johnny Zest"
${USER_PHONE}    82611104000
${USER_EMAIL}    "johnnyzestteste@gmail.com"

*** Test Cases ***
Cadastro de Usuário 
    Open Application    ${SERVER_URL}
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Teste
    ...                 app=${EXECDIR}/app/app-release.apk
    ...                 udid=emulator-5554

    # Wait Until Element Is Visible    accessibility_id=button-iniciar    timeout=${WAIT_TIMEOUT}
    # Click Element    accessibility_id=button-iniciar

    Wait Until Element Is Visible    accessibility_id=input-cpf
    Input Text    accessibility_id=input-cpf    ${USER_CPF}

    Wait Until Element Is Visible    accessibility_id=button-cadastro    timeout=30
    Click Element    accessibility_id=button-cadastro

    Wait Until Element Is Visible    accessibility_id=button-accept-terms
    Click Element    accessibility_id=button-accept-terms

    Wait Until Element Is Visible    accessibility_id=input-cpf    timeout=${WAIT_TIMEOUT}
    Input Text    accessibility_id=input-cpf    ${USER_CPF}

    Wait Until Element Is Visible    accessibility_id=input-name    timeout=${WAIT_TIMEOUT}
    Input Text    accessibility_id=input-name    ${USER_NAME}
    Input Text    accessibility_id=input-phone    ${USER_PHONE}
    Input Text    accessibility_id=input-email    ${USER_EMAIL}

    Click Element    accessibility_id=button-continue

    Close Application