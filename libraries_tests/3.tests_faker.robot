*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework Faker Library.
Resource         ../libraries_resources/keywords.robot
Resource         ../libraries_resources/variables.robot



*** Test Cases ***
3.1 Generating A Fake Name
    Generate Fake Name

3.2 Generating A Fake Email
    Generate Fake Email

3.3 Generating A Fake Address
    Generate Fake Address

3.4 Generating A Random Integer
    Generate Random Integer

3.5 Generating A Random Decimal
    Generate Random Decimal Number

3.6 Generating A Random Date
    Generate Random Date

3.7 Generating A Fake Phone Number
    Generate Fake Phone Number

3.8 Generating A Short Text
    Generate Fake Short Text

3.9 Getting A Random List Item
    Get Random Element From List