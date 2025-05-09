*** Settings ***
Documentation    This file lists all the keywords from the test files.
Resource         ../resources/variables.robot
Library          Collections



*** Keywords ***
Log My First Message
    Log    Hello, world!

Both Responses Have to be Equal
    Should Be Equal    Banana    Banana

The Condition Has to be True
    Should Be True    ${5} > ${3}

The Item Must Have X Length
    Length Should Be    ${LIST_COLORS}[1]    4
    Log    The color is ${LIST_COLORS}[1] and it has 4 letters.

The Value is Converted to a Number
    Log    Before converting, ${LIST_COLORS}[0] was the color white.
    ${LIST_COLORS}[0]    Convert To Number    5
    Log    Now, we have the number ${LIST_COLORS}[0].

The Variable Now is
    Log    Before setting the variable, ${LIST_COLORS}[1] was the color pink.
    ${LIST_COLORS}[1]=    Set Variable    ${LIST_ANIMALS}[0]
    Log Many    @{LIST_COLORS}

The List Must Have X
    Should Contain    ${LIST_COLORS}[4]    R
    Log    The color ${LIST_COLORS}[4] has the letter R!

Run the Keyword Only If
    ${random_number}=    Set Variable    3
    Run Keyword If    ${random_number} < 5    Log    Number is less than 5.
    Run Keyword If    ${random_number} > 5    Log    Number is more than 5.
    Run Keyword If    ${random_number} == 5   Log    Number is 5.
    Log    The number is ${random_number}.