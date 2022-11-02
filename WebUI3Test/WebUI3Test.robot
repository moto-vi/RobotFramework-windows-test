*** Settings ***
Resource          ../windows.resource

*** Variables ***
${application}    "C:/Progra~1/WindowsApps/Microsoft.WinUI3ControlsGallery_1.3.15.0_x64__8wekyb3d8bbwe/WinUIGallery.DesktopWap/WinUIGallery.DesktopWap.exe"
${window_title}    WinUI 3 Gallery
${screenshots}    ${CURDIR}/../screenshots/
${references}     ${CURDIR}/../references/

*** Test Cases ***
Text Input Test
    [Setup]    Test Setup
    Given I launch the application
    Then Scroll down the left navigation list
    When Click the image "left_nav_icon_text.png"
    And Click the image "icon_passwordbox.png"
    AND Enter the "password1"
    [Teardown]    Test Teardown
