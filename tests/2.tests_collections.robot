*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework Collections Library.
Resource         ../resources/keywords.robot

# Suite Setup
# Suite Teardown


*** Test Cases ***
2.1 Operating lists
    Print Element by Index
    Add Element to List
    Remove Element from List

2.2 Operating dictionaries
    Print Keys
    Print Values
    Print All Items
    Print All Items with FOR Loop

2.3 Getting values from dictionary
    Get Values Using Keys

2.4 Containing Items
    Verify If List Has Item
    Verify If Dictionary Has Item