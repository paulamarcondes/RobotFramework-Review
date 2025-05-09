*** Settings ***
Documentation    This file lists all the keywords from the test files.
Resource         ../resources/variables.robot
Library          Collections



*** Keywords ***

### --- BuiltIn Library --- ###
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

Create a List of Elements
    @{LIST_DOGS}    Create List    Dachshund    Dalmatian    Yorkshire    Poodle    German Shepherd
    Log Many    My favorite dogs are: @{LIST_DOGS}

Log Element by Its Index
    Log    ${LIST_DOGS}[0]
    Log    ${LIST_DOGS}[1]
    Log    ${LIST_DOGS}[2]
    Log    ${LIST_DOGS}[3]
    Log    ${LIST_DOGS}[4]

Log Elements with FOR Loop
    FOR    ${LIST_DOGS}    IN    @{LIST_DOGS}
        Log    The dog breed now is: ${LIST_DOGS}
    END



### --- Collections Library --- ###
Print Element by Index
    ${second_color}=    Get From List    ${LIST_COLORS}    1
    Log    The second color of this list is: ${second_color}

Add Element to List
    Append To List    ${LIST_COLORS}    Cyan
    Log Many    @{LIST_COLORS}

Remove Element from List
    Remove From List    ${LIST_ANIMALS}    2
    Log Many    Now the list has only 4 animals: @{LIST_ANIMALS}

Verify Specific Item
    Dictionary Should Contain Item    dictionary    key    value

Print Keys
    ${dictionary_keys}=    Get Dictionary Keys    ${DIC_CITIES}
    Log List    ${dictionary_keys}

Print Values
    ${dictionary_values}    Get Dictionary Values    ${DIC_MOVIES}
    Log List    ${dictionary_values}

Print All Items
    ${all_dic_items}    Get Dictionary Items    ${DIC_CITIES}
    Log List    ${all_dic_items}

Print All Items with FOR Loop
       FOR    ${key}    ${value}    IN    &{DIC_CITIES}
           Log    ${key} : ${value}
       END

Get Values Using Keys
    ${beautiful_city}=    Get From Dictionary    ${DIC_CITIES}    beautiful
    Log    The most beautiful city in the world: ${beautiful_city}

Verify If List Has Item
    List Should Contain Value    ${LIST_COLORS}    Orange
    List Should Not Contain Value    ${LIST_COLORS}    Green

Verify If Dictionary Has Item
    Dictionary Should Contain Key    ${DIC_MOVIES}    newest
    Dictionary Should Not Contain Value    ${DIC_MOVIES}    Armageddon