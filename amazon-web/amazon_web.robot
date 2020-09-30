*** Settings ***
Resource          amazon_web_resources.robot
Library           SeleniumLibrary
Library           String
Library           RequestsLibrary
Library           FakerLibrary
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

Search Product With Spesific Category
    Open Amazon
    Check Search Bar
    Click Search Categories All
    Click Search Specific Category
    Input Product Name Search Bar
    Click Search Submit
    Check Search Specific Category
    Check Search Result
    [Teardown]    Close Browser

Filter by Spesific Category
    Open Amazon
    Click Category Icon
    Check Category Menu
    Click Category Menu Specific Category
#    Check Category Menu Specific Category Title
    Click Category Menu Specific Sub Category
    Check Specific Category Filter
   [Teardown]    Close Browser
