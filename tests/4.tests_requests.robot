*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework Requests Library.
Resource         ../resources/keywords.robot
Resource         ../resources/variables.robot

Suite Setup      Create A Session
Suite Teardown   Delete All Sessions



*** Test Cases ***
3.1 Testing GET endpoints
    Get All Dispatches
    Get A Specific Dispatch

3.2 Testing POST endpoints
    Post A Dispatch With Dictionary
    Post A Dispatch With Variable
    # Post Random Dispatches

3.3 Testing PUT Dispatches
    Update Full Dispatch
    Update Partial Dispatch

3.4 Testing DELETE Dispatches
    Delete A Dispatch

3.5 Testing responses
    Get Status Code With Response Object
    Get Status Code With Keyword Argument
    Get Status Reason
    Get Response Body

3.6 Confirming responses
    Get A Dispatch And Confirm Status
    Post A Dispatch And Confirm Status
    Get A Dispatch And Confirm Reason
    Get A Dispatch And Confirm Body
    Get A Dispatch And Confirm Body as Dictionary
    Delete A Dispatch And Confirm If Successful