*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework Collections Library.
Resource         ../libraries_resources/keywords.robot



*** Test Cases ***
2.1 Operating Lists
    Print Element By Index
    Add Element To List
    Remove Element From List

2.2 Operating Dictionaries
    Print Keys
    Print Values
    Print All Items
    Print All Items With FOR Loop

2.3 Getting Values From Dictionary
    Get Values Using Keys

2.4 Verifying Contained Items
    Verify If List Has Item
    Verify If Dictionary Has Item