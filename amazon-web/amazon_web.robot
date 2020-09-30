*** Settings ***
Resource          amazon_web_resources.robot
Library           SeleniumLibrary
Library           String
Library           RequestsLibrary
Library           FakerLibrary
Library           ImapLibrary
Library           DateTime
Library           Collections

***Comments***
Documentation
...               Note here about important points for the cases.
...
...
*** Test Cases ***
Open Amazon Web
    Open Amazon
    [Teardown]    Close Browser

Check Layout
    Open Amazon
    Check Search Bar
    [Teardown]    Close Browser

Check HomePage
    Open Amazon
    Check Discover Amazon
    [Teardown]    Close Browser


Search Product
    Open Amazon
    Check Search Bar
    Input Product Name Search Bar
    Click Search Submit
    Check Search Result
    [Teardown]    Close Browser
