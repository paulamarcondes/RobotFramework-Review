*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework BuiltIn Library.
Resource         ../resources/keywords.robot

# Suite Setup
# Suite Teardown


*** Test Cases ***
Logging a message
    Log My First Message

Comparing responses
    Both Responses Have to be Equal

Comparing conditions
    The Condition Has to be True

Verifying item length
    The Item Must Have X Length

Converting something to a number
    The Value is Converted to a Number

Assigning a value to a variable
    The Variable Now is

Checking if list has an item
    The List Must Have X

Executing a keyword only if condition is met
    Run the Keyword Only If