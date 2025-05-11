*** Settings ***
Documentation    This file explores the most used keywords from the Robot Framework String Library.
Resource         ../libraries_resources/keywords.robot



*** Test Cases ***
5.1 Verifying Two Strings Are The Same (Case Sensitive)
    Strings Should Be Exactly The Same

5.2 Verifying String Contains Substring
    String Should Contain Substring

5.3 Converting Element To String
    Element Is Converted to String

5.4 Verifying String Prefix and Suffix
    String Should Have Specific Prefix and Suffix

5.5 Converting String To Lower Case
    Whole String Is Converted To Lower Case