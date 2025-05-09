*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework BuiltIn Library.
Resource         ../resources/keywords.robot



*** Test Cases ***
1.1 Logging a message
    Log My First Message

1.2 Comparing responses
    Both Responses Have to be Equal

1.3 Comparing conditions
    The Condition Has to be True

1.4 Verifying item length
    The Item Must Have X Length

1.5 Converting something to a number
    The Value is Converted to a Number

1.6 Assigning a value to a variable
    The Variable Now is

1.7 Checking if list has an item
    The List Must Have X

1.8 Executing a keyword only if condition is met
    Run the Keyword Only If

1.9 Creting a list
    Create a List of Elements

1.10 Printing a specific element from a list
    Log Element by Its Index
    Log Elements with FOR Loop