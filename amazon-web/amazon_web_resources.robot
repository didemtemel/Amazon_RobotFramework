*** Settings ***
Library           SeleniumLibrary
Library           String
Library           RequestsLibrary
Library           FakerLibrary
Library           ImapLibrary
Library           DateTime
Library           Collections

*** Variables ***

${REMOTE_URL}     localhost:7272     #http://localhost:4444/wd/hub
#${Browser}        %{BROWSER}
${Browser}           chrome

#URL
${LoginURL}                        https://www.amazon.com/

#-- Home Page Locators --#
${homePage.discoverAmazon.field}            xpath=//*[@id="rIPiUqQ7v6ymFnEB8eN4pg"]/div[1]/h2/span

#-- Home Page Texts --#
${homePage.discoverAmazon.text}             Discover Amazon

#-- Layout Locators --#
${layout.searchBar.input}                   xpath=//input[@id='twotabsearchtextbox']
${layout.searchBar.submit.field}            xpath=//div[@class='nav-search-submit nav-sprite']

#-- Layout Texts --#

#-- Search Locators --#
${search.result.toolbar.title.field}        xpath=//h1[@class='a-size-base s-desktop-toolbar a-text-normal']

#-- Search Texts --#
${search.product.text}                      pencil



*** Keywords ***
#Open Amazon#
Open Amazon
    Open Browser    ${LoginURL}    ${Browser}      ${REMOTE_URL}
    Run Keyword And Continue On Failure     Maximize Browser Window

#Check HomePage#
Check Discover Amazon
    Wait Until Page Contains Element    ${homePage.discoverAmazon.field}
    Page Should Contain Element    ${homePage.discoverAmazon.field}
    Element Should Contain    ${homePage.discoverAmazon.field}    ${homePage.discoverAmazon.text}

#Check Layout#
Check Search Bar
    Wait Until Page Contains Element    ${layout.searchBar.input}
    Page Should Contain Element    ${layout.searchBar.input}

#Search Product#
Input Product Name Search Bar
    Click Element    ${layout.searchBar.input}
    Input Text    ${layout.searchBar.input}    ${search.product.text}

Click Search Submit
    Click Element    ${layout.searchBar.submit.field}

Check Search Result
    Wait Until Page Contains Element    ${search.result.toolbar.title.field}
    Page Should Contain Element    ${search.result.toolbar.title.field}
    Element Should Contain    ${search.result.toolbar.title.field}    ${search.product.text}
