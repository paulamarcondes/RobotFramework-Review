*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework BuiltIn Library.
Resource         ../libraries_resources/keywords.robot



*** Test Cases ***
1.1 Logging A Message
    Log My First Message

1.2 Comparing Responses
    Both Responses Have To Be Equal

1.3 Comparing Conditions
    The Condition Has To Be True

1.4 Verifying Item Length
    The Item Must Have X Length

1.5 Converting Something To A Number
    The Value Is Converted To A Number

1.6 Assigning A Value To A Variable
    The Variable Now Is

1.7 Checking If List Has An Item
    The List Must Have X

1.8 Executing A Keyword Only If Condition Is Met
    Run Keyword Only If Condition Is True

1.9 Creting A List
    Create A List Of Elements

1.10 Printing A Specific Element From A List
    Log Element By Its Index
    Log Elements With FOR Loop