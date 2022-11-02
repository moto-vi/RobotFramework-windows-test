*** Settings ***
Library           Collections
Library           Screenshot
Library           ImageHorizonLibrary
Library           AutoItLibrary
Library           libs/system.py
Library           libs/test.py

*** Keywords ***
I launch the application
    Launch Application    ${application}
    Wait For Active Window    ${window_title}    \    10
    ${x}    Win Get Pos X    ${window_title}
    ${y}    Win Get Pos Y    ${window_title}
    ${height}    Win Get Pos Height    ${window_title}
    ${width}    Win Get Pos Width    ${window_title}
    ${rect}    Create Dictionary    x=${x}    y=${y}    width=${width}    height=${height}
    Set Global Variable    ${window_rect}    ${rect}

Test Setup
    Set Reference Folder    ${references}
    Set Screenshot Folder    ${screenshots}
    initFolder    ${screenshots}

Test Teardown
    Sleep    1
    ${time}    Get Time    epoch
    ${screenshot_path}    Set Variable    ${screenshots}${time}.png
    Get Active Window Image    ${screenshot_path}
    Win Close    ${window_title}

Scroll down the left navigation list
    ${pos}    getPos_LeftNavigationList    ${window_rect}
    Log    ${pos}
    ${x}    Get From List    ${pos}    0
    ${y}    Get From List    ${pos}    1
    Mouse Move    ${x}    ${y}
    Mouse Wheel    down
    Sleep    1

Click the image "${image}"
    Click Image    ${image}
    Sleep    1

Click the text "${text}"
    Control Click    ${window_title}    ${text}    ${text}
    Sleep    1

Enter the "${text}"
    Type With Keys Down    ${text}
