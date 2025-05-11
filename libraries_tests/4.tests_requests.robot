*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework Requests Library.
Resource         ../libraries_resources/keywords.robot
Resource         ../libraries_resources/variables.robot

Suite Setup      Create Session For Dispatch API
Suite Teardown   Delete All Sessions



*** Test Cases ***
3.1 Generating Random Dispatch Body
    Generate Random Dispatch Body

3.2 Testing GET Endpoints
    Get All Dispatches
    Get A Specific Dispatch

3.3 Testing POST Endpoints
    Post A Dispatch With Dictionary
    Post A Dispatch With Variable
    Post A Random Dispatch

3.4 Testing PUT Endpoints
    Update Full Dispatch
    Update Partial Dispatch

3.5 Testing DELETE Endpoint
    Delete A Dispatch

3.6 Inspecting Response Details
    Get Status Code With Response Object
    Get Status Code With Keyword Argument
    Get Status Reason
    Get Response Body

3.7 Validating Responses
    Get A Dispatch And Confirm Status
    Post A Dispatch And Confirm Status
    Get A Dispatch And Confirm Reason
    Get A Dispatch And Confirm Body
    Get A Dispatch And Confirm Body As Dictionary
    Delete A Dispatch And Confirm If Successful