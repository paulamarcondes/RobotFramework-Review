*** Settings ***
Documentation    This file contains all custom keywords for the tests. Despite its size, this approach was chosen to consolidate all automation actions in one location for better organization.
Resource         ../resources/variables.robot
Library          Collections
Library          FakerLibrary
Library          RequestsLibrary



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
    Log    The color is ${LIST_COLORS}[1] and it has 4 letters

The Value is Converted to a Number
    Log    Before converting, ${LIST_COLORS}[0] was the color white.
    ${LIST_COLORS}[0]    Convert To Number    5
    Log    Now, we have the number ${LIST_COLORS}[0]

The Variable Now is
    Log    Before setting the variable, ${LIST_COLORS}[1] was the color pink
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
    Log    The number is ${random_number}

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





### --- Faker Library --- ###
Fake Name
    ${fake_name}=    Name
    Log    Generated Fake Name: ${fake_name}

Fake Email
    ${fake_email}=    Email
    Log    Generated Fake Email: ${fake_email}

Fake Address
    ${fake_address}=    Address
    Log    Generated Fake Address: ${fake_address}

Random Number as Interger
    ${random_number}=    Random Int    100    999
    Log    Generated Number: ${random_number}

Random Number not Interger
    ${random_numberr}=    Random Number    digits=3
    Log    Another Generated Number: ${random_numberr}

Fake Phone
    ${fake_phone}=    Phone Number
    Log    Generated Fake Phone: ${fake_phone}

Fake Text
    ${fake_text}=    Text    max_nb_chars=20
    Log    Generated Text: ${fake_text}

Random Element From List
    ${random_color}=    Random Element    ${LIST_COLORS}
    Log    Element from colors' list: ${random_color}





### --- Requests Library --- ###
Create A Session
    Create Session    firedispatch_api    ${BASE_URL}
    Log    Session created successfully


Get All Dispatches
    ${response}=    GET On Session    firedispatch_api    /api/dispatches
    Log    The response object from this call is: ${response}

Get A Specific Dispatch
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/1
    Log    The response object from this call is: ${response}

Post A Dispatch With Dictionary
    &{dispatch_body}    Create Dictionary    incident_id=333    location=Downtown    type=Fire    priority=High
    ${response}=    POST On Session    firedispatch_api    /api/dispatch    json=${dispatch_body}
    Log    Status Code: ${response.status_code}
    Log    Response Body: ${response.json()}

Post A Dispatch With Variable
    ${response}=    POST On Session    firedispatch_api    /api/dispatch    json=${DISPATCH_BODY}
    Log    Reason: ${response.reason}
    Log    Response Body: ${response.json()}

# Post Random Dispatch


Update Full Dispatch
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/1
    Log    ${response.json()}

    &{updated_dispatch}    Create Dictionary    incident_id=311    location=Uptown    type=Fire    priority=Medium
    ${response}=    PUT On Session    firedispatch_api    /api/dispatch/1    json=${updated_dispatch}
    Log    Status Code: ${response.status_code}
    Log    Response Body: ${response.json()}

Update Partial Dispatch
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/2
    Log    ${response.json()}

    &{updated_dispatch}    Create Dictionary    incident_id=999
    ${response}=    PUT On Session    firedispatch_api    /api/dispatch/2    json=${updated_dispatch}
    Log    Status Code: ${response.status_code}
    Log    Response Body: ${response.json()}

Delete A Dispatch
    ${response}=    DELETE On Session    firedispatch_api    /api/dispatch/8
    Log    Status Code: ${response.status_code}
    Log    Response Body: ${response.json()}

Get Status Code With Response Object
    ${response}=    GET On Session    firedispatch_api    /api/dispatches
    Log     The status code from this call is: ${response.status_code}

Get Status Code With Keyword Argument
    ${response}=    GET On Session    firedispatch_api    /api/dispatches    expected_status=200

Get Status Reason
    ${response}=    GET On Session    firedispatch_api    /api/dispatches
    Log     The status reason from this call is: ${response.reason}

Get Response Body
    ${response}=    GET On Session    firedispatch_api    /api/dispatches
    Log    The response body from this call is: ${response.json()}

Get A Dispatch And Confirm Status
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/1
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.status_code} is indeed '200'

Post A Dispatch And Confirm Status
    &{dispatch_body}    Create Dictionary    incident_id=542    location=Uptown    type=Flood    priority=Medium
    ${response}=    POST On Session    firedispatch_api    /api/dispatch    json=${dispatch_body}
    Status Should Be    201
    Log    ${response.json()}

Get A Dispatch And Confirm Reason
    ${response}=    GET On Session    firedispatch_api    /api/dispatches
    Should Be Equal As Strings    ${response.reason}    OK
    Log    ${response.reason} is indeed 'OK'

Get A Dispatch And Confirm Body
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/1
    Should Contain    ${response.json()}    data
    Log    ${response.json()} indeed contains 'data'

Get A Dispatch And Confirm Body as Dictionary
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/1
    Dictionary Should Contain Key    ${response.json()["data"]}    priority
    Log    ${response.json()["data"]} contains 'priority'

Delete A Dispatch And Confirm If Successful
    ${response}=    DELETE On Session    firedispatch_api    /api/dispatch/5
    Request Should Be Successful    ${response}
    Log    ${response.json()}