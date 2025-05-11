*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework Faker Library.
Resource         ../resources/keywords.robot
Resource         ../resources/variables.robot


*** Test Cases ***
Generating fake data
    Fake Name
    Fake Email
    Fake Address
    Random Number as Interger
    Random Number not Interger
    Fake Phone
    Fake Text
    Random Element From List
