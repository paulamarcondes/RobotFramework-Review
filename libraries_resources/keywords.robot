*** Settings ***
Documentation    This file contains all custom keywords for the tests. Despite its size, this approach was chosen to consolidate all automation actions in one location for better organization.
Resource         ../libraries_resources/variables.robot
Library          Collections
Library          FakerLibrary
Library          RequestsLibrary



*** Keywords ***

### --- BuiltIn Library --- ###
Log My First Message
    Log    Hello, world!

Both Responses Have To Be Equal
    Should Be Equal    Banana    Banana

The Condition Has To Be True
    Should Be True    ${5} > ${3}

The Item Must Have X Length
    Length Should Be    ${LIST_COLORS}[1]    4
    Log    The color is ${LIST_COLORS}[1] and it has 4 letters

The Value Is Converted To A Number
    Log    Before converting, ${LIST_COLORS}[0] was the color white.
    ${LIST_COLORS}[0]    Convert To Number    5
    Log    Now, we have the number ${LIST_COLORS}[0]
    Log Many    @{LIST_COLORS}

The Variable Now Is
    Log    Before setting the variable, ${LIST_COLORS}[1] was the color pink
    ${LIST_COLORS}[1]=    Set Variable    ${LIST_ANIMALS}[0]
    Log Many    @{LIST_COLORS}

The List Must Have X
    Should Contain    ${LIST_COLORS}[4]    R
    Log    The color ${LIST_COLORS}[4] has the letter R!

Run Keyword Only If Condition Is True
    ${random_number}=    Set Variable    3
    Run Keyword If    ${random_number} < 5    Log    Number is less than 5.
    Run Keyword If    ${random_number} > 5    Log    Number is more than 5.
    Run Keyword If    ${random_number} == 5   Log    Number is 5.
    Log    The number is ${random_number}

Create A List Of Elements
    @{list_dogs}    Create List    Dachshund    Dalmatian    Yorkshire    Poodle    German Shepherd
    Log Many    My favorite dogs are: @{list_dogs}

Log Element By Its Index
    Log    ${LIST_DOGS}[0]
    Log    ${LIST_DOGS}[1]
    Log    ${LIST_DOGS}[2]
    Log    ${LIST_DOGS}[3]
    Log    ${LIST_DOGS}[4]

Log Elements With FOR Loop
    FOR    ${dog}    IN    @{LIST_DOGS}
        Log    The dog breed now is: ${dog}
    END





### --- Collections Library --- ###
Print Element By Index
    ${second_color}=    Get From List    ${LIST_COLORS}    1
    Log    The second color of this list is: ${second_color}

Add Element To List
    Append To List    ${LIST_COLORS}    Cyan
    Log Many    Updated colors list: @{LIST_COLORS}

Remove Element From List
    Remove From List    ${LIST_ANIMALS}    2
    Log Many    Remaining animals: @{LIST_ANIMALS}

Print Keys
    ${dictionary_keys}=    Get Dictionary Keys    ${DIC_CITIES}
    Log    Dictionary keys: ${dictionary_keys}

Print Values
    ${dictionary_values}=    Get Dictionary Values    ${DIC_MOVIES}
    Log    Dictionary values: ${dictionary_values}

Print All Items
    ${all_dic_items}=    Get Dictionary Items    ${DIC_CITIES}
    Log    All dictionary items: ${all_dic_items}

Print All Items with FOR Loop
       FOR    ${key}    ${value}    IN    &{DIC_CITIES}
           Log    Key: ${key}, Value: ${value}
       END

Get Values Using Keys
    ${beautiful_city}=    Get From Dictionary    ${DIC_CITIES}    beautiful
    Log    The most beautiful city in the world is: ${beautiful_city}

Verify If List Has Item
    List Should Contain Value    ${LIST_COLORS}    Orange
    List Should Not Contain Value    ${LIST_COLORS}    Green

Verify If Dictionary Has Item
    Dictionary Should Contain Key    ${DIC_MOVIES}    newest
    Dictionary Should Not Contain Value    ${DIC_MOVIES}    Armageddon





### --- Faker Library --- ###
Generate Fake Name
    ${fake_name}=    Name
    Log    Generated Fake Name: ${fake_name}

Generate Fake Email
    ${fake_email}=    Email
    Log    Generated Fake Email: ${fake_email}

Generate Fake Address
    ${fake_address}=    Address
    Log    Generated Fake Address: ${fake_address}

Generate Random Integer
    ${random_number}=    Random Int    100    999
    Log    Generated Random Integer: ${random_number}

Generate Random Decimal Number
    ${random_decimal}=    Random Number    digits=3
    Log    Generated Random Decimal Number: ${random_decimal}

Generate Fake Phone Number
    ${fake_phone}=    Phone Number
    Log    Generated Fake Phone Number: ${fake_phone}

Generate Fake Short Text
    ${fake_text}=    Text    max_nb_chars=20
    Log    Generated Fake Text (max 20 chars): ${fake_text}

Get Random Element From List
    ${random_color}=    Random Element    ${LIST_COLORS}
    Log    Random Color from List: ${random_color}





### --- Requests Library --- ###
Create Session For Dispatch API
    Create Session    firedispatch_api    ${BASE_URL}
    Log    Session 'firedispatch_api' created successfully at ${BASE_URL}

Generate Random Dispatch Body
    [Documentation]    Generates a dictionary with random dispatch data
    ${incident_id}=    Random Number    digits=3
    ${city}=           City
    ${type}=           Random Element    ${LIST_TYPE}
    ${priority}=       Random Element    ${LIST_PRIORITY}

    &{dispatch}=    Create Dictionary
    ...    incident_id=${incident_id}
    ...    location=${city}
    ...    type=${type}
    ...    priority=${priority}

    Set Global Variable    &{dispatch}
    Log Dictionary    ${dispatch}

Get All Dispatches
    ${response}=    GET On Session    firedispatch_api    /api/dispatches
    Log    The response object from this call is: ${response}

Get A Specific Dispatch
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/2
    Log    The response object from this call is: ${response}

Post A Dispatch With Dictionary
    &{dispatch_body}    Create Dictionary    incident_id=333    location=Downtown    type=Fire    priority=High
    ${response}=    POST On Session    firedispatch_api    /api/dispatch    json=${dispatch_body}
    Log    Status Code: ${response.status_code}
    Log    Response Body: ${response.json()}

Post A Dispatch With Variable
    ${response}=    POST On Session    firedispatch_api    /api/dispatch    json=${dispatch}
    Log    Reason: ${response.reason}
    Log    Response Body: ${response.json()}

Post A Random Dispatch
    ${response}=    POST On Session    firedispatch_api    /api/dispatch    json=${dispatch}
    Log    Reason: ${response.reason}
    Log    Response Body: ${response.json()}

Update Full Dispatch
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/1
    Log    Current dispatch data: ${response.json()}

    &{updated_dispatch}    Create Dictionary    incident_id=311    location=Uptown    type=Fire    priority=Medium
    ${response}=    PUT On Session    firedispatch_api    /api/dispatch/1    json=${updated_dispatch}
    Log    Updated dispatch: ${response.json()}

Update Partial Dispatch
    ${response}=    GET On Session    firedispatch_api    /api/dispatch/2
    Log    Current dispatch data: ${response.json()}

    &{partial_update}    Create Dictionary    incident_id=999
    ${response}=    PATCH On Session    firedispatch_api    /api/dispatch/2    json=${partial_update}
    Log    Updated dispatch: ${response.json()}

Delete A Dispatch
    ${response}=    DELETE On Session    firedispatch_api    /api/dispatch/7
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
    ${response}=    DELETE On Session    firedispatch_api    /api/dispatch/6
    Request Should Be Successful    ${response}
    Log    ${response.json()}